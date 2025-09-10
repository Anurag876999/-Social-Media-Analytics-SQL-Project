-- Create database & schema
DROP DATABASE IF EXISTS sma;
CREATE DATABASE sma;
USE sma;

-- Users table
CREATE TABLE users (
    user_id       BIGINT AUTO_INCREMENT PRIMARY KEY,
    username      VARCHAR(100) NOT NULL UNIQUE,
    full_name     VARCHAR(255),
    created_at    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Posts table
CREATE TABLE posts (
    post_id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    author_id      BIGINT NOT NULL,
    content        TEXT NOT NULL,
    created_at     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    like_count     INT NOT NULL DEFAULT 0,
    comment_count  INT NOT NULL DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Likes table
CREATE TABLE likes (
    like_id     BIGINT AUTO_INCREMENT PRIMARY KEY,
    post_id     BIGINT NOT NULL,
    user_id     BIGINT NOT NULL,
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_like (post_id, user_id),
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Comments table
CREATE TABLE comments (
    comment_id  BIGINT AUTO_INCREMENT PRIMARY KEY,
    post_id     BIGINT NOT NULL,
    user_id     BIGINT NOT NULL,
    content     TEXT NOT NULL,
    created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
