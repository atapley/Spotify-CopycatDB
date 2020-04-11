USE `spotify_copycatDB`;

DROP PROCEDURE IF EXISTS artist_catalog;
DELIMITER //
CREATE PROCEDURE artist_catalog()
BEGIN
  SELECT artistName, genre
  FROM spotify_artist JOIN spotify_genre ON spotify_artist.mainGenre = spotify_genre.genreID;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS in_playlist;
DELIMITER //
CREATE PROCEDURE in_playlist(IN id int)
BEGIN
SELECT title, artist, (playlistID = id) as in_playlist
FROM spotify_playlistsongs a JOIN spotify_song b ON a.songID = b.songID;
END //
DELIMITER ;
