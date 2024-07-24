DROP TABLE IF EXISTS #SeatDetails

CREATE TABLE #SeatDetails(
	Id INT IDENTITY(1,1),
	SeatNumber INT NOT NULL,
	IsSelect BIT DEFAULT 0 NULL
)

INSERT INTO #SeatDetails(SeatNumber)
VALUES
(1),(1),(0),(1),(1),
(0),(1),(0),(1),(0),
(1),(1),(0),(1),(1)


DECLARE @ID INT =1, @PrvValue INT=0,@Nxtvalue INT=0,@Count INT

SELECT @Count=COUNT(1) FROM #SeatDetails

WHILE(@ID<=@Count)
BEGIN
	SELECT @Nxtvalue = SeatNumber FROM #SeatDetails WHERE Id=@ID+1

	UPDATE #SeatDetails
	SET IsSelect=ISNULL(@PrvValue,0)|ISNULL(@Nxtvalue,0)
	WHERE Id=@ID AND SeatNumber=1

	SELECT @Prvvalue = SeatNumber FROM #SeatDetails WHERE Id=@ID

	SET @ID+=1
END

SELECT * FROM #SeatDetails
