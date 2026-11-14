-- ============================================================================
-- ONLINE BOOKSTORE DATABASE PROJECT
-- ============================================================================

-- 1. Create and Select Database
CREATE DATABASE IF NOT EXISTS onlinebookstore;
USE onlinebookstore;

-- 2. Drop existing tables if they exist (for clean setup)
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Books;

-- ============================================================================
-- TABLE DEFINITIONS (SCHEMA)
-- ============================================================================

-- Create Books Table
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(150) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    Genre VARCHAR(50) NOT NULL,
    Published_Year INT,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);

-- Create Customers Table
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    City VARCHAR(50),
    Country VARCHAR(50)
);

-- Create Orders Table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE NOT NULL,
    Quantity INT NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

-- ============================================================================
-- SAMPLE DATA INSERTION
-- ============================================================================

INSERT INTO Books (Title, Author, Genre, Published_Year, Price, Stock) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925, 14.99, 25),
('1984', 'George Orwell', 'Fiction', 1949, 12.50, 40),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, 19.99, 15),
('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy', 1997, 24.99, 50),
('The Name of the Wind', 'Patrick Rothfuss', 'Fantasy', 2007, 29.99, 10),
('A Game of Thrones', 'George R.R. Martin', 'Fantasy', 1996, 34.99, 8),
('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'Non-Fiction', 2011, 22.00, 30),
('Dune', 'Frank Herbert', 'Sci-Fi', 1965, 18.50, 5),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 1951, 11.99, 20),
('Atomic Habits', 'James Clear', 'Self-Help', 2018, 16.99, 45);

INSERT INTO Customers (Name, Email, Phone, City, Country) VALUES
('Alice Johnson', 'alice@example.com', '555-0101', 'Toronto', 'Canada'),
('Bob Smith', 'bob@example.com', '555-0102', 'New York', 'USA'),
('Charlie Brown', 'charlie@example.com', '555-0103', 'Vancouver', 'Canada'),
('Diana Prince', 'diana@example.com', '555-0104', 'London', 'UK'),
('Evan Wright', 'evan@example.com', '555-0105', 'Montreal', 'Canada');

INSERT INTO Orders (Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) VALUES
(1, 1, '2023-11-05', 2, 29.98),
(1, 4, '2023-11-12', 1, 24.99),
(2, 6, '2023-11-15', 1, 34.99),
(3, 5, '2023-11-20', 2, 59.98),
(4, 2, '2023-10-10', 3, 37.50),
(2, 8, '2023-11-28', 1, 18.50),
(5, 3, '2023-12-01', 1, 19.99),
(1, 10, '2023-12-05', 2, 33.98);

-- ============================================================================
-- DATA ANALYSIS & BUSINESS QUERIES
-- ============================================================================

-- 1. Retrieve all books in the "Fiction" genre
SELECT * FROM Books 
WHERE Genre = 'Fiction';

-- 2. Find books published after the year 1950
SELECT * FROM Books 
WHERE Published_Year > 1950;

-- 3. List all customers from Canada
SELECT * FROM Customers 
WHERE Country = 'Canada';

-- 4. Show orders placed in November 2023
SELECT * FROM Orders 
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5. Retrieve the total stock of books available
SELECT SUM(Stock) AS Total_Stock
FROM Books;

-- 6. Find the details of the most expensive book
SELECT * FROM Books 
ORDER BY Price DESC 
LIMIT 1;

-- 7. Show all orders where more than 1 quantity of a book was ordered
SELECT * FROM Orders 
WHERE Quantity > 1;

-- 8. Retrieve all orders where the total amount exceeds $20
SELECT * FROM Orders 
WHERE Total_Amount > 20;

-- 9. List all genres available in the Books table
SELECT DISTINCT Genre FROM Books;

-- 10. Find the book with the lowest stock
SELECT * FROM Books 
ORDER BY Stock ASC 
LIMIT 1;

-- 11. Calculate the total revenue generated from all orders
SELECT SUM(Total_Amount) AS Total_Revenue 
FROM Orders;

-- 12. Retrieve the total number of books sold for each genre
SELECT b.Genre, SUM(o.Quantity) AS Total_Books_Sold
FROM Books b
JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Genre
ORDER BY Total_Books_Sold DESC;

-- 13. Find the average price of books in the "Fantasy" genre
SELECT Genre, ROUND(AVG(Price), 2) AS Average_Price
FROM Books
WHERE Genre = 'Fantasy'
GROUP BY Genre;

-- 14. List customers who have placed at least 2 orders
SELECT c.Customer_ID, c.Name, COUNT(o.Order_ID) AS Order_Count
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Name
HAVING COUNT(o.Order_ID) >= 2
ORDER BY Order_Count DESC;

-- 15. Show the top 3 most expensive books of the 'Fantasy' genre
SELECT Title AS Book_Name, Price
FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;

-- 16. Retrieve the total quantity of books sold by each author
SELECT b.Author, SUM(o.Quantity) AS Total_Books_Sold
FROM Books b 
JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Author
ORDER BY Total_Books_Sold DESC;

-- 17. List the cities where customers who spent over $30 on an order are located
SELECT DISTINCT c.City, o.Total_Amount 
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
WHERE o.Total_Amount > 30
ORDER BY o.Total_Amount DESC;

-- 18. Find the customer who spent the most on orders overall
SELECT c.Customer_ID, c.Name, SUM(o.Total_Amount) AS Total_Spent
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY Total_Spent DESC 
LIMIT 1;

-- 19. Calculate the stock remaining after fulfilling all orders
SELECT 
    b.Book_ID, 
    b.Title, 
    b.Stock AS Initial_Stock, 
    COALESCE(SUM(o.Quantity), 0) AS Ordered_Quantity,  
    (b.Stock - COALESCE(SUM(o.Quantity), 0)) AS Remaining_Stock
FROM Books b
LEFT JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID, b.Title, b.Stock
ORDER BY b.Book_ID;