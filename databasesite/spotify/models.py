from django.db import models
from django.contrib.auth.models import UserManager

class Genre(models.Model):
    genreID = models.IntegerField(primary_key=True)
    genre = models.CharField(max_length=50)

class Artist(models.Model):
    artistName = models.CharField(max_length=50, primary_key=True)
    mainGenre = models.ForeignKey(Genre, on_delete=models.PROTECT, db_column='mainGenre', to_field='genreID')

class Album(models.Model):
    albumID = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=50)
    artist = models.ForeignKey(Artist, on_delete=models.CASCADE, db_column='artist', to_field='artistName')
    dateReleased = models.DateField()

class Song(models.Model):
    songID = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=50)
    duration = models.IntegerField()
    genreID = models.ForeignKey(Genre, on_delete=models.PROTECT, db_column='genreID', to_field='genreID')
    artist = models.ForeignKey(Artist, on_delete=models.CASCADE, db_column='artist', to_field='artistName')
    albumID = models.ForeignKey(Album, on_delete=models.CASCADE, db_column='albumID', to_field='albumID')


class SpotifyUser(models.Model):
    username = models.CharField(max_length=50, primary_key=True)
    password = models.CharField(max_length=50, db_column='pass')
    firstName = models.CharField(max_length=50)
    dateJoined = models.DateField()
    REQUIRED_FIELDS = []
    USERNAME_FIELD = 'username'
    is_anonymous = False
    is_authenticated = False

    objects = UserManager()

class Playlist(models.Model):
    playlistID = models.IntegerField(primary_key=True)
    playlistName = models.CharField(max_length=50)
    createdBy = models.ForeignKey(SpotifyUser, on_delete=models.CASCADE, db_column='createdBy', to_field='username')

class PlaylistSongs(models.Model):
    class Meta:
        unique_together = (('songID', 'playlistID'),)
    songID = models.ForeignKey(Song, on_delete=models.CASCADE, db_column='songID', to_field='songID')
    playlistID = models.ForeignKey(Playlist, on_delete=models.CASCADE, db_column='playlistID', to_field='playlistID')

class UserFollow(models.Model):
    class Meta:
        unique_together = (('username', 'artist'),)
    username = models.ForeignKey(SpotifyUser, on_delete=models.CASCADE, db_column='username', to_field='username')
    artist = models.ForeignKey(Artist, on_delete=models.CASCADE, db_column='artist', to_field='artistName')

class UserLikes(models.Model):
    class Meta:
        unique_together = (('username', 'songID'),)
    username = models.ForeignKey(SpotifyUser, on_delete=models.CASCADE, db_column='username', to_field='username')
    songID = models.ForeignKey(Song, on_delete=models.CASCADE, db_column='songID', to_field='songID')
