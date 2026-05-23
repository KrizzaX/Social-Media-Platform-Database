--EXAMPLES OF QUERIES based on Company Example Relations:

--Retrieve all posts made by users from New York
SELECT u.name, p.text, p.timestamp
FROM user u
JOIN post p ON u.user_id = p.user_id
WHERE u.location = 'New York';

--Find users born after January 1, 2000
SELECT name, date_of_birth
FROM user
WHERE date_of_birth > '2000-01-01';

--Retrieve the user's name and privacy setting for Jane Smith
SELECT name, privacy_setting
FROM user
WHERE name = 'Jane Smith';

--Update message read status
UPDATE message
SET read_status = 'read'
WHERE message_id = 3;