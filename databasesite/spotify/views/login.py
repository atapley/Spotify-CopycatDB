from django.shortcuts import render


def login_screen(request):
    items = {}
    return render(request, 'spotify/login.html', items)