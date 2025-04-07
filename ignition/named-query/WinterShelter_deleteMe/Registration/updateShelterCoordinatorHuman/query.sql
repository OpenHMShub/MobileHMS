UPDATE	humans.Human  
SET street =  :address,
	city = :city,
	state = :state,
	zipCode = :zipCode,
	phone = :phone,
	altPhone = :altPhone,
	email = :email,
	preferredCommunication = :preferredCommunication 
WHERE id = :humanId;