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

