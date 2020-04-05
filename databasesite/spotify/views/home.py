from django.db.models import Q
from django.http import HttpResponseRedirect
from django.shortcuts import render
from spotify.models import SpotifyUser
from django.contrib.auth import authenticate


def startscreen(request):
    print(request.user)
    items = {}
    return render(request, 'spotify/home.html', items)

def login(request):
    username = request.data.get('username')
    password = request.data.get('password')
    user_query = SpotifyUser.objects.filter(Q(username=username) & Q(password=password)).values()[0]
    if user_query:
        user = authenticate(username=username, password=password)
        return HttpResponseRedirect('/home')
    else:
        return HttpResponseRedirect('/')
