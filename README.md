# Telecom Customer Retention & Revenue Optimization Analysis

## 🎯 Project Overview
This repository contains an end-to-end data analytics project focused on identifying customer churn drivers for a telecommunications provider. By combining data engineering in Python, structured deep-dives in SQL, and interactive visual analytics in Power BI, this project quantifies **$100.8K in active revenue at risk** and maps out a strategic blueprint to mitigate a **$139.1K monthly revenue leakage**.

## 📊 Interactive Dashboard
![Telecom Retention Dashboard](assets/dashboard_screenshot.png)

## 🛠️ Tech Stack & Skills Demonstrated
* **Data Extraction & Cleaning:** Python (Pandas) for handling missing data, standardizing feature schemas, and feature engineering.
* **Database Management:** MySQL for executing structured business logic and relational query segmentation.
* **Data Modeling & DAX:** Power BI Desktop for star-schema modeling, time-intelligence calculations, and active financial risk metrics.
* **UI/UX Design:** Built a high-contrast, insight-driven dashboard utilizing visual hierarchy, dynamic conditional formatting, and scrollable canvas layouts.

## 📈 Key Insights & Business Impact
1. **The Fiber Optic Crisis:** Subscribers on Month-to-Month Fiber Optic plans carry an aggressive **54.6% churn probability**, making them the highest threat to monthly recurring revenue.
2. **Contractual Lifecycles:** Churn risk drops by over **65%** once a customer surpasses their first 12 months, indicating a critical need for early-stage onboarding interventions.
3. **Payment Method Friction:** Manual "Electronic Check" accounts are **3x more likely to churn (47%)** than automated payment streams, representing a major operational bottleneck.

## 🚀 Strategic Recommendations
* **Contractual Migration:** Deploy targeted marketing incentives to transition high-value Month-to-Month Fiber users onto 1-Year agreements.
* **Frictionless Billing:** Implement a minor invoice credit (e.g., $5) to incentivize Electronic Check users to enroll in automated Auto-Pay.
* **Support Bundling:** Mandate proactive technical support check-ins during the first 90 days of new Fiber installations to maximize subscriber "stickiness."

## 📂 How to Navigate this Project
* [`/notebook`](): Contains the Jupyter Notebook mapping out the initial data profiling and cleaning pipeline.
* `/sql_queries`: Contains optimized SQL scripts isolating high-risk cohorts and tenure aggregations.
* `/powerbi`: Contains the native `.pbix` file. Download and open in Power BI Desktop to explore interactive filtering.
