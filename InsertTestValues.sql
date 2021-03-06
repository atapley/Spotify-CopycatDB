USE spotify_copycatDB;

INSERT INTO spotify_SpotifyUser (username, pass, firstName, dateJoined) VALUES
('User1', 'password123', 'Tester1', '2020-03-28'),
('User2', 'password123', 'Tester2', '2020-03-28');

INSERT INTO spotify_Playlist (playlistId, playlistName, createdBy) VALUES
(1, 'CountryPlaylist', 'User1'),
(2, 'RockPlaylist', 'User1'),
(3, 'PartyPlaylist', 'User2');

INSERT INTO spotify_Genre (genreID, genre) VALUES
(1, 'Country'),
(2, 'Rock'),
(3, 'Rap');

INSERT INTO spotify_Artist (artistName, mainGenre) VALUES
('High Valley', 1),
('Florida Georgia Line', 1),
('Van halen', 2),
('Guns N\' Roses', 2),
('G-Eazy', 3),
('Eminem', 3);

INSERT INTO spotify_Song (songID, title, duration, genreID, artist) VALUES
(1, 'Smooth', 170, 1, 'Florida Georgia Line'),
(2, 'Dig Your Roots', 213, 1, 'Florida Georgia Line'),
(3, 'Farm Girl', 181, 1, 'High Valley'),
(4, 'Be You', 188, 1, 'High Valley'),
(5, 'Good Enough', 243, 2, 'Van Halen'),
(6, 'Get Up', 283, 2, 'Van Halen'),
(7, 'Welcome to the Jungle', 273, 2, 'Guns N\' Roses'),
(8, 'Sweet Child O\' Mine', 356, 2, 'Guns N\' Roses'),
(9, 'These Things Happen', 144, 3, 'G-Eazy'),
(10, 'Almost Famous', 269, 3, 'G-Eazy'),
(11, 'FACK', 206, 3, 'Eminem'),
(12, 'The Way I Am', 291, 3, 'Eminem');

INSERT INTO spotify_PlaylistSongs (songID, playlistID) VALUES
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

INSERT INTO spotify_UserFollow (username, artist) VALUES
('User1', 'High Valley'),
('User1', 'Van Halen'),
('User1', 'G-Eazy');

INSERT INTO spotify_UserLikes (username, songID) VALUES
('User1', 1),
('User1', 2),
('User1', 4),
('User1', 7),
('User1', 9),
('User1', 6),
('User2', 4),
('User2', 8),
('User2', 1);
