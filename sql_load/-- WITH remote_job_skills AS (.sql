-- WITH remote_job_skills AS (
--     SELECT
--         skill_id,
--         COUNT(*) AS skill_count
--     FROM
--         skills_job_dim AS skills_to_job
--     INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
--     WHERE
--         job_postings.job_work_from_home = TRUE AND job_title_short = 'Data Analyst'
--     GROUP BY
--         skill_id
-- )

-- SELECT skills.skill_id,
--     skills AS skill_name,
--     skill_count
-- FROm remote_job_skills
-- INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
-- ORDER BY
--     skill_count DESC
-- LIMIT 5

SELECT quater1_job_postings.job_title_short,
    quater1_job_postings.job_location,
    quater1_job_postings.job_via,
    quater1_job_postings.job_posted_date::date,
    quater1_job_postings.salary_year_avg
FROM (
    SELECT * FROM january_jobs
    UNION ALL
    SELECT * FROM january_jobs
    UNION ALL
    SELECT * FROM january_jobs
) AS quater1_job_postings
WHERE 
    quater1_job_postings.salary_year_avg > 70000 AND 
    quater1_job_postings.job_title_short = 'Data Analyst'
ORDER BY
    quater1_job_postings.salary_year_avg DESC