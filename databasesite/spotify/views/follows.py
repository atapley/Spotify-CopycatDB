from django.http import HttpResponseRedirect
from spotify.models import UserFollow, Artist, SpotifyUser
from django.db.models import Q

def update_follows(request):
    follows = request.POST.getlist('artists[]')
    to_delete = UserFollow.objects.filter(username=request.user.username)
    first_name = SpotifyUser.objects.filter(Q(username=request.user.username)).values()[0]['firstName']
    to_delete.delete()
    for artist in follows:
        artistInstance = Artist.objects.filter(Q(artistName=artist))[0]
        to_save = UserFollow(username=request.user, artist=artistInstance)
        to_save.save()
    return HttpResponseRedirect('/user_home/' + first_name)