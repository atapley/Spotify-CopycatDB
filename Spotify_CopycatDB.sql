DROP DATABASE IF EXISTS spotify_copycatDB;
CREATE DATABASE spotify_copycatDB;

USE spotify_copycatDB;

DROP TABLE IF EXISTS spotify_SpotifyUser;
CREATE TABLE spotify_SpotifyUser (
username   VARCHAR(50) NOT NULL PRIMARY KEY,
pass       VARCHAR(50) NOT NULL,
firstName  VARCHAR(50) NOT NULL,
dateJoined DATE NOT NULL
);

DROP TABLE IF EXISTS spotify_Playlist;
CREATE TABLE spotify_Playlist (
playlistID   INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
playlistName VARCHAR(50) NOT NULL,
createdBy    VARCHAR(50) NOT NULL,
FOREIGN KEY (createdBy) REFERENCES spotify_SpotifyUser(username) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS spotify_Genre;
CREATE TABLE spotify_Genre (
genreId INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
genre VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS spotify_Artist;
CREATE TABLE spotify_Artist (
artistName VARCHAR(50) NOT NULL PRIMARY KEY,
mainGenre  INT,
FOREIGN KEY (mainGenre) REFERENCES spotify_Genre(genreID) ON DELETE RESTRICT ON UPDATE CASCADE
);

DROP TABLE IF EXISTS spotify_Song;
CREATE TABLE spotify_Song (
songID   INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
title    VARCHAR(50) NOT NULL,
duration INT NOT NULL,
genreID  INT NOT NULL,
artist   VARCHAR(50) NOT NULL,
albumID  INT NOT NULL,
FOREIGN KEY (artist) REFERENCES spotify_Artist(artistName) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (albumID) REFERENCES spotify_Album(albumID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (genreID) REFERENCES spotify_Genre(genreID) ON DELETE RESTRICT ON UPDATE CASCADE
);

DROP TABLE IF EXISTS spotify_PlaylistSongs;
CREATE TABLE spotify_PlaylistSongs (
songID     INT NOT NULL,
playlistID INT NOT NULL,
CONSTRAINT playSong PRIMARY KEY (songID, playlistID),
FOREIGN KEY (playlistID) REFERENCES spotify_Playlist(playlistID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (songID) REFERENCES spotify_Song(songID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS spotify_UserLikes;
CREATE TABLE spotify_UserLikes (
username VARCHAR(50) NOT NULL,
songID   INT NOT NULL,
CONSTRAINT userLike PRIMARY KEY (username, songID),
FOREIGN KEY (username) REFERENCES spotify_SpotifyUser(username) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (songID) REFERENCES spotify_Song(songID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS spotify_UserFollow;
CREATE TABLE spotify_UserFollow (
username VARCHAR(50) NOT NULL,
artist   VARCHAR(50) NOT NULL,
CONSTRAINT userFollow PRIMARY KEY (username, artist),
FOREIGN KEY (username) REFERENCES spotify_SpotifyUser(username) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (artist) REFERENCES spotify_Artist(artistName) ON DELETE CASCADE ON UPDATE CASCADE
);