CREATE OR REPLACE VIEW hired_employees_mean_vw AS
    SELECT
        department_id,
        department,
        COUNT(*) as num_employees
    FROM hired_employees_vw
    GROUP BY department_id, department
    HAVING COUNT(*) > (SELECT AVG (num_employees) as mean_employees
                        FROM ( SELECT
                                department,
                                count (1) as num_employees
                              FROM hired_employees_vw
                              WHERE datetime_year = 2021
                              GROUP BY department )
                        )
      ORDER BY 3 DESC
    ;