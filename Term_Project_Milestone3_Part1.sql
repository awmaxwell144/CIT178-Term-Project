/*
USE musicTracker;
SELECT COUNT(UserID) AS [Number of Users],
MIN(UserName) AS [First User], MAX(UserName) AS [Last User]
FROM Users;

USE musicTracker;
SELECT COUNT(UserDownloads.PlaylistID) AS [Total Downloads], Users.UserName, AVG(UserDownloads.PlaylistID) AS [Average PlaylistID]
FROM Users JOIN UserDownloads ON Users.UserID = UserDownloads.UserID
GROUP BY Users.UserName;

USE musicTracker;
SELECT Songs.SongName, COUNT(LikedSongs.UserID) AS  [Number of Likes]
FROM Songs JOIN LikedSongs ON Songs.SongID = LikedSongs.SongID
GROUP BY Songs.SongName;

USE musicTracker;
SELECT LikedSongs.UserID, COUNT(LikedSongs.SongID) AS [Liked Songs], SUM(Songs.ArtistID) AS [ArtistID Sum]
FROM LikedSongs JOIN Songs ON Songs.SongID = LikedSongs.SongID
GROUP BY LikedSongs.UserID;

USE musicTracker;
SELECT AlbumName, COUNT(Songs.AlbumID) AS [Number of Songs]
FROM Albums JOIN Songs ON Albums.AlbumID = Songs.AlbumID
GROUP BY AlbumName; */