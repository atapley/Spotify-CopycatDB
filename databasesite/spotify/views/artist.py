from django.shortcuts import render
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