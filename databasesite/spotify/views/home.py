from django.db.models import Q
from django.http import HttpResponseRedirect
from django.shortcuts import render
from spotify.models import SpotifyUser
from django.contrib.auth import get_user_model, login

UserModel = get_user_model()


def startscreen(request):
    #print(request.user)
    #print(request.user.username)
    items = {}
    return render(request, 'spotify/home.html', items)

def login_test(request):
    username = request.POST['username']
    password = request.POST['password']
    user_query = SpotifyUser.objects.filter(Q(username=username) & Q(password=password)).values()
    if user_query:
        user = UserModel._default_manager.get_by_natural_key(username)
        login(request, user)
        return HttpResponseRedirect('/user_home')
    else:
        return HttpResponseRedirect('/')
