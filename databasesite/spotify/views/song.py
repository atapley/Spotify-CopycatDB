from django.shortcuts import render
from spotify.models import Song
from datetime import date
from django.db.models import Q
from django.http import HttpResponseRedirect


def catalog(request):
    items = {}

    songs = Song.objects.values()
    items['songs'] = songs

    return render(request, 'spotify/song_catalog.html', items)