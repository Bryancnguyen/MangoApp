-- delete from Users;
-- delete from Matching_criteria;
-- delete from Slices;
-- delete from Reviews;

INSERT INTO Users VALUES (1, 'test1', NULL, 'test1@gmail.com', NULL, NULL);
INSERT INTO Users VALUES (2, 'test2', NULL, 'test2@gmail.com', NULL, NULL);
INSERT INTO Users VALUES (3, 'test3', NULL, 'test3@gmail.com', NULL, NULL);
INSERT INTO Users VALUES (4, 'test4', NULL, 'test4@gmail.com', NULL, NULL);
INSERT INTO Users VALUES (5, 'test5', NULL, 'test5@gmail.com', NULL, NULL);
INSERT INTO Users VALUES (6, 'test6', NULL, 'test6@gmail.com', NULL, NULL);
INSERT INTO Users VALUES (7, 'test7', NULL, 'test7@gmail.com', NULL, NULL);
INSERT INTO Users VALUES (8, 'test8', NULL, 'test8@gmail.com', NULL, NULL);
INSERT INTO Users VALUES (9, 'test9', NULL, 'test9@gmail.com', NULL, NULL);
INSERT INTO Users VALUES (10, 'test10', NULL, 'test10@gmail.com', NULL, NULL);
INSERT INTO Users VALUES (11, 'test11', NULL, 'test11@gmail.com', NULL, NULL);
INSERT INTO Users VALUES (12, 'test12', NULL, 'test12@gmail.com', NULL, NULL);

SELECT * FROM Users;


INSERT INTO Matching_criteria VALUES (1, 0, 2, 1, NULL);
INSERT INTO Matching_criteria VALUES (2, 1, 10, 0, NULL);
INSERT INTO Matching_criteria VALUES (3, 1, 50, 0, NULL);
INSERT INTO Matching_criteria VALUES (4, 0, 5, 1, NULL);
INSERT INTO Matching_criteria VALUES (5, 0, 1, 1, NULL);
INSERT INTO Matching_criteria VALUES (6, 0, 2, 1, NULL);

SELECT * FROM Matching_criteria;

INSERT INTO Slices VALUES (0, 'San Jose', 0, 1, 3);
INSERT INTO Slices VALUES (1, 'Great America', 0, 2, 3);
INSERT INTO Slices VALUES (2, 'Tech Museum', 1, 1, 4);
INSERT INTO Slices VALUES (3, 'San Jose Bar of Drinking Responsibly', 1, 1, 4);
INSERT INTO Slices VALUES (4, 'Computer Science Museum', 0, 1, 3);
INSERT INTO Slices VALUES (5, 'Silicon Valley Company Campus Tour', 0, 4, 5);
INSERT INTO Slices VALUES (6, 'San Jose Night', 0, 4, 6);

SELECT * FROM Slices;

INSERT INTO Reviews VALUES (1, 1, "A terrible idea", 3, 11);
INSERT INTO Reviews VALUES (2, 3, "An alright idea", 4, 12);
INSERT INTO Reviews VALUES (3, 4, "A good idea", 2, 5);
INSERT INTO Reviews VALUES (4, 4, "A good idea", 3, 7);
INSERT INTO Reviews VALUES (5, 5, "A good idea", 1, 4);
INSERT INTO Reviews VALUES (6, 5, "A good idea", 6, 1);

SELECT * FROM Reviews;
