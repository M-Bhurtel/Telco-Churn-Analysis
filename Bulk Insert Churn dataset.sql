Drop database if exists Telco;

Create Database Telco;

use Telco;

Drop Table if Exists Churn;

Create Table Churn(
    Customer_ID varchar(15)
    , Gender varchar(10)
    , Senior_Citizen INT
    , Partner varchar(5)
    , Dependent varchar(5)
    , Tenure INT
    , Phone_Service VARCHAR(5)
    , Multiple_Lines varchar(20)
    , Internet_Service varchar(15)
    , Online_Security varchar(20)
    , Online_Backup varchar(20)
    , Device_Protection varchar(20)
    , Tech_Support varchar(20)
    , Steaming_TV varchar(20)
    , Streaming_Movies varchar(20)
    , Contract varchar(20)
    , Paperless_Billing varchar(5)
    , Payment_Method varchar(30)
    , Monthly_Charges Decimal(18,2)
    , Total_Charges Decimal(18,2)
    , Churn varchar(5)
);


select * from Churn;


Bulk insert Churn
from 'C:\Users\Ashis\OneDrive\Desktop\DataBootcamp\Bootcamp Project\Telco\Telco_churn.csv'
with (
    format ='CSV',
    FirstRow = 2,
    FieldTerminator = ','
);