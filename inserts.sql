INSERT INTO User
	VALUES("admin", "first", "m", "last", "pass", "admin@gmail.com");
    
INSERT INTO Admin
	VALUES("admin");

INSERT INTO User 
	VALUES ("Devin", "Devin", "D", 'Higgins', "pass", 'devin@gmail.com');
    
INSERT INTO User 
	VALUES ("Logan", "Logan", "L", 'Short', "pass", 'logan@gmail.com');
    
INSERT INTO User 
	VALUES ("Alexander", "Alexander", "A", 'Schott', "pass", 'alexander@gmail.com');
    
INSERT INTO Station
	VALUES("espanya", "open", "cat", "placa espanya", 3, "barcelona" );
    
INSERT INTO Station
	VALUES("catalunya", "open", "cat", "placa catalunya", 4, "barcelona" );
    
INSERT INTO Station
	VALUES("arc de triumph", "open", "cat", "arc de triumph", 5, "barcelona" );
    
    
INSERT INTO Line 
	VALUES("L1");
    
INSERT INTO Card
	VALUES("Devin", "T-mes", '2019-05-10 10:34:09' , 100, '2019-06-10');
    
INSERT INTO Card
	VALUES("Logan", "T-mes", '2019-05-10 10:34:09' , 100, '2019-06-10');
    
INSERT INTO Card
	VALUES("Alexander", "T-mes", '2019-05-10 10:34:09' , 100, '2019-06-10');
    
INSERT INTO Trip
	VALUES("Devin", "T-mes", '2019-05-10 10:34:09', '2019-05-11 10:30:09', null, "espanya", null);
    
INSERT INTO Review
	VALUES("Devin", 1, 1, 10, "I like train", null, "pending", null, "espanya");
    
INSERT INTO Review
	VALUES("Devin", 2, 1, 10, "I dont like train", null, "pending", null, "catalunya");
    
INSERT INTO Admin_Add_Line
	VALUES("L1", "admin", '2019-05-10 10:34:09');
    
INSERT INTO Admin_Add_Station
	VALUES("espanya", "admin", '2019-05-10 10:34:09');
    
INSERT INTO Station_On_Line
	VALUES("espanya", "L1", 5);
    
INSERT INTO Station_On_Line
	VALUES("catalunya", "L1", 6);
    

