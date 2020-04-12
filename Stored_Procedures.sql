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
SELECT title, artist, (playlistID IS NOT NULL) AS in_playlist
FROM spotify_song a LEFT JOIN (SELECT * FROM spotify_playlistsongs b WHERE playlistID = id) AS temp
ON a.songID = temp.songID;
END //
DELIMITER ;
