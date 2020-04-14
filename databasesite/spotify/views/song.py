from django.db.models import Q
from django.shortcuts import render
from spotify.models import Song, UserLikes, SpotifyUser

def catalog(request):
    items = {}

    songs = Song.objects.values()
    user_likes = UserLikes.objects.filter(Q(username=request.user.username)).values()
    user_likes_ids = []

    first_name = SpotifyUser.objects.filter(Q(username=request.user.username)).values()[0]['firstName']
    items['firstName'] = first_name
    for song in user_likes:
        user_likes_ids.append(song['songID_id'])
    for song in songs:
        if song['songID'] in user_likes_ids:
            song['liked'] = True
        else:
            song['liked'] = False
    items['songs'] = songs

    return render(request, 'spotify/song_catalog.html', items)