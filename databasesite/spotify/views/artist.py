from django.db.models import Q
from django.shortcuts import render
from django.db import connection
from spotify.models import UserFollow, SpotifyUser


def catalog(request):
    items = {}

    cursor = connection.cursor()
    try:
        cursor.callproc('spotify_copycatDB.artist_catalog')

        artists = cursor.fetchall()
        artist_list = []
        user_follows = []
        follows_artist = UserFollow.objects.filter(Q(username=request.user.username)).values('artist')
        first_name = SpotifyUser.objects.filter(Q(username=request.user.username)).values()[0]['firstName']
        items['firstName'] = first_name
        for artist in follows_artist:
            user_follows.append(artist['artist'])
        for tupl in artists:
            if tupl[0] in user_follows:
                artist_list.append({'artist': tupl[0], 'genre': tupl[1], 'liked': True})
            else:
                artist_list.append({'artist': tupl[0], 'genre': tupl[1], 'liked': False})
        items['artists'] = artist_list

    finally:
        cursor.close()

    return render(request, 'spotify/artist_catalog.html', items)
