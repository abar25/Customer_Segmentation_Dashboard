# 🧠 Insurance Customer Segmentation Dashboard

This project demonstrates how SQL and Power BI were used to segment insurance customers based on key behavioral attributes. The dashboard helps uncover insights that can inform marketing, retention, and product strategy.
# 📊 Key Highlights

- Segmented customers using SQL logic (RFM / custom rules)
- Created KPIs, segment-level filters, and charts in Power BI
- Delivered business insights through a clean interactive dashboard

## 🧰 Tools Used

- MySQL
- Power BI
- Excel (optional: for initial data review)

  ## 📁 Folder Overview

- `data/` – Sample input dataset (anonymized)
- `sql/` – SQL queries used for segmentation and aggregation
- `dashboard/` – Power BI `.pbix` file
- `visuals/` – Screenshots of final dashboard and charts

  ## 💡 Segmentation Logic

Segmentation was performed using the following criteria:

- **Young_Savers** - Whose age within 30 and premium amount within 2000
- **Affluent_Protectors** - Whose age from 30 to 50 with coverage amount of more than 500000
- **Senior_Stable** - Whose age greater than 60 and holds multiple policies for health insurance
- **Risk_Averse_mid** - Whose age betweeen 40 to 60 with coverage amount of greater than 300000 and premium amount less than 10000
- **Multi_Policy_Loyal** - Whose holding multiple policies with customer service interactions
- **General** - remaining all category will fall under general

> *Custom logic implemented using SQL CASE statements, SQL VIEW*

## 📷 Dashboard Preview

customer_segmentation_dashboard.PNG



## 🚀 How to Explore

1. Clone/download the repo
2. Open the `.pbix` file in Power BI Desktop
3. Use filters to explore customer behaviors by segment, region, and policy type

## 📝 Author

Abarna Suresh Kumar
🔗https://www.linkedin.com/in/abarna-suresh-kumar-10b261227
📬 abar25aug@gmail.com
