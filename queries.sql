#Login
SELECT ID, password FROM User
	WHERE ID = "Devin";
    
#Check if Admin
SELECT ID FROM ADMIN
		WHERE ID = "Admin";
        
#Register
INSERT INTO User 
	VALUES ("Jackson", "Jackson", null, "HALL", "pass", 'jackson@gmail.com');

#All reviews for a specific user
SELECT * FROM Review
	WHERE passenger_ID = "Devin";
    
#All reviews for a user sorted by a column
SELECT * FROM Review
	WHERE passenger_ID = "Devin"
    ORDER BY station_name;
    
#specific review for a specific user
SELECT * FROM Review
	WHERE passenger_ID = "Devin" AND rid = 1;
    
#Delete specific review for a specific user 
DELETE FROM Review WHERE passenger_ID="Devin" AND rid = 1;

#specific station info
SELECT * From Station;

#Line summary
#by name
SELECT station_name, order_number FROM Station_On_Line
    Where line_name = "L1"
    ORDER BY station_name;

#by station number
SELECT station_name, order_number FROM Station_On_Line
    WHERE line_name = "L1"
    ORDER BY order_number;

#number of Stations
SELECT line_name, count(*)
	FROM Station_On_Line
	WHERE line_name = "L1";
    
#Buy T-mes
INSERT INTO Card
	VALUES("Devin", "T-mes", now(), NULL, DATE_ADD(now(), INTERVAL 1 MONTH));

#Buy T-10
INSERT INTO Card
	VALUES("Devin", "T-10", now(), 10, NULL);
    
#Buy T-50/30
INSERT INTO Card
	VALUES("Devin", "T-50/30", now(), 50, DATE_ADD(now(), INTERVAL 30 DAY));
    
#Buy T-jove
INSERT INTO Card
	VALUES("Devin", "T-jove", now(), NULL, DATE_ADD(now(), INTERVAL 90 DAY));
    
SELECT * FROM Card;
    
    