from django.db.models import Q
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from spotify.models import Song, Playlist, PlaylistSongs, SpotifyUser
import pandas as pd
from django.db import connection

def submit_playlist(request):
    input_name = request.POST.get('play_name', 'ERROR')
    in_playlist = request.POST.getlist('songs[]')

    user_query = Playlist.objects.filter(Q(playlistName=input_name) & Q(createdBy=request.user.username)).values()

    if not user_query:

        id = Playlist.objects.order_by('playlistID').last().playlistID + 1

        new_playlist = Playlist(playlistID = id, playlistName=input_name, createdBy=request.user)
        new_playlist.save()
        for song in in_playlist:
            songID = int(song)
            songInstance = Song.objects.filter(Q(songID=songID))[0]
            playlistInstance = Playlist.objects.filter(Q(playlistID=id))[0]
            new_pair = PlaylistSongs(songID= songInstance, playlistID=playlistInstance)
            new_pair.save()
        return HttpResponseRedirect('/user_home')

    else:
        return HttpResponseRedirect('/create_playlist')


def create(request):
    items = {}
    songs = Song.objects.values()
    items['songs'] = songs

    return render(request, 'spotify/create_playlist.html', items)


def view(request):
    items = {}
    user_playlists = Playlist.objects.filter(Q(createdBy=request.user.username)).values()
    other_playlists = Playlist.objects.filter(~Q(createdBy=request.user.username)).values()
    items['user_playlists'] = user_playlists
    items['other_playlists'] = other_playlists

    return render(request, 'spotify/view_playlist.html', items)

def single_viewer(request):
    items = {}
    id = request.path.split('=')[-1]
    playlist_songs = PlaylistSongs.objects.filter(Q(playlistID=id)).values()
    playlist_songs_df = pd.DataFrame.from_records(playlist_songs)

    songs = Song.objects.values('songID', 'title', 'artist')
    if playlist_songs:
        songs_df = pd.DataFrame.from_records(songs)
        full_playlist_results = playlist_songs_df.merge(
            songs_df,
            how='inner',
            left_on='songID_id',
            right_on='songID'
        ).to_dict()
        full_playlist = []
        for x in range(0, len(full_playlist_results['title'])):
            full_playlist.append(
                'Song Title: ' + full_playlist_results['title'][x] + ', Artist: ' + full_playlist_results['artist'][x]
            )
        items['songs'] = full_playlist
    else:
        items['songs'] = ['No songs in playlist']
    playlist_details = Playlist.objects.filter(Q(playlistID=id)).values()[0]
    items['playlist'] = playlist_details

    if playlist_details['createdBy_id'] == request.user.username:
        items['edit'] = True
    else:
        items['edit'] = False

    return render(request, 'spotify/playlist.html', items)


def edit(request):
    items = {}
    id = request.path.split('=')[-1]
    playlist_details = Playlist.objects.filter(Q(playlistID=id)).values()[0]
    items['playlist'] = playlist_details

    cursor = connection.cursor()
    try:
        cursor.callproc('spotify_copycatDB.in_playlist', [id])

        items['songs'] = cursor.fetchall()
    finally:
        cursor.close()

    return render(request, 'spotify/playlist_edit.html', items)


def update(request):
    id = request.POST['playlist_id']
    new_title = request.POST['playlist_title']
    post_to_update = Playlist.objects.filter(Q(playlistID=id)).values()[0]
    user = SpotifyUser.objects.filter(Q(username=post_to_update['createdBy_id']))[0]
    delete = Playlist.objects.filter(Q(playlistID=id))
    delete.delete()
    post_to_save = Playlist(
        playlistID = post_to_update['playlistID'],
        playlistName = new_title,
        createdBy = user
    )
    post_to_save.save()
    return HttpResponseRedirect('/view_playlist')

def delete_screen(request, id):
    items = {}

    playlist = Playlist.objects.filter(Q(playlistID=id)).values()[0]
    items['playlist'] = playlist

    return render(request, 'spotify/delete_screen.html', items)

def remove(request, id):
    Playlist.objects.filter(playlistID=id).delete()
    return HttpResponseRedirect('/view_playlist')