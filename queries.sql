-- Query 1 Retrieve profile information for a specific user by username.
SELECT *
FROM Users
WHERE Username = 'X';

-- Query 2 List all posts created by a particular user.
SELECT p.*
FROM Posts p
JOIN Users u
    ON p.User_ID = u.User_ID
WHERE u.Username = 'X';

-- Query 3 Get all comments on a specific post.
SELECT c.*
FROM Comments c
WHERE c.Post_ID = X;

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

-- Query 7 Retrieve all notifications for a specific user.
SELECT n.*
FROM notification n
JOIN user u
    ON n.user_id = u.user_id
WHERE u.username = 'X';

-- Query 8 List all members of a particular group

SELECT u.user_id
FROM user u
JOIN group_membership gm 
  ON gm.user_id = u.user_id
JOIN group g
  ON g.id = gm.id
WHERE group_name = 'X';

-- Query 9 Find the most popular posts with a certain minimum number of likes.
SELECT 
    p.post_id, 
    p.content, 
    COUNT(l.like_id) AS total_likes
FROM post p
JOIN likes l 
    ON p.post_id = l.post_id
GROUP BY 
    p.post_id, 
    p.content
HAVING 
    COUNT(l.like_id) >= 'X'
ORDER BY 
    total_likes DESC;
  
-- Query 10 Retrieve all posts tagged with a specific location.
SELECT *
FROM post
WHERE location = 'X';