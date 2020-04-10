from django.shortcuts import render
from spotify.models import Song

def catalog(request):
    items = {}

    songs = Song.objects.values()
    items['songs'] = songs

    return render(request, 'spotify/song_catalog.html', items)