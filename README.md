# Real Estate Listings and Analytics

**Internship Data Analytics Project**  
**Tools Used**: PostgreSQL, DBeaver, Power BI

---

## Project Overview

This project analyzes real estate property listings and transaction data to generate meaningful business insights such as average pricing by city, agent performance, and market demand. It bridges the gap between raw data and decision-making using SQL and Power BI.

---

## Objectives

- Store property, agent, buyer, and transaction details
- Track listings and sales activity over time
- Analyze pricing and demand trends
- Visualize the data in an intuitive dashboard

---

## Tools & Technologies

| Tool           | Purpose                                      |
|----------------|----------------------------------------------|
| PostgreSQL     | Backend database                             |
| DBeaver        | SQL IDE for writing and executing queries    |
| Power BI       | Data visualization and dashboard creation    |
| SQL            | Data modeling, joins, aggregation, insights  |

---

## Database Schema

- `Properties`: All property listings (location, price, listing date)
- `Agents`: Real estate agents managing listings
- `Buyers`: Buyer details
- `Transactions`: Records linking buyers, agents, and properties

Relationships were enforced using foreign keys to ensure integrity.

---

## Analytics and Insights

| Insight                      | Method                                |
|-----------------------------|----------------------------------------|
| Average Price by City       | `GROUP BY` with `AVG()`                |
| Monthly Price Trend         | `TO_CHAR(listed_date, 'YYYY-MM')`     |
| Top 5 Expensive Listings    | `ORDER BY price DESC LIMIT 5`         |
| Unsold Properties           | `LEFT JOIN` where no transaction      |
| Agent Sales Leaderboard     | `GROUP BY agent`, `SUM(sale_price)`   |
| High-Demand Areas           | `GROUP BY location`, count sales      |

These insights were exported to CSV and visualized using Power BI.

---

## Dashboard Highlights

| Visualization     | Description                         |
|-------------------|-------------------------------------|
| Bar Chart         | Average Property Price by City      |
| Column Chart      | Monthly Price Trend                 |
| Table             | Top 5 Most Expensive Listings       |
| Line Chart        | Unsold Properties                   |
| Area Chart        | High-Demand Locations by Sales      |

---

## Outcome & Learning

- Modeled real-world data using SQL
- Extracted business insights with queries and aggregations
- Designed an interactive Power BI dashboard
- Strengthened storytelling through data visualization

---

## Conclusion

This project demonstrated how structured data and SQL logic can power real estate insights when paired with effective dashboards. It reinforces the value of transforming data into actionable intelligence for industries like real estate.


