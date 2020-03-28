USE spotify_copycatDB;

INSERT INTO SpotifyUser (username, pass, firstName, dateJoined) VALUES
('User1', 'password123', 'Tester1', '2020-03-28'),
('User2', 'password123', 'Tester2', '2020-03-28');

INSERT INTO Playlist (playlistId, playlistName, createdBy) VALUES
(NULL, 'CountryPlaylist', 'User1'),
(NULL, 'RockPlaylist', 'User1'),
(NULL, 'PartyPlaylist', 'User2');

INSERT INTO Genre (genreID, genre) VALUES
(NULL, 'Country'),
(NULL, 'Rock'),
(NULL, 'Rap');

INSERT INTO Artist (artistName, mainGenre) VALUES
('High Valley', 1),
('Florida Georgia Line', 1),
('Van halen', 2),
('Guns N\' Roses', 2),
('G-Eazy', 3),
('Eminem', 3);

INSERT INTO Album (albumID, title, artist, dateReleased) VALUES
(NULL, 'Dig Your Roots', 'Florida Georgia Line', '2016-01-01'),
(NULL, 'County Line', 'High Valley', '2016-01-01'),
(NULL, '5150', 'Van Halen', '1986-01-01'),
(NULL, 'Appetite For Destruction', 'Guns N\' Roses', '1987-01-01'),
(NULL, 'These Things Happen', 'G-Eazy', '2014-01-01'),
(NULL, 'Curtain Call', 'Eminem', '2005-01-01');

INSERT INTO Song (songID, title, duration, genreID, artist, albumID) VALUES
(NULL, 'Smooth', 170, 1, 'Florida Georgia Line', 1),
(NULL, 'Dig Your Roots', 213, 1, 'Florida Georgia Line', 1),
(NULL, 'Farm Girl', 181, 1, 'High Valley', 2),
(NULL, 'Be You', 188, 1, 'High Valley', 2),
(NULL, 'Good Enough', 243, 2, 'Van Halen', 3),
(NULL, 'Get Up', 283, 2, 'Van Halen', 3),
(NULL, 'Welcome to the Jungle', 273, 2, 'Guns N\' Roses', 4),
(NULL, 'Sweet Child O\' Mine', 356, 2, 'Guns N\' Roses', 4),
(NULL, 'These Things Happen', 144, 3, 'G-Eazy', 5),
(NULL, 'Almost Famous', 269, 3, 'G-Eazy', 5),
(NULL, 'FACK', 206, 3, 'Eminem', 6),
(NULL, 'The Way I Am', 291, 3, 'Eminem', 6);

INSERT INTO PlaylistSongs (songID, playlistID) VALUES
(1, 1),
(2, 1),
(3, 1),
(6, 2),
(8, 2),
(5, 3),
(7, 3),
(4, 3),
(9, 3),
(10, 3);

INSERT INTO UserFollow (username, artist) VALUES
('User1', 'High Valley'),
('User1', 'Van Halen'),
('User1', 'G-Eazy');

INSERT INTO UserLikes (username, songID) VALUES
('User1', 1),
('User1', 2),
('User1', 4),
('User1', 7),
('User1', 9),
('User1', 6),
('User2', 4),
('User2', 8),
('User2', 1);
