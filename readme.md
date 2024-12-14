# Simple Bank System Database Project

## 📚 Project Overview
This project is a database for a **simple bank system** designed to learn and demonstrate the fundamentals of database design and implementation. Our team collaborated to build this project from the ground up, starting with conceptual design and normalization to the execution of SQL queries and testing with random data.

The project includes:
- Designing an **ERD (Entity-Relationship Diagram)** to model the system.
- **Mapping the ERD** into a relational schema.
- Applying **normalization** to eliminate redundancy and ensure data integrity.
- Writing **SQL queries** to perform operations on the database.
- Adding **sample data** for testing and validation.

## 🚀 Features
The database includes the following functionality:
- Customer information management.
- Account creation and operations (savings, checking, etc.).
- Transactions, including deposits and withdrawals.
- Relationship mapping between customers, accounts, and transactions.

## 🛠️ Tech Stack
- **Database System:** MySQL (or other SQL-based systems)
- **Tools Used:** 
  - Database Design: [Tool Name] (e.g., MySQL Workbench, dbdiagram.io)
  - SQL Editor: [Tool Name] (e.g., pgAdmin, MySQL CLI)

## 📝 Project Details
### 1. ERD Design
The **Entity-Relationship Diagram (ERD)** captures the essential entities, relationships, and attributes in the banking system. Major entities include:
- `Customer`: Stores customer details like name, contact information, etc.
- `Account`: Represents different types of accounts customers can have.
- `Transaction`: Tracks deposits, withdrawals, and transfers.

### 2. Mapping and Normalization
The ERD was mapped into relational tables, ensuring proper normalization to eliminate redundancies and maintain integrity.

### 3. SQL Queries
SQL queries were written to handle:
- Creating, reading, updating, and deleting records.
- Performing banking operations like deposits and withdrawals.
- Generating reports, such as transaction histories and account balances.

### 4. Testing with Sample Data
Random sample data was added to test the functionality of the database and validate the SQL queries.

## 📂 Project Structure
- `erd/`: Contains the ERD design files in image or diagram format.
- `sql-scripts/`: Contains the SQL scripts for:
  - Table creation
  - Inserting sample data
  - Queries for operations and reports
- `tests/`: Contains test cases for validating queries and database functionality.

## 📊 ERD Example
![ERD Diagram Example](path/to/your-erd-image.png)

## 📜 How to Use
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/bank-system-db.git
