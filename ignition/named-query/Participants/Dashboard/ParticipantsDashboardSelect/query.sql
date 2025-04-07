/*Participants/Dashboard/ParticipantsDashboardSelect*/
DECLARE @activity_range AS INT = :activity_range
--Calculate the begin and end activity dates
DECLARE	@activity_start AS DATE = DATEADD(day, (-1 * @activity_range), getdate())
	,@activity_end AS DATE = DATEADD(day,1,getdate());

SELECT [ID]
	  ,1 as 'Detail'
	  ,[Suspension]	
	  ,[fullRegistration]
      ,CONCAT_WS(' ',[FirstName],[MiddleName],[LastName]) as 'Name'
      ,[Age]
      
FROM [participant].[Dashboard]

WHERE
 	[LastAction] between @activity_start and @activity_end AND
 	{search}
  
  ORDER BY [LastAction] DESC;