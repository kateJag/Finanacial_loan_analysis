-- 1.0) Total loan applications
SELECT COUNT(id) AS total_applications
FROM fin_loan;

-- 1.1) Month to Day Loan Applications
SELECT COUNT(id) AS MTD_Total_Applications
FROM fin_loan
WHERE MONTH(issue_date)=12 AND YEAR(issue_date) = 2021;

-- 1.2) Previous Month to Day Loan Applications
SELECT COUNT(id) AS PMTD_Total_Applications
FROM fin_loan
WHERE MONTH(issue_date)= 11 AND YEAR(issue_date) = 2021;

-- 2.1) Total Funded Amount
SELECT SUM(loan_amount) AS Tptal_Funded_Amount 
FROM fin_loan;

-- 2.2) Month and to DAY Total Funded Amount
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM fin_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- 2.3) Previous Month and to DAY Total Funded Amount
SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount 
FROM fin_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- 3.1 Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Received 
FROM fin_loan;

-- 3.2 Month and to DAY Total Amount Received
SELECT SUM(total_payment) AS MTD_Total_Amount_Received 
FROM fin_loan
WHERE MONTH(issue_date)=12  AND YEAR(issue_date)=2021;

-- 3.3 Previous Month and to DAY Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Received 
FROM fin_loan
WHERE MONTH(issue_date)=11  AND YEAR(issue_date)=2021;

-- 4.1 Average interest Rate
SELECT ROUND(AVG(int_rate), 3) *100 AS Average_interest_rate
FROM fin_loan;

-- 4.2 Month to Date Average interest Rate
SELECT ROUND(AVG(int_rate), 3) *100 AS MTD_Average_interest_rate
FROM fin_loan
WHERE MONTH(issue_date)=12 AND YEAR(issue_date)=2021;

-- 4.3 Previous Month to Date Average interest Rate
SELECT ROUND(AVG(int_rate), 3) *100 AS PMTD_Average_interest_rate
FROM fin_loan
WHERE MONTH(issue_date)=11 AND YEAR(issue_date)=2021;

SELECT 
    ROUND(
        (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current'
             THEN id
             END)*100.0)
             /
             COUNT(id), 2) AS Good_loan_percentage
FROM fin_loan

-- Grid View
SELECT 
    loan_status,
    COUNT(id) AS Loan_Count,
    SUM(total_payment) AS Total_amount_Areceived,
    SUM(loan_amount) AS Totao_amount_Funded,
    ROUND(AVG(int_rate)*100,4) AS Interest_rate,
    ROUND(AVG(dti)*100,4) AS DTI
FROM fin_loan
GROUP BY loan_status;

-- Monthly trend
SELECT 
    MONTH(issue_date) AS Month_number,
    MONTHNAME(issue_date) AS Month_name,
    COUNT(id) AS Total_Loan_applications,
    SUM(loan_amount) AS Total_funded_amount,
    SUM(total_payment) AS Total_received_amount
FROM fin_loan
GROUP BY Month_number, Month_name
ORDER BY Month_number DESC;
    

