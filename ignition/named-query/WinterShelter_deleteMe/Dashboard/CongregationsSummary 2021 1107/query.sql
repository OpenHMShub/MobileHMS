SELECT a.congregationName AS 'Congregation Name',
	a.city as 'City',
	a.id as 'id',
	b.nights as 'Night',
	b.genderId as 'Gender',
	b.beds as 'Number_of_Guests',
	0 as 'This Season Projection',
	0 as 'Last Year Total',
	'Yes' as'Registered',
	'' as 'options'	
FROM shelter.Congregation a 
	LEFT JOIN shelter.Location c ON c.congregationId = a.id
	LEFT JOIN shelter.LocationPreference b ON b.locationId = c.id