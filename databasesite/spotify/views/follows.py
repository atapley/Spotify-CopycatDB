from django.http import HttpResponseRedirect
from spotify.models import UserFollow, Artist
from django.db.models import Q

def update_follows(request):
    follows = request.POST.getlist('artists[]')
    to_delete = UserFollow.objects.filter(username=request.user.username)
    to_delete.delete()
    for artist in follows:
        artistInstance = Artist.objects.filter(Q(artistName=artist))[0]
        to_save = UserFollow(username=request.user, artist=artistInstance)
        to_save.save()
    return HttpResponseRedirect('/user_home')