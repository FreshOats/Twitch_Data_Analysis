SELECT * 
FROM chat, stream
LIMIT 20;

SELECT DISTINCT game
FROM stream;

SELECT DISTINCT channel 
FROM stream;

SELECT DISTINCT game, COUNT(*)
FROM stream
GROUP BY game
ORDER BY COUNT(*) DESC;

SELECT DISTINCT country, COUNT(*)
FROM stream
WHERE game IS 'League of Legends'
GROUP BY country
ORDER BY COUNT(*) DESC;


SELECT DISTINCT player, COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 2 DESC;

SELECT game, 
 CASE 
  WHEN game = 'League of Legends' THEN 'MOBA'
  WHEN game = 'Dota 2' THEN 'MOBA'
  WHEN game = 'Heroes of the Storm' THEN 'MOBA'
  WHEN game = 'Counter-Strike: Global Offensive' THEN 'FPS'
  WHEN game = 'DayZ' THEN 'Survival'
  WHEN game = 'ARK: Survival Evolved' THEN 'Survival'
  ELSE 'Other'
  END AS 'genre', 
  COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 3 DESC;


SELECT strftime('%H', time), COUNT(*)
FROM stream
WHERE country IS 'US'
GROUP BY 1;


SELECT * 
FROM stream 
JOIN chat
  ON stream.device_id AND chat.device_id;