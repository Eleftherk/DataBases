SELECT Assistant_code, Name, Surname 
FROM office JOIN work ON office.Office_code = work.Office_Office_code
			JOIN assistant ON work.Assistant_Assistant_code = assistant.Assistant_code
WHERE work.To IS NULL AND Office_code = 1;



