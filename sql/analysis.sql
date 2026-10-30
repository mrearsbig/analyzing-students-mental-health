SELECT
    stay,
    COUNT(*)              AS count_int,      -- international students per stay length
    ROUND(AVG(todep), 2)  AS average_phq,    -- average PHQ-9 (depression)
    ROUND(AVG(tosc), 2)   AS average_scs,    -- average SCS (social connectedness)
    ROUND(AVG(toas), 2)   AS average_as      -- average ASISS (acculturative stress)
FROM students
WHERE inter_dom = 'Inter'                    -- international students only
GROUP BY stay                                -- one row per stay length
ORDER BY stay DESC;                          -- longest stay first