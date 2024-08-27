SELECT Serial_number
FROM vehicle JOIN taxi ON vehicle.Serial_number = taxi.Vehicle_Serial_number 
			 LEFT OUTER JOIN maintenance ON maintenance.Vehicle_Serial_number =
             (SELECT vehicle.Serial_number WHERE maintenance.Description = 'KTEO')
WHERE Description IS NULL;