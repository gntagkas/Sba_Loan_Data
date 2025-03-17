-- Create loan_data Table

CREATE TABLE loan_data (
    loan_id INTEGER PRIMARY KEY,
    business_name TEXT,
    loan_amount NUMERIC,
    loan_status TEXT,
    city TEXT,
    state TEXT,
    approval_date DATE,
    bank_name TEXT,
    naics_code NUMERIC,
    jobs_retained INT
)


-- Set ownership of the tables to the postgres user


ALTER TABLE loan_data OWNER TO postgres;