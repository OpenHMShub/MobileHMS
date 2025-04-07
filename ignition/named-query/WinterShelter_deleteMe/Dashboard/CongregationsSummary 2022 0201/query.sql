---Determine the current, past and next season
DECLARE @thisMonth int = Month(GetDate())
DECLARE @thisYear varchar(4) = Year(GetDate())
DECLARE @thisSeasonStartYear varchar(4) = CASE WHEN @thisMonth > 7 THEN @thisYear ELSE (@thisYear - 1) END
DECLARE @lastSeasonStartYear varchar(4) = CASE WHEN @thisMonth > 7 THEN (@thisYear - 1) ELSE (@thisYear - 2) END
DECLARE @nextSeasonStartYear varchar(4) = CASE WHEN @thisMonth > 7 THEN (@thisYear + 1) ELSE (@thisYear) END
---Determine the current, past and next season ID's
DECLARE @thisSeasonId int
SELECT @thisSeasonId = s.id FROM shelter.Seasons s WHERE s.Seasons like @thisSeasonStartYear + '%'

DECLARE @lastSeasonId int
SELECT @lastSeasonId = s.id FROM shelter.Seasons s WHERE s.Seasons like @lastSeasonStartYear + '%'

DECLARE @nextSeasonId int
SELECT @nextSeasonId = s.id FROM shelter.Seasons s WHERE s.Seasons like @nextSeasonStartYear + '%'


SELECT 
	--@thisMonth,
	--@lastSeasonStartYear as 'lastSeason',
	--@lastSeasonId,
	--@thisSeasonStartYear as 'thisSeason',
	--@thisSeasonId,
	--@nextSeasonStartYear as 'nextSeason',
	--@nextSeasonId,
	c.id as 'CID',
	l.id as 'LID',
	ls.seasonId as 'SID',
	lsp.seasonId as 'SIDLast',
	lsn.seasonId as 'SIDNext',
	l.locationName,
	l.city,
	l.zipCode,
	ISNULL(ls.numberOfWeeks,'') as 'numberOfWeeks', 
	cast(ls.nights & 1 as bit) as 'monday',
	cast(ls.nights & 2 as bit) as 'tuesday',
	cast(ls.nights & 4 as bit) as 'wednesday',
	cast(ls.nights & 8 as bit) as 'thursday',
	cast(ls.nights & 16 as bit) as 'friday',
	cast(ls.nights & 32 as bit) as 'saturday',
	cast(ls.nights & 64 as bit) as 'sunday',
	ISNULL(g.genderAccepted,'') as 'genderAccepted',
	ls.beds,
	ls.bedsProjected as 'projection',
	ls.bedsActual as 'actual',
	lsp.bedsActual as 'lastYear',
	lsn.bedsActual as 'nextYear',
	cast(ISNULL(ls.seasonId,0) as bit) as 'registered',
	'' as 'options'	,
	tt.id as 'tid'
	
FROM shelter.Location l
LEFT JOIN (SELECT * FROM shelter.LocationSeasonal WHERE seasonID = @thisSeasonId) ls ON l.id = ls.locationid
LEFT JOIN (SELECT * FROM shelter.LocationSeasonal WHERE seasonID = @lastSeasonId) lsp ON l.id = lsp.locationid
LEFT JOIN (SELECT * FROM shelter.LocationSeasonal WHERE seasonID = @nextSeasonId) lsn ON l.id = lsp.locationid
LEFT JOIN organization.congregation c ON l.congregationId = c.id
LEFT JOIN shelter.Gender g ON g.id = ls.genderId
LEFT JOIN shelter.TotalTable tt ON loc.locationName = tt.Congregation_Name
