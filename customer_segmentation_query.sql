


CREATE TABLE customer_segmentation (
    customer_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    marital_status VARCHAR(20),
    education_level VARCHAR(50),
    geographic_information VARCHAR(100),
    occupation VARCHAR(50),
    income_level VARCHAR(50),
    behavioral_data VARCHAR(100),
    purchase_history DATE,
    customer_service_interactions TEXT,
    insurance_products_owned VARCHAR(100),
    coverage_amount DECIMAL(12, 2),
    premium_amount DECIMAL(12, 2),
    policy_type VARCHAR(50),
    customer_preferences TEXT,
    preferred_channel VARCHAR(50),
    preferred_time VARCHAR(50),
    preferred_language VARCHAR(50),
    segmentation_group VARCHAR(50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer_segmentation_data.csv'
INTO TABLE customer_segmentation
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, age, gender, marital_status, education_level,
 geographic_information, occupation, income_level, behavioral_data,
 purchase_history, customer_service_interactions, insurance_products_owned,
 coverage_amount, premium_amount, policy_type,
 customer_preferences, preferred_channel, preferred_time, preferred_language,
 segmentation_group);
 
 SELECT * FROM customer_segmentation;
 
 ALTER TABLE customer_segmentation
ADD age_group VARCHAR(20),
ADD income_tier VARCHAR(20),
ADD coverage_tier VARCHAR(20);

UPDATE customer_segmentation
SET
  age_group = CASE
      WHEN age < 30 THEN 'Young'
      WHEN age BETWEEN 30 AND 50 THEN 'Middle-Aged'
      ELSE 'Senior' END,
  income_tier = CASE
      WHEN income_level LIKE '%Low%' THEN 'Low'
      WHEN income_level LIKE '%High%' THEN 'High'
      ELSE 'Mid' END,
  coverage_tier = CASE
      WHEN coverage_amount < 200000 THEN 'Low'
      WHEN coverage_amount BETWEEN 200000 AND 500000 THEN 'Medium'
      ELSE 'High' END;
      
      SET SQL_SAFE_UPDATES = 0;
      
      CREATE VIEW customer_segments AS
SELECT *,
    CASE
        WHEN age < 30 AND income_tier = 'Low' AND premium_amount < 2000 THEN 'Young_Savers'
        WHEN age BETWEEN 30 AND 50 AND income_tier = 'High' AND coverage_amount > 500000 THEN 'Affluent_Protectors'
        WHEN age >= 60 AND policy_type = 'Health' AND LENGTH(insurance_products_owned) - LENGTH(REPLACE(insurance_products_owned, ',', '')) >= 1 THEN 'Senior_Stable'
        WHEN age BETWEEN 40 AND 60 AND coverage_amount > 300000 AND premium_amount < 10000 THEN 'Risk_Averse_Mid'
        WHEN insurance_products_owned LIKE '%,%' AND customer_service_interactions IS NOT NULL THEN 'Multi_Policy_Loyal'
        ELSE 'General'
    END AS customer_segment
FROM customer_segmentation;