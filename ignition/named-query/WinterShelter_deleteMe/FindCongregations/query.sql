Declare @congregation as nvarchar(max) = :congregation,
	@lastName as nvarchar(max) = :lastName,
	@nights as nvarchar(max) = :nights,
	@gender as nvarchar(max) = :gender,
	@guestCount as int = :guestCount,
 	@city as nvarchar(max) = :city,
 	@wheelchair as nvarchar(1) = :wheelchair,
 	@services as nvarchar(1) = :services

SELECT TOP 100
	ws.Congregation_Name as 'congregation',
	ws.Coordinator_lName  as 'coordLastName',
	ws.Back_Up_Coordinator_lName as 'backupLastName',
	ws.Night_s_of_the_Week_Hosting as 'nights',
	ws.Gender_of_guests as 'gender',
	ws.Number_of_Guests as 'guestCount',
	ws.City as 'congregationCity',
	ws.cCity as 'coordinatorCity',
	ws.bcCity as 'backupCity',
	ws.Can_you_accommodate_a_guest_who_uses_a_wheelchair as 'wheelchair',
	ws.Special_Services_Offered_Check_all_that_apply as 'services'
	
FROM
	shelter.TotalTable ws

WHERE

	(ws.Congregation_Name like IsNull(@congregation,ws.Congregation_Name)+'%' OR (@congregation is null AND ws.Congregation_Name is null))
	AND
	((ws.Coordinator_lName like IsNull(@lastName,ws.Coordinator_lName)+'%' OR (@lastName is null AND ws.Coordinator_lName is null))
	OR
	(ws.Back_Up_Coordinator_lName like IsNull(@lastName, ws.Back_Up_Coordinator_lName)+'%' OR (@lastName is null AND ws.Back_Up_Coordinator_lName is null)))
	AND
	(ws.Night_s_of_the_Week_Hosting like IsNull(@nights,ws.Night_s_of_the_Week_Hosting)+'%' OR (@nights is null AND ws.Night_s_of_the_Week_Hosting is null))
	AND
	(ws.Gender_of_guests like IsNull(@gender,ws.Gender_of_guests)+'%' OR (@gender is null AND ws.Gender_of_guests is null))
	AND
	(ws.Gender_of_guests like IsNull(@gender,ws.Gender_of_guests)+'%' OR (@gender is null AND ws.Gender_of_guests is null))	
	/*AND
	(ws.Number_of_Guests like IsNull(@guestCount,ws.Number_of_Guests)+'%' OR (@guestCount is null AND ws.Number_of_Guests is null))*/
	AND
	((ws.City like IsNull(@city,ws.City)+'%' OR (@city is null AND ws.City is null))		
	OR
	(ws.cCity like IsNull(@city,ws.cCity)+'%' OR (@city is null AND ws.cCity is null))
	OR
	(ws.bcCity like IsNull(@city,ws.bcCity)+'%' OR (@city is null AND ws.bcCity is null)))
	
	
	