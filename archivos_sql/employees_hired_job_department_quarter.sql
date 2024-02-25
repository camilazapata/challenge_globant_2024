CREATE OR REPLACE VIEW hired_employees_quarter_vw AS
    SELECT
        department,
        job,
        SUM(CASE WHEN datetime_quarter = 1 THEN 1 ELSE 0 END) AS Q1,
        SUM(CASE WHEN datetime_quarter = 2 THEN 1 ELSE 0 END) AS Q2,
        SUM(CASE WHEN datetime_quarter = 3 THEN 1 ELSE 0 END) AS Q3,
        SUM(CASE WHEN datetime_quarter = 4 THEN 1 ELSE 0 END) AS Q4
    FROM hired_employees_vw
    WHERE datetime_year = 2021
    GROUP BY department, job
    ORDER BY department, job
    ;