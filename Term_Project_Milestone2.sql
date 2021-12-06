/* CREATE DATABASE musicTracker; 



USE musicTracker;
CREATE TABLE Playlists(
	PlaylistID int NOT NULL,
	PlaylistName varchar(30) NOT NULL,
	PRIMARY KEY(PlaylistID)
	); 


USE musicTracker;
CREATE TABLE Distributor(
	DistID int NOT NULL,
	DistName varchar(30) NOT NULL,
	PRIMARY KEY(DistID)
	);
	
USE musicTracker;
CREATE TABLE Artists(
	ArtistID int NOT NULL,
	ArtistName varchar(30) NOT NULL,
	PRIMARY KEY(ArtistID)
	);

USE musicTracker;
CREATE TABlE Albums(
	AlbumID int NOT NULL,
	AlbumName varchar(30) NOT NULL,
	ArtistID int NOT NULL,
	PublishYear int,
	PRIMARY KEY(AlbumID)
	);
	
USE musicTracker;
CREATE TABLE Users(
	UserID int NOT NULL,
	UserName varchar(30) NOT NULL,
	FavoriteArtistID int,
	DistID int,
	PRIMARY KEY(UserID)
	); 

USE musicTracker;
CREATE TABLE Songs(
	SongID int NOT NULL,
	SongName varchar(30) NOT NULL,
	ArtistID int NOT NULL,
	AlbumID int NOT NULL,
	Length varchar(10), 
	PRIMARY KEY(SongID)
	); 

USE musicTracker;
CREATE TABLE UserDownloads(
	UserID int NOT NULL,
	PlaylistID int NOT NULL,
	PRIMARY KEY(UserID, PlaylistID)
	); 

USE musicTracker;
CREATE TABLE LikedSongs(
	UserID int NOT NULL,
	SongID int NOT NULL,
	PRIMARY KEY( UserID, SongID)
	); 

USE musicTracker;
CREATE TABLE SongsOnPlaylists(
	PlaylistID int NOT NULL,
	SongID int NOT NULL,
	PRIMARY KEY(PlaylistID, SongID)
	); 

USE musicTracker;
ALTER TABLE Albums WITH CHECK
ADD CONSTRAINT FK_albums_artists FOREIGN KEY(ArtistID)
REFERENCES Artists (ArtistID)
ON UPDATE CASCADE


USE musicTracker;
ALTER TABLE Users WITH CHECK
ADD CONSTRAINT FK_Users_Artists FOREIGN KEY(FavoriteArtistID)
REFERENCES Artists (ArtistID)
ON UPDATE CASCADE 

USE musicTracker;
GO
ALTER TABLE Users WITH CHECK
ADD CONSTRAINT FK_Users_Distributor FOREIGN KEY(DistID)
REFERENCES Distributor (DistID)
ON UPDATE CASCADE

GO
ALTER TABLE UserDownloads WITH CHECK
ADD CONSTRAINT FK_User_UserDownloads FOREIGN KEY(UserID)
REFERENCES Users (UserID)
ON UPDATE CASCADE

GO
ALTER TABLE UserDownloads WITH CHECK
ADD CONSTRAINT FK_Playlist_UserDownloads FOREIGN KEY(PlaylistID)
REFERENCES Playlists (PlaylistID)
ON UPDATE CASCADE

GO
ALTER TABLE LikedSongs WITH CHECK
ADD CONSTRAINT FK_Users_LikedSongs FOREIGN KEY(UserID)
REFERENCES Users (UserID)
ON UPDATE CASCADE

GO
ALTER TABLE LikedSongs WITH CHECK
ADD CONSTRAINT FK_Songs_LikedSongs FOREIGN KEY(SongID)
REFERENCES Songs (SongID)
ON UPDATE CASCADE

GO
ALTER TABLE SongsOnPlaylists WITH CHECK
ADD CONSTRAINT FK_Playlist_SongsOnPlaylists FOREIGN KEY(PlaylistID)
REFERENCES Playlists (PlaylistID)
ON UPDATE CASCADE

GO
ALTER TABLE SongsOnPlaylists WITH CHECK
ADD CONSTRAINT FK_Songs_SongsOnPlaylists FOREIGN KEY(SongID)
REFERENCES Songs (SongID)
ON UPDATE CASCADE

USE musicTracker;
CREATE INDEX idx_ArtistID ON Albums(ArtistID);

USE musicTracker;
CREATE INDEX idx_SArtistID ON Songs (ArtistID); 

USE musicTracker;
GO
CREATE INDEX idx_AlbumID ON Songs (AlbumID);
GO
CREATE INDEX idx_FavoriteArtistID ON  Users(FavoriteArtistID);
GO
CREATE INDEX idx_DistID ON Users(DistID);
GO
CREATE INDEX idx_DUserID ON UserDownloads(UserID);
GO 
CREATE INDEX idx_UDPlaylistID ON UserDownloads (PlaylistID);
GO
CREATE INDEX idx_SUserID ON LikedSongs (UserID);
GO
CREATE INDEX idx_SongID ON LikedSongs (SongID);
GO
CREATE INDEX idx_SPlaylistID ON SongsOnPlaylists (PlaylistID);
GO
CREATE INDEX idx_PSongID ON SongsOnPlaylists (SongID); */






