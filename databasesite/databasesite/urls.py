from django.conf.urls import url
from django.contrib import admin
from spotify.views import home, playlist, login, signup, song, artist, likes

urlpatterns = [
    url(r'^$', login.login_screen),
    url(r'^login$', home.login_test),
    url(r'^signup$', signup.signup_screen),
    url(r'^create_account$', signup.create_account),
    url(r'^user_home$', home.startscreen),
    url(r'^create_playlist$', playlist.create),
    url(r'^submit_playlist$', playlist.submit_playlist),
    url(r'^view_playlist$', playlist.view),
    url(r'^view_songs$', song.catalog),
    url(r'^view_artists$', artist.catalog),
    url(r'^playlist_edit', playlist.edit),
    url(r'^update_playlist$', playlist.update),
    url(r'^playlist_songs', playlist.single_viewer),
    url(r'^update_likes', likes.update_likes),
    url(r'^admin/', admin.site.urls),
]
