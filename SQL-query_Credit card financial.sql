create database ccdb;

-- 1: Create temporary table for cc_detail data with VARCHAR date field
CREATE TEMPORARY TABLE cc_detail_temp (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date VARCHAR(10),
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

-- 2. Create cust_detail table

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);


-- 3. Copy csv data into SQL 
-- copy cc_detail table
-- : Load the CSV file into the temporary table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/credit_card.csv'
INTO TABLE cc_detail_temp
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Step 3: Insert data into cc_detail table with date conversion
INSERT INTO cc_detail (Client_Num, Card_Category, Annual_Fees, Activation_30_Days, Customer_Acq_Cost,
                       Week_Start_Date, Week_Num, Qtr, current_year, Credit_Limit, Total_Revolving_Bal,
                       Total_Trans_Amt, Total_Trans_Ct, Avg_Utilization_Ratio, Use_Chip, Exp_Type,
                       Interest_Earned, Delinquent_Acc)
SELECT Client_Num, Card_Category, Annual_Fees, Activation_30_Days, Customer_Acq_Cost,
       STR_TO_DATE(Week_Start_Date, '%d-%m-%Y'), Week_Num, Qtr, current_year, Credit_Limit,
       Total_Revolving_Bal, Total_Trans_Amt, Total_Trans_Ct, Avg_Utilization_Ratio, Use_Chip, Exp_Type,
       Interest_Earned, Delinquent_Acc
FROM cc_detail_temp;

-- Step 4: Drop the temporary table
DROP TEMPORARY TABLE cc_detail_temp;

SELECT * FROM cc_detail;

-- copy cust_detail table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer.csv'
INTO TABLE cust_detail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM cust_detail;


------------------------------------------------------------------------------------------------------------------------------------------------------

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cust_add.csv"
INTO TABLE cust_detail
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(Client_Num, Customer_Age, Gender, Dependent_Count, Education_Level, Marital_Status, State_cd, Zipcode, Car_Owner, House_Owner, Personal_Loan, Contact, Customer_Job, Income, Cust_Satisfaction_Score);

SELECT * FROM cust_detail;



-- Create temporary table for cc_detail data with VARCHAR date field
CREATE TEMPORARY TABLE cc_detail_temp2 (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date VARCHAR(10),
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

-- Load the CSV file into the temporary table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cc_add.csv'
INTO TABLE cc_detail_temp2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Insert data into cc_detail table with date conversion
INSERT INTO cc_detail (Client_Num, Card_Category, Annual_Fees, Activation_30_Days, Customer_Acq_Cost,
                       Week_Start_Date, Week_Num, Qtr, current_year, Credit_Limit, Total_Revolving_Bal,
                       Total_Trans_Amt, Total_Trans_Ct, Avg_Utilization_Ratio, Use_Chip, Exp_Type,
                       Interest_Earned, Delinquent_Acc)
SELECT Client_Num, Card_Category, Annual_Fees, Activation_30_Days, Customer_Acq_Cost,
       STR_TO_DATE(Week_Start_Date, '%d-%m-%Y'), Week_Num, Qtr, current_year, Credit_Limit,
       Total_Revolving_Bal, Total_Trans_Amt, Total_Trans_Ct, Avg_Utilization_Ratio, Use_Chip, Exp_Type,
       Interest_Earned, Delinquent_Acc
FROM cc_detail_temp2;

-- Drop the temporary table
DROP TEMPORARY TABLE cc_detail_temp2;

-- Verify the data
SELECT * FROM cc_detail;








