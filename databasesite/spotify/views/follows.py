from django.http import HttpResponseRedirect
from spotify.models import UserFollow


def update_follows(request):
    follows = request.POST.getlist('artists[]')
    to_delete = UserFollow.objects.filter(username=request.user.username)
    to_delete.delete()
    for artist in follows:
        to_save = UserFollow(username=request.user.username, artist=artist)
        to_save.save()
    return HttpResponseRedirect('/user_home')