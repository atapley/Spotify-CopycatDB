# Generated by Django 3.0.5 on 2020-04-14 00:05

from django.conf import settings
import django.contrib.auth.models
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('spotify', '0001_initial'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Album',
        ),
        migrations.AlterModelManagers(
            name='spotifyuser',
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.RemoveField(
            model_name='song',
            name='albumID',
        ),
        migrations.AlterField(
            model_name='artist',
            name='mainGenre',
            field=models.ForeignKey(db_column='mainGenre', on_delete=django.db.models.deletion.PROTECT, to='spotify.Genre'),
        ),
        migrations.AlterField(
            model_name='playlist',
            name='createdBy',
            field=models.ForeignKey(db_column='createdBy', on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='playlistsongs',
            name='playlistID',
            field=models.ForeignKey(db_column='playlistID', on_delete=django.db.models.deletion.CASCADE, to='spotify.Playlist'),
        ),
        migrations.AlterField(
            model_name='playlistsongs',
            name='songID',
            field=models.ForeignKey(db_column='songID', on_delete=django.db.models.deletion.CASCADE, to='spotify.Song'),
        ),
        migrations.AlterField(
            model_name='song',
            name='artist',
            field=models.ForeignKey(db_column='artist', on_delete=django.db.models.deletion.CASCADE, to='spotify.Artist'),
        ),
        migrations.AlterField(
            model_name='song',
            name='genreID',
            field=models.ForeignKey(db_column='genreID', on_delete=django.db.models.deletion.PROTECT, to='spotify.Genre'),
        ),
        migrations.AlterField(
            model_name='userfollow',
            name='artist',
            field=models.ForeignKey(db_column='artist', on_delete=django.db.models.deletion.CASCADE, to='spotify.Artist'),
        ),
        migrations.AlterField(
            model_name='userfollow',
            name='username',
            field=models.ForeignKey(db_column='username', on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='userlikes',
            name='songID',
            field=models.ForeignKey(db_column='songID', on_delete=django.db.models.deletion.CASCADE, to='spotify.Song'),
        ),
        migrations.AlterField(
            model_name='userlikes',
            name='username',
            field=models.ForeignKey(db_column='username', on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddConstraint(
            model_name='artist',
            constraint=models.CheckConstraint(check=models.Q(_negated=True, artistName=''), name='artistName_not_blank'),
        ),
        migrations.AddConstraint(
            model_name='genre',
            constraint=models.CheckConstraint(check=models.Q(_negated=True, genre=''), name='genre_not_blank'),
        ),
        migrations.AddConstraint(
            model_name='playlist',
            constraint=models.CheckConstraint(check=models.Q(_negated=True, playlistName=''), name='playlistName_not_blank'),
        ),
        migrations.AddConstraint(
            model_name='song',
            constraint=models.CheckConstraint(check=models.Q(_negated=True, title=''), name='title_not_blank'),
        ),
        migrations.AddConstraint(
            model_name='spotifyuser',
            constraint=models.CheckConstraint(check=models.Q(models.Q(_negated=True, username=''), models.Q(_negated=True, username__contains=' ')), name='username_not_blank'),
        ),
        migrations.AddConstraint(
            model_name='spotifyuser',
            constraint=models.CheckConstraint(check=models.Q(_negated=True, firstName=''), name='firstName_not_blank'),
        ),
        migrations.AddConstraint(
            model_name='spotifyuser',
            constraint=models.CheckConstraint(check=models.Q(models.Q(_negated=True, password=''), models.Q(_negated=True, password__contains=' ')), name='password_not_blank'),
        ),
    ]