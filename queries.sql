#Login
SELECT ID, password FROM User
	WHERE ID = "Devin";
    
#Check if Admin
SELECT ID FROM ADMIN
		WHERE ID = "Admin";
        
#Register
INSERT INTO User 
	VALUES ("Jackson", "Jackson", null, "HALL", "pass", 'jackson@gmail.com');
    
#Passenger page
SELECT first_name, last_name FROM User
	WHERE ID = "Devin";
    
#Get all stations
SELECT name FROM Station
	ORDER BY name;

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
SELECT * From Station
	WHERE name = "espanya";
    
#Get Approved Reviews and the average ratings from them 
SELECT comment, passenger_ID, shopping, connection_speed FROM Review 
	WHERE station_name = "espanya" AND approval_status = "approved";
    
SELECT AVG(shopping), AVG(connection_speed) FROM Review
	WHERE station_name = "espanya" AND approval_status = "approved";
    
#Get all the lines that run through a station
SELECT line_name FROM Station_On_Line
	WHERE station_name = "espanya";
    
#Edit profile stuff
SELECT * FROM User;

UPDATE User
SET ID = "Devin1"
WHERE ID = "Devin";

DELETE FROM User WHERE ID = "Devin";

#Go on a Trip stuff
SELECT name FROM Station ORDER BY name;

#get the user's valid cards
SELECT * FROM Card
	WHERE user_ID = "Devin" AND uses_left > 0 AND expiration_date > now();

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
    
#View Trips
SELECT * FROM TRIP
	WHERE user_ID = "Devin"
    ORDER BY to_station_name;

#Update Trip
UPDATE Trip
SET end_date_time = now(), to_station_name = "espanya"
WHERE user_ID = "Devin" AND card_type = "T-mes" AND start_date_time = "specific date" AND purchase_date_time = "specific date";

# REview passenger reviews
SELECT * FROM REVIEW
	WHERE status = "pending";
    
#Approve/reject Review
UPDATE REVIEW
SET status = "approved"
WHERE #user info;




    
    