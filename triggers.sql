USE sma;
DELIMITER $$

CREATE TRIGGER likes_after_insert
AFTER INSERT ON likes
FOR EACH ROW
BEGIN
  UPDATE posts SET like_count = like_count + 1 WHERE post_id = NEW.post_id;
END$$

CREATE TRIGGER likes_after_delete
AFTER DELETE ON likes
FOR EACH ROW
BEGIN
  UPDATE posts SET like_count = GREATEST(0, like_count - 1) WHERE post_id = OLD.post_id;
END$$

CREATE TRIGGER comments_after_insert
AFTER INSERT ON comments
FOR EACH ROW
BEGIN
  UPDATE posts SET comment_count = comment_count + 1 WHERE post_id = NEW.post_id;
END$$

CREATE TRIGGER comments_after_delete
AFTER DELETE ON comments
FOR EACH ROW
BEGIN
  UPDATE posts SET comment_count = GREATEST(0, comment_count - 1) WHERE post_id = OLD.post_id;
END$$

DELIMITER ;
