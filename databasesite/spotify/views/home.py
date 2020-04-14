from django.db.models import Q
from django.http import HttpResponseRedirect
from django.shortcuts import render
from spotify.models import SpotifyUser
from django.contrib.auth import get_user_model, login

UserModel = get_user_model()


def startscreen(request, name):
    items = {}
    items['user'] = name
    return render(request, 'spotify/home.html', items)

def login_test(request):
    username = request.POST['username']
    password = request.POST['password']

    user_query = SpotifyUser.objects.filter(Q(username=username) & Q(password=password)).values()
    if user_query:
        first_name = SpotifyUser.objects.filter(Q(username=username)).values()[0]['firstName']
        user = UserModel._default_manager.get_by_natural_key(username)
        login(request, user)
        return HttpResponseRedirect('/user_home/' + first_name)
    else:
        items = {}
        items['error_message'] = True
        return render(request, 'spotify/login.html', items)
