/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills_dim.skills AS skill_names,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    (job_title_short = 'Data Analyst') AND
    (salary_year_avg IS NOT NULL) AND 
    (job_work_from_home = TRUE)
GROUP BY
    skill_names
ORDER BY
    avg_salary DESC
LIMIT
    25;
/*
Result is:- 
[
  {
    "skill_names": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skill_names": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skill_names": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skill_names": "watson",
    "avg_salary": "160515"
  },
  {
    "skill_names": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skill_names": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skill_names": "swift",
    "avg_salary": "153750"
  },
  {
    "skill_names": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skill_names": "pandas",
    "avg_salary": "151821"
  },
  {
    "skill_names": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skill_names": "golang",
    "avg_salary": "145000"
  },
  {
    "skill_names": "numpy",
    "avg_salary": "143513"
  },
  {
    "skill_names": "databricks",
    "avg_salary": "141907"
  },
  {
    "skill_names": "linux",
    "avg_salary": "136508"
  },
  {
    "skill_names": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skill_names": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skill_names": "twilio",
    "avg_salary": "127000"
  },
  {
    "skill_names": "airflow",
    "avg_salary": "126103"
  },
  {
    "skill_names": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skill_names": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skill_names": "notion",
    "avg_salary": "125000"
  },
  {
    "skill_names": "scala",
    "avg_salary": "124903"
  },
  {
    "skill_names": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skill_names": "gcp",
    "avg_salary": "122500"
  },
  {
    "skill_names": "microstrategy",
    "avg_salary": "121619"
  }
]
*/
