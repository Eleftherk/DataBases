SELECT Bicycle_number, bicycle.Range
FROM vehicle JOIN bicycle ON vehicle.Serial_number= bicycle.Vehicle_Serial_number
WHERE bicycle.Range >=35;