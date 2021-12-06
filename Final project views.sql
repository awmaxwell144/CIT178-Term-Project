/* Final Project Views
USE  musicTracker;
GO

 View #1

CREATE VIEW AlbumArtists
AS 
SELECT AlbumID, AlbumName, Albums.ArtistID, Artists.ArtistName, PublishYear
FROM Albums JOIN Artists ON Albums.ArtistID = Artists.ArtistID
GO
SELECT * FROM AlbumArtists


View #2

CREATE VIEW PlaylistsWithSongs
AS
SELECT s.SongName, sp.SongID,sp.PlaylistID, p.PlaylistName
FROM SongsOnPlaylists AS sp 
JOIN Songs AS s ON sp.SongID = s.SongID
JOIN Playlists AS p ON sp.PlaylistID = p.PlaylistID
GO
--Showing original view--
SELECT * FROM PlaylistsWithSongs

--Update--
GO
UPDATE PlaylistsWithSongs
SET PlaylistID = 3
WHERE SongID = 5
GO

--Display updayed view--
SELECT * FROM PlaylistsWithSongs

 View #3
CREATE VIEW SongDetails
AS
SELECT s.SongID, s.SongName, ar.ArtistName, al.AlbumName, s.Length
FROM Songs AS s
JOIN Artists AS ar ON s.ArtistID = Ar.ArtistID
JOIN Albums AS al ON s.AlbumID = Al.AlbumID
GO
SELECT * FROM SongDetails

View #4

CREATE VIEW DownloadedSongs
AS
SELECT p.PlaylistName, ud.PlaylistID,ud.UserID, u.UserName
FROM UserDownloads AS ud
JOIN Playlists AS p ON ud.PlaylistID = p.PlaylistID
JOIN Users AS u ON ud.UserID = u.UserID
GO
--Showing original view--
SELECT * FROM DownloadedSongs
*/