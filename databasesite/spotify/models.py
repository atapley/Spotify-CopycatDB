from django.db import models
from django.contrib.auth.models import AbstractBaseUser


class Album(models.Model):
    albumID = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=50)
    artist = models.CharField(max_length=50)
    dateReleased = models.DateField()


class Artist(models.Model):
    artistName = models.CharField(max_length=50, primary_key=True)
    mainGenre = models.IntegerField()


class Genre(models.Model):
    genreID = models.IntegerField(primary_key=True)
    genre = models.CharField(max_length=50)


class Playlist(models.Model):
    playlistID = models.IntegerField(primary_key=True)
    playlistName = models.CharField(max_length=50)
    createdBy = models.CharField(max_length=50)


class PlaylistSongs(models.Model):
    songID = models.IntegerField(primary_key=True)
    playlistID = models.IntegerField()


class Song(models.Model):
    songID = models.IntegerField(primary_key=True)
    title = models.CharField(max_length=50)
    duration = models.IntegerField()
    genreID = models.IntegerField()
    artist = models.CharField(max_length=50)
    albumID = models.IntegerField()


class SpotifyUser(models.Model):
    username = models.CharField(max_length=50, primary_key=True)
    password = models.CharField(max_length=50, db_column='pass')
    firstName = models.CharField(max_length=50)
    dateJoined = models.DateField()
    REQUIRED_FIELDS = []
    USERNAME_FIELD = 'username'
    is_anonymous = False
    is_authenticated = False


class UserFollow(models.Model):
    username = models.CharField(max_length=50)
    artist = models.CharField(max_length=50)


class UserLikes(models.Model):
    username = models.CharField(max_length=50)
    songID = models.IntegerField()
