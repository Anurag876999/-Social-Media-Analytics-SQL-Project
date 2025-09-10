USE sma;

-- Insert 20 users
INSERT INTO users (username, full_name, created_at)
VALUES 
('user1', 'User 1', NOW() - INTERVAL 20 DAY),
('user2', 'User 2', NOW() - INTERVAL 19 DAY),
('user3', 'User 3', NOW() - INTERVAL 18 DAY),
('user4', 'User 4', NOW() - INTERVAL 17 DAY),
('user5', 'User 5', NOW() - INTERVAL 16 DAY);

-- (repeat until user20)

-- Insert 10 example posts
INSERT INTO posts (author_id, content, created_at) VALUES
(1, 'Post 1 - MySQL analytics demo', NOW() - INTERVAL 5 DAY),
(2, 'Post 2 - Trigger test', NOW() - INTERVAL 4 DAY),
(3, 'Post 3 - Ranking system', NOW() - INTERVAL 3 DAY);

-- Likes
INSERT INTO likes (post_id, user_id) VALUES (1,2), (1,3), (2,1);

-- Comments
INSERT INTO comments (post_id, user_id, content) VALUES
(1,2,'Great post!'),
(1,3,'Thanks for sharing!'),
(2,1,'Good idea.');
