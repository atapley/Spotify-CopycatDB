from django.shortcuts import render
from spotify.models import Artist, Genre
from datetime import date
from django.db.models import Q
from django.http import HttpResponseRedirect
from django.db import connection


def catalog(request):
    items = {}

    cursor = connection.cursor()
    try:
        cursor.callproc('spotify_copycatDB.artist_catalog')

        items['artists'] = cursor.fetchall()
    finally:
        cursor.close()

    return render(request, 'spotify/artist_catalog.html', items)