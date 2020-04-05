from django.shortcuts import render
from spotify.models import SpotifyUser
from datetime import date
from django.db.models import Q
from django.http import HttpResponseRedirect


def signup_screen(request):
    items = {}
    return render(request, 'spotify/signup.html', items)

def create_account(request):
    input_user = request.POST.get('username', 'ERROR')
    input_pass = request.POST.get('password', 'ERROR')
    input_name = request.POST.get('first_name', 'ERROR')
    input_date = date.today().strftime('%Y-%m-%d')

    user_query = SpotifyUser.objects.filter(Q(username=input_user)).values()

    if not user_query:

        new_user = SpotifyUser(username = input_user, password = input_pass, firstName = input_name, dateJoined = input_date)
        new_user.save()
        return HttpResponseRedirect('/')

    else:
        return HttpResponseRedirect('/signup')
