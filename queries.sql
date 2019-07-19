#Login
SELECT ID, password FROM User
	WHERE ID = "Devin";
    
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

