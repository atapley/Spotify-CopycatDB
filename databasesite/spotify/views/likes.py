from django.http import HttpResponseRedirect
from spotify.models import UserLikes


def update_likes(request):
    likes = request.POST.getlist('songs[]')
    to_delete = UserLikes.objects.filter(username=request.user.username)
    to_delete.delete()
    for like in likes:
        to_save = UserLikes(username=request.user.username, songID=int(like))
        to_save.save()
    return HttpResponseRedirect('/user_home')
