
# Telco Churn Analysis Project

## Project Overview

The Telco Churn Analysis project focuses on understanding customer churn in a telecommunications company through data visualization using Power BI. The main objective is to identify key factors that contribute to customer churn, providing actionable insights that can be used to develop effective retention strategies and improve customer satisfaction.

Customer churn poses a significant challenge for telecom companies as it directly affects both revenue and growth. By analyzing customer data, this project aims to reveal patterns and trends that can help reduce churn rates and enhance customer loyalty.

## Dataset

The dataset includes comprehensive information on telecom customers, covering demographics, service subscriptions, and payment details. The key columns analyzed are:

- **Demographic Information:**
  - **CustomerID:** Unique identifier for each customer.
  - **Gender:** Customer's gender (e.g., Male, Female).
  - **SeniorCitizen:** Indicates if the customer is a senior citizen.
  - **Partner:** Indicates if the customer has a partner.
  - **Dependents:** Indicates if the customer has dependents.

- **Service Information:**
  - **Tenure:** The number of months the customer has been with the company.
  - **Phone_Service:** Subscription to phone service.
  - **Multiple_Lines:** Subscription to multiple phone lines.
  - **Internet_Service:** Type of internet service (DSL, Fiber optic, or None).
  - **Online_Security:** Subscription to online security.
  - **Online_Backup:** Subscription to online backup.
  - **Device_Protection:** Subscription to device protection services.
  - **Tech_Support:** Subscription to tech support.
  - **Streaming_TV:** Subscription to streaming TV.
  - **Streaming_Movies:** Subscription to streaming movies.

- **Contract and Payment Information:**
  - **Contract:** The type of contract (Month-to-month, One year, Two years).
  - **Payment_Method:** Method of payment (Electronic check, Mailed check, Bank transfer, Credit card).
  - **Monthly_Charges:** Monthly charges incurred by the customer.
  - **Total_Charges:** Total charges incurred by the customer.
  - **Churn:** Indicates whether the customer churned or not (Yes/No).

## Key Steps

1. **Data Preparation:**
   - Utilized SQL for data cleaning and transformation, ensuring data quality by addressing missing values and inconsistencies.
   - Filtered out irrelevant fields and optimized the dataset for analysis.

2. **Exploratory Data Analysis (EDA):**
   - Conducted EDA using Power BI to identify key trends in customer churn.
   - Created visualizations to explore churn rates by demographics (e.g., Gender, Senior Citizen), contract type, tenure, and service subscriptions.
   - Segmented customers into high, medium, and low churn risk categories based on observed behavioral patterns.

3. **Data Visualization:**
   - Developed interactive Power BI dashboards to illustrate churn drivers.
   - Analyzed correlations between tenure, service usage (e.g., Phone, Internet, and Add-on services), and churn.
   - Highlighted the impact of contract type and payment method on churn, revealing that month-to-month contracts and electronic check payments are associated with higher churn rates.

## Objectives

- **Churn Prediction:** Identify key factors that cause customer churn, such as contract type, payment method, tenure, and service usage.
- **Actionable Insights:** Provide data-driven recommendations to reduce churn.
- **Skill Application:** Enhance proficiency in SQL for data wrangling and Power BI for visualization and insight generation.

## Conclusion

This analysis identified critical factors contributing to customer churn in the telecom industry, such as the influence of contract type, tenure, and payment method. The Power BI dashboards offer a comprehensive view of customer behavior and churn trends, enabling telecom companies to implement targeted strategies to retain customers. This project demonstrates how data analysis can significantly improve decision-making processes in customer retention efforts.
