INSERT INTO shelter.Location (
	addressLine1, 
	addressLine2, 
	city, 
	capacity, 
	congregationId,
	locationName,  
	notes, 
	state, 
	zipCode,
	timeCreated)
VALUES (
	:line1, 
	:line2, 
	:city, 
	:capacity, 
	:congregationId,
	:name, 
	:notes,
	:state, 
	:zip,
	GetDate());
