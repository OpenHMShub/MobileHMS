INSERT INTO shelter.Coordinator (
	congregationId, 
	isPrimary,
	humanId, 
	timeCreated)
VALUES (
	:congregationId,
	:isPrimary,
	:humanId,
	GetDate());
