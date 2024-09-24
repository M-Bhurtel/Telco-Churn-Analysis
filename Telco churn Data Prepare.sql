use Telco;

select * from Churn;

---- Checking For Missing Data


select count(1) Total_Amount
, count(Customer_ID) * 1.0 /count(1) as Customer_ID
, Count(Gender) * 1.0 / Count(1) as Gender
, Count(Senior_Citizen)  * 1.0 / Count(1) as Senior_Citizen
, Count(Partner) * 1.0 / Count(1) as Partner
, Count(Dependent) * 1.0 / Count(1) as Dependent
, Count(Tenure) * 1.0 /Count(1) as Tenure
, Count(Phone_Service) * 1.0 / Count(1) as Phone_service
, Count(Multiple_Lines) * 1.0 / Count(1) as Multiple_Lines
, Count(Internet_Service) * 1.0 /Count(1) as Internet_Service
, COunt(Online_Security) * 1.0 /Count(1) As Online_Security
, Count(Online_Backup) * 1.0 /Count(1) as Online_Backup
, Count(Device_Protection) * 1.0 /COunt(1) as Device_Protection
, Count(Tech_Support) * 1.0 /Count(1) as Tech_Support
, Count(Streaming_TV) * 1.0 /COunt(1) as Streaming_TV
, Count(Streaming_Movies) * 1.0 /Count(1) as Streaming_Movies
, Count(Contract) * 1.0 /Count(1) as Contract
, Count(Paperless_Billing) * 1.0 /Count(1) as Paperless_Billing
, Count(Payment_Method) * 1.0 /Count(1) as Payment_Method
, Count(Monthly_Charges) * 1.0 /Count(1) as Monthly_Charges
, Count(Total_Charges) * 1.0 /Count(1)as Total_Charges
, Count(Churn) * 1.0 /count(1) as Churn
from Churn;

--- We Have 4043 rows but 11 rows has  missing data on Total_Charges


---- Checking for duplicate rows

select *, Count(*)
From Churn
group by Customer_ID, Gender, Senior_Citizen, Partner, Dependent, Tenure,
Phone_Service, Multiple_Lines, Internet_Service, Online_Security, Online_Backup,
Device_Protection, Tech_Support, Streaming_TV, Streaming_Movies, Contract,
Paperless_Billing, Payment_Method, Monthly_Charges, Total_Charges, Churn
having Count(*) > 1;


--- No Duplicate Rows

-- Finding Outliers for numeric culumns

select Max(Senior_Citizen) as Max_senior
, Min(Senior_Citizen) as Min_senior
, Avg(Senior_Citizen) as Avg_senior
, Max(Tenure) as Max_Tenure
, Min(Tenure) as Min_Tenure
, Avg(Tenure) as Avg_Tenure
, Max(Monthly_Charges) As Max_Monthly
, Min(Monthly_Charges) As Min_Monthly
, Avg(Monthly_Charges) As Avg_Monthly
, Max(Total_Charges) As Max_Total
, Min(Total_Charges) As Min_Total
, Avg(Total_Charges) As Avg_Total

from Churn;

---- No Outliers

--- Data Prepare

--- Create Monthly_Charges Bins

Select 
        case 
            when Monthly_Charges > 10 and Monthly_Charges <= 20 then '11-20'
            when Monthly_charges > 20 and Monthly_charges <= 30 then '21-30'
            when Monthly_charges > 30 and Monthly_charges <= 40 then '31-40'
            when Monthly_charges > 40 and Monthly_charges <= 50 then '41-50'
            when Monthly_charges > 50 and Monthly_charges <= 60 then '51-60'
            when Monthly_charges > 60 and Monthly_charges <= 70 then '61-70'
            when Monthly_charges > 70 and Monthly_charges <= 80 then '71-80'
            when Monthly_charges > 80 and Monthly_charges <= 90 then '81-90'
            when Monthly_charges > 90 and Monthly_charges <= 100 then '91-100'
            when Monthly_charges > 100 and Monthly_charges <= 110 then '101-110'
               Else '110-120' end as Monthly_charges_Bin

From Churn;
                
Select 
    Case 
        when Total_Charges > 0 and Total_Charges <= 500 then '0-500'
        when Total_Charges > 500 and Total_Charges <= 1000 then '501-1000'
        when Total_Charges > 1000 and Total_Charges <= 2000 then '1001-2000'
        when Total_Charges > 2000 and Total_Charges <= 3000 then '2001-3000'
        when Total_Charges > 3000 and Total_Charges <= 4000 then '3001-4000'
        when Total_Charges > 4000 and Total_Charges <= 5000 then '4001-5000'
        when Total_Charges > 5000 and Total_Charges <= 6000 then '5001-6000'
        when Total_Charges > 6000 and Total_Charges <= 7000 then '6001-7000'
        when Total_Charges > 7000 and Total_Charges <= 8000 then '7001-8000'
        Else '8001+' 
    end as Total_Charges_bin
from Churn;


-- we donot have much to prepare data
-- Now need to delect 11 rows with missing total_Charges
UPDATE Churn
SET total_charges = tenure * monthly_charges
WHERE total_charges IS NULL;



---Final Table for Visualisation

Drop Table if Exists Final_Churn;

Select Customer_ID
, Gender
, Senior_Citizen
, Partner
, Dependent
, Tenure
, Phone_Service
, Multiple_Lines
, Internet_Service
, Online_Security
, Online_Backup
, Device_Protection
, Tech_Support
, Streaming_TV
, Streaming_Movies
, Contract
, Paperless_Billing
, Payment_Method
, Monthly_Charges
, case 
            when Monthly_Charges > 10 and Monthly_Charges <= 20 then '11-20'
            when Monthly_charges > 20 and Monthly_charges <= 30 then '21-30'
            when Monthly_charges > 30 and Monthly_charges <= 40 then '31-40'
            when Monthly_charges > 40 and Monthly_charges <= 50 then '41-50'
            when Monthly_charges > 50 and Monthly_charges <= 60 then '51-60'
            when Monthly_charges > 60 and Monthly_charges <= 70 then '61-70'
            when Monthly_charges > 70 and Monthly_charges <= 80 then '71-80'
            when Monthly_charges > 80 and Monthly_charges <= 90 then '81-90'
            when Monthly_charges > 90 and Monthly_charges <= 100 then '91-100'
            when Monthly_charges > 100 and Monthly_charges <= 110 then '101-110'
               Else '110-120' end as Monthly_charges_Bin
, Total_Charges
, Case 
        when Total_Charges > 0 and Total_Charges <= 500 then '0-500'
        when Total_Charges > 500 and Total_Charges <= 1000 then '501-1000'
        when Total_Charges > 1000 and Total_Charges <= 2000 then '1001-2000'
        when Total_Charges > 2000 and Total_Charges <= 3000 then '2001-3000'
        when Total_Charges > 3000 and Total_Charges <= 4000 then '3001-4000'
        when Total_Charges > 4000 and Total_Charges <= 5000 then '4001-5000'
        when Total_Charges > 5000 and Total_Charges <= 6000 then '5001-6000'
        when Total_Charges > 6000 and Total_Charges <= 7000 then '6001-7000'
        when Total_Charges > 7000 and Total_Charges <= 8000 then '7001-8000'
        Else '8001+' 
    end as Total_Charges_bin
, Churn

Into Final_Churn
from Churn;



Select * From Final_Churn;


drop table if exists bin_table;

CREATE TABLE bin_table (
    bin_range VARCHAR(10),
    sort_value INT
);

INSERT INTO bin_table (bin_range, sort_value) VALUES
('11-20', 1),
('21-30', 2),
('31-40', 3),
('41-50', 4),
('51-60', 5),
('61-70', 6),
('71-80', 7),
('81-90', 8),
('91-100', 9),
('101-110', 10),
('110-120', 11);

drop table if EXISTS Telco_Churn

Select * 
into Telco_Churn
from Final_Churn
join bin_table on bin_range = Monthly_charges_Bin;

Select * from Telco_Churn;


--- Adding new table to rank most used services by customers


drop table if EXISTS Service_Count;

SELECT 
    Service, 
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Telco_Churn) AS Service_count
    into Service_count
FROM (
    SELECT 'Phone Service' AS Service FROM Telco_Churn WHERE Phone_Service = 'Yes'
    UNION ALL
    SELECT 'Multiple Lines' FROM Telco_Churn WHERE Multiple_Lines = 'Yes'
    UNION ALL
    SELECT 'Internet Service' FROM Telco_Churn WHERE Internet_Service = 'DSL' OR Internet_Service = 'Fiber optic'
    UNION ALL
    SELECT 'Online Security' FROM Telco_Churn WHERE Online_Security = 'Yes'
    UNION ALL
    SELECT 'Online Backup' FROM Telco_Churn WHERE Online_Backup = 'Yes'
    UNION ALL
    SELECT 'Device Protection' FROM Telco_Churn WHERE Device_Protection = 'Yes'
    UNION ALL
    SELECT 'Tech Support' FROM Telco_Churn WHERE Tech_Support = 'Yes'
    UNION ALL
    SELECT 'Streaming TV' FROM Telco_Churn WHERE Streaming_TV = 'Yes'
    UNION ALL
    SELECT 'Streaming Movies' FROM Telco_Churn WHERE Streaming_Movies = 'Yes'
) AS Services
GROUP BY Service
ORDER BY Service_count DESC;



select *
from Service_count;
