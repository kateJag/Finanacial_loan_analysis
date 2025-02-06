SELECT * FROM fin_loan
LIMIT 10

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/bank_loan_f.csv"
INTO TABLE fin_loan
FIELDS TERMINATED BY ';'  
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  

SET SESSION sql_mode = '';

CREATE TABLE fin_loan (
    id BIGINT PRIMARY KEY,
    address_state VARCHAR(50),
    application_type VARCHAR(50),
    emp_length VARCHAR(50),
    emp_title VARCHAR(100),
    grade VARCHAR(50),
    home_ownership VARCHAR(50),
    issue_date DATE,
    last_credit_pull_date DATE,
    last_payment_date DATE,
    loan_status NVARCHAR(50),
    next_payment_date DATE,
    member_id BIGINT,
    purpose VARCHAR(50),
    sub_grade VARCHAR(50),
    term VARCHAR(50),
    verification_status VARCHAR(50),
    annual_income FLOAT,
    dti FLOAT,
    installment FLOAT,
    int_rate FLOAT,
    loan_amount INT,
    total_acc INT,
    total_payment INT
);

SHOW warnings



