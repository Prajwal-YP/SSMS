DROP TABLE IF EXISTS #SeatDetails

CREATE TABLE #SeatDetails(
	Id INT IDENTITY(1,1),
	SeatNumber INT NOT NULL
)

INSERT INTO #SeatDetails
VALUES
(1),(1),(0),(1),(1),
(0),(1),(0),(1),(0),
(1),(1),(0),(1),(1)

SELECT * 
FROM #SeatDetails

;WITH CTE AS(
	SELECT M.Id,M.SeatNumber,ISNULL(DN.SeatNumber,0) NxtSeat,ISNULL(UP.SeatNumber,0) PrvSeat
	FROM #SeatDetails M
	LEFT OUTER JOIN #SeatDetails DN ON DN.Id=M.Id+1
	LEFT OUTER JOIN #SeatDetails UP ON UP.Id=M.Id-1
)
SELECT Id,SeatNumber,NxtSeat|PrvSeat&SeatNumber AS IsSelect
FROM CTE
