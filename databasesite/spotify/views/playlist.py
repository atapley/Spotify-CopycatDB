from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render
from spotify.models import Song, Playlist, PlaylistSongs
import pandas as pd

def submit(request):
    return HttpResponse('TEST Submission response page (submissions not yet working)')


def create(request):
    items = {}
    songs = Song.objects.values()
    items['songs'] = songs

    return render(request, 'spotify/create_playlist.html', items)


def view(request):
    items = {}
    #Playlist.objects.raw('SELECT * FROM spotify_Playlist WHERE createdBy = \'User1\'')
    playlists = Playlist.objects.values()
    items['playlists'] = playlists

    return render(request, 'spotify/view_playlist.html', items)

def single_viewer(request):
    items = {}

    id = request.path.split('=')[-1]
    playlist_songs = PlaylistSongs.objects.filter(Q(playlistID=id)).values()
    playlist_songs_df = pd.DataFrame.from_records(playlist_songs)
    songs = Song.objects.values('songID', 'title', 'artist')
    songs_df = pd.DataFrame.from_records(songs)
    full_playlist_results = playlist_songs_df.merge(
        songs_df,
        how='inner',
        on='songID'
    ).to_records()
    full_playlist = []
    for x in full_playlist_results:
        full_playlist.append('Song Title: ' + x[-1] + ', Artist: ' + x[-2])

    playlist_details = Playlist.objects.filter(Q(playlistID=id)).values()[0]
    items['playlist'] = playlist_details

    items['songs'] = full_playlist

    return render(request, 'spotify/playlist.html', items)

