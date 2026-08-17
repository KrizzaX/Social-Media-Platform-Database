-- Query 1: Retrieve profile information for a specific user by username
SELECT *
FROM user
WHERE username = 'X';


-- Query 2: List all posts created by a particular user
SELECT p.*
FROM post p
JOIN user u
    ON p.user_id = u.user_id
WHERE u.username = 'X';


-- Query 3: Get all comments on a specific post
SELECT c.*
FROM comment c
WHERE c.post_id = X;


-- Query 4: Count the number of likes on a particular post
SELECT COUNT(*) AS like_count
FROM likes
WHERE post_id = X;


-- Query 5: List all friends of a specific user
SELECT u.*
FROM user u
JOIN friendship_status f
    ON u.user_id = f.receiver_user_id
WHERE f.sender_user_id = X
  AND f.status = 'Friends'

UNION

SELECT u.*
FROM user u
JOIN friendship_status f
    ON u.user_id = f.sender_user_id
WHERE f.receiver_user_id = X
  AND f.status = 'Friends';


-- Query 6: Find all messages received by a specific user
SELECT m.*
FROM message m
WHERE m.receiver_user_id = X;


-- Query 7: Retrieve all notifications for a specific user
SELECT n.*
FROM notification n
JOIN user u
    ON n.user_id = u.user_id
WHERE u.username = 'X';


-- Query 8: List all members of a particular group
SELECT u.*
FROM user u
JOIN group_membership gm
    ON u.user_id = gm.user_id
JOIN groups g
    ON gm.group_id = g.group_id
WHERE g.group_name = 'X';


-- Query 9: Find posts with at least a certain number of likes
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
HAVING COUNT(l.like_id) >= X
ORDER BY total_likes DESC;


-- Query 10: Retrieve all posts with a specific visibility setting
SELECT *
FROM post
WHERE visibility = 'X';
