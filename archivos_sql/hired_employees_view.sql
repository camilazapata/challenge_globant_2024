CREATE OR REPLACE VIEW hired_employees_vw AS
    SELECT
        he.id,
        he.name,
        he.datetime,
        cast(he.datetime as date) as datetime_dt,
        year(cast(he.datetime as date)) as datetime_year,
        quarter(cast(he.datetime as date)) as datetime_quarter,
        he.department_id,
        coalesce(de.department, "Not Defined") as department,
        he.job_id,
        coalesce(jo.job, "Not Defined") as job
    FROM hired_employees he
    LEFT JOIN departments de ON he.department_id = de.id
    LEFT JOIN jobs jo ON he.job_id = jo.id
    ;