# 📚 Online Bookstore SQL Data Analysis Project

## 📌 Project Overview
This project demonstrates relational database design, data manipulation, and exploratory data analysis (EDA) using SQL for an **Online Bookstore**. It includes the complete database schema (`Books`, `Customers`, and `Orders`), sample datasets, and 19 practical business queries ranging from basic filtering to complex joins, aggregations, and inventory tracking.

---

## 🗄️ Database Schema

The database (`onlinebookstore`) consists of three interconnected tables:

### 1. `Books`
Stores inventory details about the books available in the store.
* `Book_ID` (INT, Primary Key, Auto-Increment): Unique identifier for each book.
* `Title` (VARCHAR): Title of the book.
* `Author` (VARCHAR): Author of the book.
* `Genre` (VARCHAR): Literary genre (e.g., Fiction, Fantasy, Sci-Fi).
* `Published_Year` (INT): Year the book was published.
* `Price` (DECIMAL): Retail price of the book.
* `Stock` (INT): Available inventory count.

### 2. `Customers`
Stores customer profile and location information.
* `Customer_ID` (INT, Primary Key, Auto-Increment): Unique identifier for each customer.
* `Name` (VARCHAR): Full name of the customer.
* `Email` (VARCHAR): Unique email address.
* `Phone` (VARCHAR): Contact phone number.
* `City` (VARCHAR): City of residence.
* `Country` (VARCHAR): Country of residence.

### 3. `Orders`
Tracks customer transactions and links `Customers` to `Books`.
* `Order_ID` (INT, Primary Key, Auto-Increment): Unique identifier for each order.
* `Customer_ID` (INT, Foreign Key): References `Customers(Customer_ID)`.
* `Book_ID` (INT, Foreign Key): References `Books(Book_ID)`.
* `Order_Date` (DATE): Date the order was placed.
* `Quantity` (INT): Number of copies purchased.
* `Total_Amount` (DECIMAL): Total cost of the order.

---

## 🔍 Key Analytical Queries Included

The `online_bookstore.sql` script answers key business and operational questions, including:
* **Inventory Management:** Checking total stock, identifying low-stock items, and calculating remaining stock after order fulfillment using `LEFT JOIN` and `COALESCE`.
* **Sales & Revenue Analysis:** Calculating total revenue, tracking sales volume by genre and author, and filtering high-value orders.
* **Customer Insights:** Identifying repeat buyers (`HAVING COUNT >= 2`), finding top-spending customers, and mapping customer demographics by city and country.
* **Catalog Exploration:** Filtering books by publication year, genre, and price rankings.

---

## 🚀 How to Run This Project

1. **Prerequisites:** Ensure you have a relational database management system (RDBMS) installed, such as **MySQL**, **MariaDB**, or **PostgreSQL** (minor syntax adjustments may be needed for PostgreSQL `AUTO_INCREMENT`).
2. **Clone or Download:** Download the `online_bookstore.sql` file from this repository.
3. **Execute the Script:**
   * Open your SQL client (e.g., MySQL Workbench, DBeaver, pgAdmin, or CLI).
   * Open `online_bookstore.sql`.
   * Run the entire script to automatically create the `onlinebookstore` database, build the tables, populate sample records, and execute all analytical queries.

---

## 🛠️ Technologies Used
* **SQL (Structured Query Language)**
* **MySQL** (Compatible with standard ANSI SQL environments)