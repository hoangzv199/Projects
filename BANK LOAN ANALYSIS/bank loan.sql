--Overview
Select * from bank_loan
-- Task 1: Total Loan Applications 
--- Total Loan Applications
select count(distinct id) as Total_Loan_Applications from bank_loan
--- Month to Date 
select count(distinct id) as Total_Loan_Applications from bank_loan
where month(issue_date)=12
--- Month to Month
select count(distinct id) as PMTD_Total_Loan_Applications from bank_loan
where month(issue_date)=11
select count(distinct id) as MTD_Total_Loan_Applications from bank_loan
where month(issue_date)=12

--Task 2: Total Funded Amount
-- Total Funded Amount
select sum(loan_amount) as Total_Funded_Amount from bank_loan
---- Total Funded Amount MTD
select sum(loan_amount) as Total_Funded_Amount from bank_loan
where month(issue_date)=12

-- Task 3: Total Amounth Received
--- Total Payment Received
select sum(total_payment) as Total_Payment_Received from bank_loan 
--- Total Payment Received MTD
select sum(total_payment) as Total_Payment_Received_MTD from bank_loan 
where month(issue_date)=12
--- Total Payment Received MOM
select sum(total_payment) as Total_Payment_Received_MTD from bank_loan 
where month(issue_date)=12
select sum(total_payment) as Total_Payment_Received_PMTD from bank_loan 
where month(issue_date)=11
-- Task 4: Average Interest Rate
--- Average Interest Rate
select avg(int_rate)*100 as Average_Interest_Rate from bank_loan
--- Average Interest Rate MTD
select avg(int_rate)*100 as Average_Interest_Rate from bank_loan
where month(issue_date)=12
--- Average Interest Rate MOM
select avg(int_rate)*100 as MTD_Average_Interest_Rate from bank_loan
where month(issue_date)=12
select avg(int_rate)*100 as PMTD_Average_Interest_Rate from bank_loan
where month(issue_date)=11
-- Task 5: Average Debt-to-Income Ratio (DTI)
--- Average DTI
select avg(dti) as Average_DTI from bank_loan
--- Average DTI MTD
select avg(dti) as Average_DTI_MTD from bank_loan
where month(issue_date)=12
select avg(dti) as Average_DTI_PMTD from bank_loan
where month(issue_date)=11
--Good Loans KPI
---Good Loan Application Percentage
select (count(case when loan_status='Fully Paid' or loan_status='Current' then 1 end)*100)/count(distinct id) as Good_Loan_Application_Percentage
from bank_loan
---Good Loan Applications
select COUNT(distinct id) as Good_Loan_Applications from bank_loan
where loan_status='Fully Paid' or loan_status='Current'
---Good Loan Funded Amount
select sum(loan_amount) as Good_Loan_Funded_Amount
from bank_loan
where loan_status='Fully Paid' or loan_status='Current'
---Good Loan Received Amount
select sum(total_payment) as Good_Loan_Funded_Amount
from bank_loan
where loan_status='Fully Paid' or loan_status='Current'
-- Bad Loans KPI
--- Bad Loan Applications Percentage
select (count(case when loan_status='Charged Off' then 1 end)*100)/count(distinct id) as Bad_Loan_Application_Percentage
from bank_loan
--- Bad Loan Applications
select COUNT(distinct id) as Bad_Loan_Applications from bank_loan
where loan_status='Charged Off' 
--- Bad Loan Funded Amount
select sum(loan_amount) as Bad_Loan_Funded_Amount
from bank_loan
where loan_status='Charged Off'
--- Bad Loan Total Received Amount
select sum(total_payment) as Bad_Loan_Funded_Amount
from bank_loan
where loan_status='Charged Off'
-- Bank Loan Overview
--- Month
SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)
--- State
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY address_state
ORDER BY address_state
---Term
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY term
ORDER BY term
---Employment Length
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY emp_length
ORDER BY emp_length
--Purpose
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY purpose
ORDER BY purpose
--Home Ownership
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan
GROUP BY home_ownership
ORDER BY home_ownership

