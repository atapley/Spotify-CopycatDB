from django.conf.urls import url
from django.contrib import admin
from spotify.views import home, playlist, login, signup

urlpatterns = [
    url(r'^$', login.login_screen),
    url(r'^login$', home.login_test),
    url(r'^signup$', signup.signup_screen),
    url(r'^create_account$', signup.create_account),
    url(r'^user_home$', home.startscreen),
    url(r'^create_playlist$', playlist.create),
    url(r'^submit_playlist$', playlist.submit),
    url(r'^view_playlist$', playlist.view),
    url(r'^playlist_edit', playlist.edit),
    url(r'^update_playlist$', playlist.update),
    url(r'^playlist_songs', playlist.single_viewer),
    url(r'^admin/', admin.site.urls),
]
