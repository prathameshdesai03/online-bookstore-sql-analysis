# online-bookstore-sql-analysis
# Online Bookstore SQL Data Analysis Project

An end-to-end SQL data analysis project demonstrating core database management, complex joins, aggregations, and business intelligence queries for an online bookstore.

## 🚀 Project Overview
This repository contains production-ready SQL scripts designed to manage and analyze bookstore data[cite: 1]. It handles relational tables (`Books`, `Customers`, and `Orders`), performs exploratory data analysis (EDA), and answers critical business questions regarding inventory levels, revenue generation, customer purchasing habits, and top-performing products[cite: 1].

---

## 🛠️ Tech Stack & Database Compatibility
* **Database Management System (DBMS):** MySQL / PostgreSQL / SQLite / SQL Server
* **Language:** Structured Query Language (SQL)
* **Concepts Covered:** DDL/DML, Primary & Foreign Keys, Joins (INNER, LEFT), Aggregate Functions (`SUM`, `AVG`, `COUNT`), Grouping & Filtering (`GROUP BY`, `HAVING`), Sorting & Limiting (`ORDER BY`, `LIMIT`), and Conditional Functions (`COALESCE`)[cite: 1].

---

## 📂 Database Schema

1. **`Books` Table:** Stores book catalog details.
   * `Book_ID` (Primary Key)[cite: 1]
   * `Title`, `Author`, `Genre`, `Published_Year`, `Price`, `Stock`[cite: 1]

2. **`Customers` Table:** Stores buyer information.
   * `Customer_ID` (Primary Key)[cite: 1]
   * `Name`, `Email`, `Phone`, `City`, `Country`[cite: 1]

3. **`Orders` Table:** Stores transaction records.
   * `Order_ID` (Primary Key)[cite: 1]
   * `Customer_ID` (Foreign Key), `Book_ID` (Foreign Key), `Order_Date`, `Quantity`, `Total_Amount`[cite: 1]

---

## 📊 Key Business Insights & Analytical Queries Included
* **Sales & Revenue Tracking:** Total revenue calculation and genre-wise book sales performance[cite: 1].
* **Customer Behavior Analysis:** Identifying top spenders, frequent buyers, and geographic distributions of high-value customers[cite: 1].
* **Inventory Management:** Tracking remaining stock levels after order fulfillment and identifying low-stock titles[cite: 1].
* **Catalog Filtering:** Extracting books by publication year, price ranges, and specific genres (e.g., Fiction, Fantasy)[cite: 1].

---

## ⚙️ How to Run
1. Clone or download this repository.
2. Open your preferred SQL client (MySQL Workbench, pgAdmin, DBeaver, etc.).
3. Execute the `online_bookstore_analysis.sql` script to create the database, tables, insert sample data, and run all analytical queries[cite: 1].
