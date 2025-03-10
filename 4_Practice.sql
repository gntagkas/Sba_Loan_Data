/*
Which states got the most loans?
*/

SELECT
    state,
    COUNT(*) AS amount
FROM loan_data
GROUP BY state
ORDER BY amount DESC

/*
How many businesses received loans over $100,000?
*/

SELECT business_name,
FROM loan_data
WHERE loan_amount > 100000

/*
What was the average loan by state?
*/

SELECT
    state,
    ROUND(AVG(loan_amount),0)
FROM loan_data
GROUP BY state

/*
Which are the 10 cities with the most loans?
*/

SELECT
    city,
    COUNT(*) loans
FROM loan_data
GROUP BY city
ORDER BY loans DESC

/*
What is the average loan price by state?
*/

SELECT
    state,
    ROUND(AVG(loan_amount),1) AS loans
FROM loan_data
GROUP BY state
ORDER BY loans DESC

/*
How many loans have been approved after 2020?
*/

SELECT
    business_name,
    approval_date
FROM loan_data
WHERE loan_status = 'Approved' AND
approval_date > '2020-01-01'

/*
Which bank has approved the most loans?
*/

SELECT
    bank_name,
    COUNT(*) AS loans_accepted
FROM loan_data
WHERE loan_status = 'Approved'
GROUP by bank_name
ORDER BY loans_accepted DESC

/*
Which business sectors (NAICS) received the most loans?
*/

SELECT
    naics_code,
    COUNT(*) AS amount
FROM loan_data
GROUP BY naics_code
ORDER BY amount DESC
LIMIT 1

/*
What is the largest loan amount approved and in which state?
*/

SELECT
    business_name,
    loan_amount,
    state
FROM loan_data
ORDER BY loan_amount DESC
LIMIT 1

/*
Which companies have managed to keep the most jobs?
*/

SELECT
    business_name,
    SUM(jobs_retained) AS total_jobs
FROM loan_data
GROUP BY business_name
ORDER BY total_jobs DESC

/*
Created a report showing the total value of loans each year.
*/

SELECT
    EXTRACT (year from approval_date) AS year,
    SUM(loan_amount) AS values
FROM loan_data
GROUP BY year
ORDER BY year DESC

/*
Created a ranking (RANK) of the states with the most loan approvals.
*/

SELECT
    RANK() OVER (ORDER BY COUNT(*)) AS rank,
    state,
    COUNT(*) AS Amount_of_loan_approvals
FROM loan_data
WHERE loan_status = 'Approved'
GROUP BY state
ORDER BY rank

/*
Find the total amount of loans (loan_amount) per year.
*/

SELECT
    EXTRACT (year from approval_date) AS year,
    COUNT(*) AS loan_amount
FROM loan_data
GROUP BY year

/*
Find out how many loans were approved by bank, but only 
show the banks that made more than 100 loans (both approved and declined).
*/

SELECT
    bank_name,
    COUNT(*) AS loans_approved
FROM loan_data
WHERE loan_status='Approved' AND
bank_name IN (
    SELECT
        bank_name
    FROM loan_data
    GROUP BY bank_name
    HAVING COUNT(*) > 18
)
GROUP BY bank_name

SELECT 
    bank_name, 
    COUNT(CASE WHEN loan_status = 'Approved' THEN 1 END) AS approved_loans
FROM loan_data
WHERE bank_name IN (
    SELECT
        bank_name
    FROM loan_data
    GROUP BY bank_name
    HAVING COUNT(*) > 18
GROUP BY bank_name

/*
create a new category that will label loans as 
"Small", "Medium", "Large", depending on their amount.
*/

SELECT
    loan_id,
    city,
    state,
CASE 
WHEN loan_amount > 250000 THEN 'Large'
WHEN loan_amount < 150000 THEN 'Small'
ELSE 'Medium'
END AS loan_size
FROM loan_data

/*
Find all loans that are above the average of all loans.
*/

SELECT
    loan_id,
    city
FROM loan_data
WHERE loan_amount >
(   SELECT
        AVG(loan_amount)
    FROM loan_data
)

/*
Add a column showing the running total of loans by year.
*/

SELECT
    EXTRACT (years from approval_date) AS year,
    SUM(loan_amount) AS total_loans
FROM loan_data
GROUP BY year

