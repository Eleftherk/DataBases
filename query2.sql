SELECT Booking_code, Vehicle_Serial_number, Rate, Comments, Date
FROM rating
WHERE Date > '2022-11-10' AND Rate = 'Very Bad'
UNION
SELECT Booking_code, Vehicle_Serial_number, Rate, Comments, Date
FROM rating
WHERE Date > '2022-11-10' AND Rate = 'Poor'; 