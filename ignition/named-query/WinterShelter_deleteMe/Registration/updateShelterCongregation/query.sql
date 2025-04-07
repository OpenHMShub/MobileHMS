UPDATE	organization.Provider
SET street = :congregationStreet,
	street2 = :congregationStreet2,
	city = :congregationCity,
	state =  :congregationState,
	zipCode =  :congregationZipCode,
	phone =  :congregationPhone 

WHERE id = :providerId ;
