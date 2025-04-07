SELECT 	
		---location information---
		loc.id,
		loc.locationName,
		loc.city,
		CONCAT_WS(' ',loc.addressLine1,loc.addressLine2) AS 'locationAddress',
		loc.zipCode,
		loc.timeCreated,
		--loc.capacity,
		ISNULL(g.genderAccepted,'') as 'genderAccepted',
		---
		---Congregation Information----
		---
		--cong.congregationName AS 'Congregation Name',
		--cong.congregationLeader AS 'Congregation Leader',
		--cong.phone AS 'Congregation Phone', 
		--cong.nightPhone AS 'Congregation Evening Phone',
		--cong.email AS 'Congregation Email', 
		--cong.website AS 'Congregation Website', 
		--cong.notes AS 'Comments', 
		CONCAT_WS(' ',hc.firstName,hc.lastName) AS 'coordinator',
		--hc.nickname as 'Coordinator Nickname', 
		--hc.street AS 'Coordinator Address',
		--hc.city AS 'Coordinator City',
		--hc.zipCode AS 'Coordinator Zipcode',
		ISNULL(hc.phone,'') AS 'coordinatorPhone', 
		ISNULL(hc.email,'') AS 'coordinatorEmail', 
		--hc.preferredCommunication AS 'Coordinator Preferred Communication',
		--coord.notes AS 'Coordinator Comments',
		---
		----Location Features----
		----
		ls.seasonId, 
		--ls.beds as 'capacity',
		ISNULL(ls.numberOfWeeks,'') as 'numberOfWeeks',  
		ls.nights as 'nightsInt',
		cast(ls.nights & 1 as bit) as 'monday',
		cast(ls.nights & 2 as bit) as 'tuesday',
		cast(ls.nights & 4 as bit) as 'wednesday',
		cast(ls.nights & 8 as bit) as 'thursday',
		cast(ls.nights & 16 as bit) as 'friday',
		cast(ls.nights & 32 as bit) as 'saturday',
		cast(ls.nights & 64 as bit) as 'sunday',
		ls.accessible, 
 		ls.families,  
		ls.extraShortNotice, 
		ls.stairs, 
		ls.smoking, 
		ls.showers,
		ls.clothing,
		ls.laundry,
		ls.sackLunches,
		ls.breakfast,
		ls.dinner,
		ls.haircuts,
		ls.hygieneItems,
		'' as 'options'

FROM shelter.Location loc
LEFT JOIN
	shelter.LocationSeasonal ls ON loc.id = ls.locationId
LEFT JOIN 
	shelter.Gender g ON ls.genderId = g.id
LEFT JOIN 
	shelter.Seasons sea ON ls.seasonId = sea.id
LEFT JOIN
	shelter.CongregationOLD cong ON loc.congregationId = cong.Id
LEFT JOIN
	shelter.Coordinator coord ON cong.id = coord.congregationId
LEFT JOIN 
	humans.human hc ON coord.humanId = hc.id
WHERE
--	(cast(ISNULL((Select stat.id 
--			from shelter.LocationStatus stat 
--			LEFT JOIN shelter.seasons sea on stat.SeasonId = sea.id 
--			where stat.LocationId=loc.id and sea.Seasons like @thisSeasonStartYear + '%'),0) as bit) = 1)
	ls.seasonId =  :season 
	AND  
	{locationName} 
	AND  {city} 
	AND  {zipCode} 
	AND  {minGuests} 
	AND  {maxGuests} 
	AND  {accessible}
	AND  {families} 
	AND  {shortNotice} 
	AND  {stairs} 
	AND  {smoking} 
	AND  {reminderCall} 
	AND  {monday} 
	AND  {tuesday} 
	AND  {wednesday} 
	AND  {thursday} 
	AND  {friday} 
	AND  {saturday} 
	AND  {sunday} 
	AND  {genders} 
	AND  {search} 
	AND  {showers} 
	AND  {clothing} 
	AND  {laundry} 
	AND  {sackLunches} 
	AND  {breakfast} 
	AND  {dinner} 
	AND  {haircuts} 
	AND  {hygieneItems} 
