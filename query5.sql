SELECT Scooter_number, scooter.Range
FROM vehicle JOIN scooter ON vehicle.Serial_number= scooter.Vehicle_Serial_number
WHERE scooter.Range >=25;