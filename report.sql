USE sma;

-- Top 10 posts by engagement (last 30 days)
SELECT * FROM v_post_engagement
WHERE created_at >= NOW() - INTERVAL 30 DAY
ORDER BY engagement_score DESC
LIMIT 10;

-- Export to CSV (run in HeidiSQL with right-click -> Export grid rows)
SELECT * FROM v_post_engagement;

-- Author leaderboard
SELECT * FROM v_author_leaderboard LIMIT 10;
