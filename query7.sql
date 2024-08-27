SELECT Customer_Number_of_id_card AS Number_of_id_card, AVG(distance) AS Average_distance
FROM booking
GROUP BY Customer_Number_of_id_card;