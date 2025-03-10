-- Fill our table, with data.

COPY loan_data
FROM 'D:\SQL_Data_For_Projects\Data_For_Practice2\sba_loan.txt'
WITH (FORMAT text, DELIMITER E'\t', HEADER TRUE, ENCODING 'UTF8');

SELECT * FROM loan_data


