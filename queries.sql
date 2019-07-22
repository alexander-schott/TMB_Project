#Login
SELECT ID, password FROM User
	WHERE ID = "Devin";
    
#Check if Admin
SELECT ID FROM ADMIN
		WHERE ID = "Admin";
        
#Register
INSERT INTO User 
	VALUES ("Jackson", "Jackson", null, "HALL", "password", 'jackson@gmail.com');
    
#Make Admin
INSERT INTO Admin
	VALUES("Jackson");
    
#Passenger page
SELECT first_name, last_name FROM User
	WHERE ID = "Devin";
    
#Get all stations
SELECT name FROM Station
	ORDER BY name;
    
#Submit Review
INSERT INTO Review
	VALUES("Devin", 3, 5, 5, NULL, NULL, "pending", NULL, "catalunya");

#All reviews for a specific user
SELECT * FROM Review
	WHERE passenger_ID = "Devin";
    

#All reviews for a user sorted by a review ID
SELECT * FROM Review
	WHERE passenger_ID = "Devin"
    ORDER BY rid;    

#All reviews for a user sorted by a station
SELECT * FROM Review
	WHERE passenger_ID = "Devin"
    ORDER BY station_name;

#All reviews for a user sorted by shopping 
SELECT * FROM Review
	WHERE passenger_ID = "Devin"
    ORDER BY shopping;
    
#All reviews for a user sorted by connection speed 
SELECT * FROM Review
	WHERE passenger_ID = "Devin"
    ORDER BY connection_speed;
    
#All reviews for a user sorted by review status
SELECT * FROM Review
	WHERE passenger_ID = "Devin"
    ORDER BY approval_status;
    
#specific review for a specific user
SELECT * FROM Review
	WHERE passenger_ID = "Devin" AND rid = 1;
    
#Delete specific review for a specific user 
DELETE FROM Review WHERE passenger_ID="Devin" AND rid = 1;

#Edit Review
UPDATE Review
	SET shopping = 0, connection_speed = 0, comment = "I changed my mind.", approver_ID = NULL, approval_status = "pending", edit_timestamp = NOW()
    WHERE passenger_ID = "Devin" AND rid = 1;

#specific station info
SELECT * From Station
	WHERE name = "espanya";
    
#Get Approved Reviews and the average ratings from them 
SELECT comment, passenger_ID, shopping, connection_speed FROM Review 
	WHERE station_name = "espanya" AND approval_status = "approved";
    
#average ratings for a specific station
SELECT AVG(shopping), AVG(connection_speed) FROM Review
	WHERE station_name = "espanya" AND approval_status = "approved";
    
#Get all the lines that run through a station
SELECT line_name FROM Station_On_Line
	WHERE station_name = "espanya";
    
#Edit profile stuff
SELECT * FROM User;

#update a user
UPDATE User
SET ID = "Devin1"
WHERE ID = "Devin";

#delete a user
DELETE FROM User WHERE ID = "Logan";


#Delete an Admin
####################################

#remove lines added by a admin when admin deletes account
DELETE FROM Line
WHERE name IN (SELECT line_name
	From Admin_Add_Line
	WHERE admin_ID = "admin");
    
#remove stations added by an admin when admin is deleted
DELETE FROM Station
WHERE name IN (SELECT station_name
	From Admin_Add_Station
	WHERE admin_ID = "admin");
    
DELETE FROM User WHERE ID = "admin";

######################################
    
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

#Go on a Trip stuff
SELECT name FROM Station ORDER BY name;

#get the user's valid cards
SELECT * FROM Card
	WHERE user_ID = "Devin" AND expiration_date > now() AND (uses_left IS NULL OR uses_left > 0);
    
#start Trip
INSERT INTO Trip
	VALUES("Devin", "T-mes", '2019-05-10 10:34:09', now(), NULL, "espanya", NULL);
    #VALUES("Devin", "T-mes", '2019-05-10 10:34:09', '2019-05-10 10:34:09', NULL, "espanya", NULL);
    
UPDATE Card
SET uses_left = uses_left - 1
WHERE user_ID = "Devin" AND type = "T-mes" AND purchase_date_time = '2019-05-10 10:34:10';

#Finish Trip
UPDATE Trip
SET end_date_time = now(), to_station_name = "espanya"
WHERE user_ID = "Devin" AND card_type = "T-mes" AND start_date_time = '2019-05-10 10:34:09' AND card_purchase_date_time = '2019-05-10 10:34:09';

#View Trips
# by destination
SELECT * FROM TRIP
	WHERE user_ID = "Devin"
    ORDER BY to_station_name;
    
# by start point
SELECT * FROM TRIP
	WHERE user_ID = "Devin"
    ORDER BY from_station_name;
    
# by start time
SELECT * FROM TRIP
	WHERE user_ID = "Devin"
    ORDER BY start_date_time;

# Review passenger reviews
SELECT * FROM REVIEW
	WHERE status = "pending";
    
#Approve/reject Review
UPDATE REVIEW
SET approval_status = "approved"
WHERE passenger_ID = "Devin" AND rid = 1;

#ADD STATION
############################
INSERT Station
	VALUES("Arc de Triomf", "open", "Catalonia", "1 Carrer de Reeves", 666, Barcelona);
    
INSERT Station_On_Line
	VALUES("Arc de Triomf", "L1", 9);
    
INSERT Admin_Add_Station
	VALUES("Arc de Triomf", "admin", now());
#############################
    
#remove station
DELETE FROM Station
	WHERE name = "Arc de Triomf";

#ADD LINE
##################################
INSERT LINE
	VALUES("L4");

INSERT Admin_Add_Line
	VALUES("L4", "admin", now());
##################################
    
#Remove station from Line
DELETE FROM Station_On_Line
	WHERE station_name = "catalunya" AND line_name = "L1";
    
#update station position on line
UPDATE Station_On_Line
	SET order_number = 10
    WHERE station_name = "espanya" AND line_name = "L1";
    






    
    