USE sma;

CREATE OR REPLACE VIEW v_post_engagement AS
SELECT
  p.post_id,
  u.username AS author_username,
  p.content,
  p.created_at,
  p.like_count,
  p.comment_count,
  (p.like_count + p.comment_count*2 + 
   CASE WHEN p.created_at >= NOW() - INTERVAL 7 DAY THEN 5 ELSE 0 END) AS engagement_score
FROM posts p
JOIN users u ON p.author_id = u.user_id;

CREATE OR REPLACE VIEW v_rank_all_time AS
SELECT
  v.*,
  RANK() OVER (ORDER BY engagement_score DESC, created_at DESC) AS rank_all_time
FROM v_post_engagement v;

CREATE OR REPLACE VIEW v_author_leaderboard AS
SELECT
  u.user_id,
  u.username,
  SUM(v.engagement_score) AS total_engagement,
  COUNT(*) AS posts_count,
  RANK() OVER (ORDER BY SUM(v.engagement_score) DESC) AS author_rank
FROM v_post_engagement v
JOIN users u ON u.user_id = v.author_id
GROUP BY u.user_id, u.username;
