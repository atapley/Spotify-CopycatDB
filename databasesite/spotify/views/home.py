from django.shortcuts import render


def startscreen(request):
    items = {}
    return render(request, 'spotify/home.html', items)