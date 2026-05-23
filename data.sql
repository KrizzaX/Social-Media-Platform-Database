INSERT INTO user VALUES 
(1, 'jane123','pass1','Jane Smith', '2001-03-03','New York', 'public'),
(2, 'samuel3','pass2','Sam Watson', '2000-07-12','New Jersey', 'public'),
(3,'xoxo_97', 'pass1', 'Emily Doe', '1997-06-15', 'Boston', 'private'),
(4,'anna_gomez7', 'pass3', 'Anna Gomez', '2003-06-05', 'New York', 'private'),
(5,'steph.kim', 'pass4', 'Stephany Kim', '1999-02-03', 'New York', 'private');

INSERT INTO post VALUES
(1,1,'Hello everyone!','text.txt','text','2024-06-01 10:00:00','New York','public'),
(2,1,'Graduation!','graduation.jpeg','image','2024-06-01 14:00:00','New York','public'),
(3,2,NULL,'photo.jpeg','image','2023-09-01 14:30:00','New York','public'),
(4,3,'Dogs!','photo.jpeg','image','2013-10-11 18:30:00','Boston','private'),
(5,5,'Sunny day!','photo.jpeg','image','2023-08-01 08:30:00','San Francisco','public');


INSERT INTO comment VALUES
(1,1,2,'Great!','2024-06-06 10:10:00'),
(2,2,4,'Congrats!','2025-06-12 08:10:00'),
(3,1,4,'Hello!','2026-06-12 18:00:00'),
(4,5,5,'Miss you!','2014-10-12 18:00:00'),
(5,5,1,'See you soon!','2024-12-12 15:30:00');

INSERT INTO likes VALUES
(1,4,2,'2015-10-10  10:05:00'),
(2,1,3,'2025-01-16 11:17:00'),
(3,2,5,'2024-06-06 04:05:00'),
(4,2,4,'2025-07-10 14:10:00'),
(5,1,5,'2024-06-16 05:30:00');

INSERT INTO friendship_status VALUES 
(1,1,2,'2025-02-02', 'Friends'),
(2,3,4,'2015-02-12', 'Friends'),
(3,3,5,'2026-04-11', 'Requested'),
(4,4,5,'2026-05-01', 'Requested'),
(5,4,2,'2026-05-11', 'Friends');

INSERT INTO message VALUES
(1,,2,'Do you need help?','2024-10-10 09:07:00','read'),
(2,2,1,'Hi! I am good, thanks.','2024-06-17 09:12:00','read'),
(3,3,4,'Thank you!','2026-03-12 12:00:00','delivered'),
(4,2,1,'I will be there!','2014-10-06 10:12:00','read'),
(5,5,1,'How are you?','2024-08-26 11:30:00','read');

INSERT INTO notification VALUES
(1,1,'like','Someone liked your post','2025-06-08 10:30:00','read'),
(2,5,'Friend Request','You have a new friend request','2014-06-06 10:15:00','read'),
(3,1,'comment','You have a new comment','2023-09-09 10:30:00','unread'),
(4,2,'message','You received a message','2023-08-12 17:10:00', 'read'), 
(5,1,'like', 'Someone liked your post','2026-04-14 12:22:00', 'read');

INSERT INTO groups VALUES
(1,'Road Trip','private','2025-01-30',3),
(2,'Food Recommendations','public','2026-02-25',5),
(3,'Family Chat','private','2025-09-25',3),
(4,'Business','public','2024-04-10',1),
(5,'Baseball Club','private','2014-05-11',2);

INSERT INTO group_membership VALUES
(1,4,1,'admin','2024-08-10','active'),
(2,1,5,'member','2025-01-30','inactive'),
(3,2,2,'member','2026-02-10','active'),
(4,3,1,'admin','2025-01-03','active'),
(5,5,3,'member','2016-09-14','inactive');

INSERT INTO follow VALUES
(5,2,'2026-06-12'),
(2,3,'2025-06-11'),
(2,1,'2025-03-12'),
(4,3,'2024-09-05'),
(5,3,'2026-06-04');