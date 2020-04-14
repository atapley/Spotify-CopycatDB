from django.shortcuts import render
from spotify.models import SpotifyUser
from datetime import date
from django.db.models import Q
from django.http import HttpResponseRedirect
from django.contrib.auth import get_user_model, login

UserModel = get_user_model()


def signup_screen(request):
    items = {}
    return render(request, 'spotify/signup.html', items)

def create_account(request):
    input_user = request.POST.get('username', 'ERROR')
    input_pass = request.POST.get('password', 'ERROR')
    input_name = request.POST.get('first_name', 'ERROR')
    input_date = date.today().strftime('%Y-%m-%d')

    if ' ' in input_user or ' ' in input_pass:
        items = {}
        items['error_message'] = True
        return render(request, 'spotify/signup.html', items)

    user_query = SpotifyUser.objects.filter(Q(username=input_user)).values()

    if not user_query:

        new_user = SpotifyUser(username = input_user, password = input_pass, firstName = input_name, dateJoined = input_date)
        new_user.save()

        first_name = SpotifyUser.objects.filter(Q(username=input_user)).values()[0]['firstName']

        user = UserModel._default_manager.get_by_natural_key(input_user)
        login(request, user)
        return HttpResponseRedirect('/user_home/' + first_name)

    else:
        items = {}
        items['error_message_2'] = True
        return render(request, 'spotify/signup.html', items)
