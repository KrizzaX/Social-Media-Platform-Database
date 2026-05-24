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

-- Query 4 Count the number of likes on a particular post
SELECT COUNT(user_id) AS Like_Count
FROM Likes
WHERE post_id = X;

-- Query 5 List all friends of a specific user.
SELECT u.*
FROM Users u
JOIN FriendShips f
    ON u.user_id = f.addressee_id
WHERE f.requester_id = X
  AND f.status = 'accepted'

UNION

SELECT u.*
FROM Users u
JOIN FriendShips f
    ON u.user_id = f.requester_id
WHERE f.addressee_id = X
  AND f.status = 'accepted';


-- Query 6 Find all unread messages for a user.
SELECT m.*
FROM Messages m
JOIN Chat_Participants cp
    ON m.chat_id = cp.chat_id
WHERE cp.user_id = X
  AND m.sender_id <> X
  AND m.status = 'Unread';