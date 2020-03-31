from django.conf.urls import url
from django.contrib import admin
from spotify.views import home, playlist

urlpatterns = [
    url(r'^$', home.startscreen),
    url(r'^create_playlist$', playlist.create),
    url(r'^submit_playlist$', playlist.submit),
    url(r'^view_playlist$', playlist.view),
    url(r'^playlist_songs', playlist.single_viewer),
    url(r'^admin/$', admin.site.urls),
]
