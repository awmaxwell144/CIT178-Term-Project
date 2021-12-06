/* Final Project Procedures*/


USE musicTracker;
GO
CREATE PROC spSongReport
AS
SELECT SongName, COUNT(UserID) AS [Number of Likes]
FROM Songs JOIN LikedSongs ON Songs.SongID = LikedSongs.SongID
GROUP BY SongName
ORDER BY [Number of Likes]
/*


GO
EXEC spSongReport


USE musicTracker;
GO
CREATE PROC spSong
	@SongID int 
AS
SELECT SongID, SongName
FROM Songs
WHERE SongID = @SongID
GO
EXEC spSong 3;


USE musicTracker;

GO
CREATE PROC spAlbums
	@ID int,
	@Name varchar(30) OUTPUT,
	@Year int OUTPUT
AS
BEGIN
	SELECT @ID = AlbumID, @Name = AlbumName, @Year = PublishYear
	FROM Albums 
	WHERE AlbumID = @ID
END
GO

DECLARE @IDName varchar(30),
	@IDYear int
EXEC spAlbums 2, @IDName OUTPUT, @IDYear OUTPUT

SELECT @IDName AS [Name], @IDYear AS [Year];

PRINT 'Album Name: ' + @IDName;
PRINT'Published in: ' + CONVERT(varchar, @IDYear);


USE musicTracker
GO
CREATE PROC spDownloadsCount
AS
DECLARE @DownCount int
SELECT @DownCount = COUNT(UserDownloads.PlaylistID)
FROM UserDownloads

RETURN @DownCount;

DECLARE @Count int;
EXEC @Count = spDownloadsCount 
PRINT 'Total Number of Downloads: ' + CONVERT( varchar, @Count);


Final Project User Defined Functions


CREATE FUNCTION fnArtistName
	(@ArtistID int)
	RETURNS varchar(30)
BEGIN
	RETURN(SELECT ArtistName FROM Artists WHERE ArtistID = @ArtistID);
END
GO
PRINT 'Artist Name: ' + dbo.fnArtistName('4')


CREATE FUNCTION fnSongInfo
	(@SongName varchar(30))
	RETURNS table
	RETURN (SELECT SongID, SongName, ArtistName, AlbumName, Length, PublishYear
			FROM Songs JOIN Artists ON Songs.ArtistID = Artists.ArtistID
					   JOIN Albums ON Songs.AlbumID = Albums.AlbumID
			WHERE SongName = @SongName);
GO
SELECT * FROM dbo.fnSongInfo('Eleanor Rigby')



Final Project Triggers


CREATE TABLE UserLogs(
	UserID int,
	status varchar(30)
	);
	
CREATE TRIGGER UserLog_DELETE ON Users
	AFTER DELETE
AS
BEGIN 
	SET NOCOUNT ON;
	DECLARE @UserID int
	SELECT @UserID = DELETED.UserID
	FROM DELETED

	INSERT INTO UserLogs
	VALUES(@UserID, 'Deleted')
END

CREATE TRIGGER UserLog_INSERT ON Users
	AFTER INSERT
AS
BEGIN 
	SET NOCOUNT ON;
	DECLARE @UserID int
	SELECT @UserID = INSERTED.UserID
	FROM INSERTED

	INSERT INTO UserLogs
	VALUES(@UserID, 'Added')
END

GO

CREATE TRIGGER UserLog_UPDATE ON Users
	AFTER UPDATE
AS
BEGIN 
	SET NOCOUNT ON;
	DECLARE @UserID int
	SELECT @UserID = UPDATED.UserID
	FROM UPDATED

	INSERT INTO UserLogs
	VALUES(@UserID, 'Updated')
END

*/


