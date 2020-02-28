# Same as best answer from community

SELECT player_name, games, round(hits/at_bats::DECIMAL, 3)::text AS batting_average
FROM yankees
WHERE at_bats > 100
ORDER BY batting_average DESC