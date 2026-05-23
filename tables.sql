CREATE DATABASE IF NOT EXISTS social_media;
USE social_media;


-- User table
CREATE TABLE user (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    location VARCHAR(100),
    privacy_setting VARCHAR(20),
    created_date DATE
);


-- Post table
CREATE TABLE post (
    post_id INT PRIMARY KEY,
    user_id INT,
    content TEXT,
    post_date DATETIME,
    visibility VARCHAR(20),

    CONSTRAINT fk_post_user
        FOREIGN KEY (user_id)
        REFERENCES user(user_id)
);


-- Comment table
CREATE TABLE comment (
    comment_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    comment_text TEXT,
    timestamp DATETIME,

    CONSTRAINT fk_comment_post
        FOREIGN KEY (post_id)
        REFERENCES post(post_id),

    CONSTRAINT fk_comment_user
        FOREIGN KEY (user_id)
        REFERENCES user(user_id)
);


-- Like table
CREATE TABLE likes (
    like_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    like_date DATETIME,

    CONSTRAINT fk_like_post
        FOREIGN KEY (post_id)
        REFERENCES post(post_id),

    CONSTRAINT fk_like_user
        FOREIGN KEY (user_id)
        REFERENCES user(user_id)
);


-- Message table
CREATE TABLE message (
    message_id INT PRIMARY KEY,
    sender_user_id INT,
    receiver_user_id INT,
    message_text TEXT,
    sent_time DATETIME,

    CONSTRAINT fk_sender
        FOREIGN KEY (sender_user_id)
        REFERENCES user(user_id),

    CONSTRAINT fk_receiver
        FOREIGN KEY (receiver_user_id)
        REFERENCES user(user_id)
);


-- Chat table
CREATE TABLE chats (
    chat_id INT PRIMARY KEY,
    chat_name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Chat participants table
CREATE TABLE chat_participants (
    chat_id INT,
    user_id INT,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (chat_id, user_id),

    CONSTRAINT fk_chat_participants_chat
        FOREIGN KEY (chat_id)
        REFERENCES chats(chat_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_chat_participants_user
        FOREIGN KEY (user_id)
        REFERENCES user(user_id)
        ON DELETE CASCADE
);


-- Group table
CREATE TABLE groups (
    group_id INT PRIMARY KEY,
    group_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);


-- Group membership table
CREATE TABLE group_membership (
    membership_id INT PRIMARY KEY,
    group_id INT,
    user_id INT,
    role VARCHAR(20),
    join_date DATE,
    membership_status VARCHAR(20),

    CONSTRAINT fk_membership_group
        FOREIGN KEY (group_id)
        REFERENCES groups(group_id),

    CONSTRAINT fk_membership_user
        FOREIGN KEY (user_id)
        REFERENCES user(user_id)
);


-- Follow table
CREATE TABLE follow (
    follower_user_id INT,
    followed_user_id INT,
    follow_date DATE,

    PRIMARY KEY (follower_user_id, followed_user_id),

    CONSTRAINT fk_follower
        FOREIGN KEY (follower_user_id)
        REFERENCES user(user_id),

    CONSTRAINT fk_followed
        FOREIGN KEY (followed_user_id)
        REFERENCES user(user_id)
);


-- Friendship status table
CREATE TABLE friendship_status (
    request_id INT PRIMARY KEY,
    sender_user_id INT,
    receiver_user_id INT,
    request_date DATE,
    status VARCHAR(20),

    CONSTRAINT fk_sender_user
        FOREIGN KEY (sender_user_id)
        REFERENCES user(user_id),

    CONSTRAINT fk_receiver_user
        FOREIGN KEY (receiver_user_id)
        REFERENCES user(user_id)
);


-- Notification table
CREATE TABLE notification (
    notification_id INT PRIMARY KEY,
    user_id INT,
    notification_text TEXT,
    notification_date DATETIME,
    is_read BOOLEAN,

    CONSTRAINT fk_notification_user
        FOREIGN KEY (user_id)
        REFERENCES user(user_id)
);