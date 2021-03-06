from django.http import HttpResponseRedirect
from spotify.models import UserLikes, Song, SpotifyUser
from django.db.models import Q


def update_likes(request):
    likes = request.POST.getlist('songs[]')
    to_delete = UserLikes.objects.filter(username=request.user.username)
    first_name = SpotifyUser.objects.filter(Q(username=request.user.username)).values()[0]['firstName']
    to_delete.delete()
    for like in likes:
        songID = int(like)
        songInstance = Song.objects.filter(Q(songID=songID))[0]
        to_save = UserLikes(username=request.user, songID=songInstance)
        to_save.save()
    return HttpResponseRedirect('/user_home/' + first_name)
