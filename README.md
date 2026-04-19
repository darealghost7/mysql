

---

# RGI Trucking Database Project

### A personal database system for a fictional trucking company

---

## 📌 Project Overview

Hey there! This is my personal database project for a trucking company called **RGI Trucking**. I built this from scratch as part of my database systems assignment. The goal was to take a messy paper report and turn it into a fully functional, normalized database that actually makes sense.

I started with a simple driver-truck assignment report and ended up designing a complete system that tracks drivers, trucks, routes, employees (dispatchers, mechanics, clerks, first responders), maintenance logs, and shift assignments.

---

## 🚀 What I Built

This database does the following:

- Stores driver information and their licence types
- Tracks which driver is assigned to which truck on which route
- Manages different types of employees (dispatchers, first responders, mechanics, clerks)
- Logs maintenance queries and truck maintenance history
- Records which dispatcher dispatched which first responder to emergencies
- Tracks clerk-assigned dispatcher shifts

---

## 🛠️ Tools I Used

| Tool | Purpose |
|------|---------|
| MySQL | Database management system |
| draw.io | Drawing the ERD/EERD diagrams |
| MySQL Workbench | Running queries and testing |
| VS Code | Writing and organizing my SQL code |

---

## 📁 Database Structure

Here are all the tables I created and why they exist:

| Table | What It Stores |
|-------|----------------|
| `LICENCE` | Types of licences (Class A, B, C) |
| `DRIVER` | Driver names, IDs, and licence types |
| `TRUCK` | Truck IDs and descriptions |
| `ROUTE` | Route numbers |
| `Assignment` | Which driver drives which truck on which route |
| `EMPLOYEE` | Basic info for all employee types |
| `Dispatcher` | Shift times for dispatchers |
| `FirstResponder` | Emergency certification info |
| `Mechanic` | Mechanic specializations |
| `Clerk` | Admin roles for clerks |
| `Dispatch` | Emergency dispatch records |
| `Maintenance` | Truck maintenance history |
| `MaintenanceQuery` | Maintenance requests logged by clerks |
| `DispatcherShift` | Shift assignments created by clerks |

---

## 🔄 How I Normalized the Data (3NF)

I took the original messy report and normalized it step by step:

1. **1NF** – Made sure all values were atomic (no repeating groups)
2. **2NF** – Removed partial dependencies by splitting tables
3. **3NF** – Removed transitive dependencies (moved `Driver_Desc` to its own `LICENCE` table)

The original report had all data in one flat table. Now it's spread across properly related tables with no redundancy.

---

## 🧪 Sample Data I Inserted

I added 8 drivers, 8 trucks, 8 routes, and all the assignments between them. I also added myself as a driver with ID `RGI-DBS` (my name and surname).

Here's what the driver data looks like:

| Driver_ID | Name | Surname | Licence |
|-----------|------|---------|---------|
| RGI-D25 | John | Snow | Class B |
| RGI-F45 | Aegon | Targaryen | Class A |
| RGI-G56 | Rob | Stark | Class A |
| RGI-F70 | Jamie | Lannister | Class A |
| RGI-Z56 | Petyr | Baelish | Class C |
| RGI-Q34 | Jaqen | H'ghar | Class A |
| RGI-P90 | Theon | Greyjoy | Class C |
| RGI-T89 | Hodor | Hodor | Class B |
| RGI-DBS | [My Name] | [My Surname] | Class A |

---

## 📊 Sample Query I Run Most Often

This query rebuilds the original report view from my normalized tables:

```sql
SELECT 
    d.DRIVER_ID,
    d.Driver_Name,
    d.Driver_Surname,
    l.Licence_Type,
    l.Driver_Desc,
    a.TRUCK_ID,
    t.TRUCK_Desc,
    a.ROUTE_ID AS Route
FROM DRIVER d
JOIN LICENCE l ON d.Licence_ID = l.Licence_ID
JOIN Assignment a ON d.DRIVER_ID = a.DRIVER_ID
JOIN TRUCK t ON a.TRUCK_ID = t.TRUCK_ID
ORDER BY d.DRIVER_ID;
```

It joins four tables together and gives me exactly what the original paper report showed – but now the data is clean, normalized, and efficient.

---

## 🎯 What I Learned

Working on this project taught me:

- How to take messy, real-world data and normalize it to 3NF
- Why foreign keys and primary keys matter for data integrity
- How to design an ERD/EERD before writing any SQL
- That paper-based systems are painfully slow compared to databases
- How to think about relationships (one-to-many, many-to-many) in real business scenarios

---

## ⚠️ Challenges I Ran Into

| Challenge | How I Solved It |
|-----------|------------------|
| Forgetting table creation order | Learned that parent tables must come before child tables |
| Mismatched column names | Went back and made sure all foreign keys matched referenced columns |
| Missing `ROUTE` table | Realized routes belonged in their own table, not inside `Assignment` |
| Connection lines not showing in ERD | Switched to draw.io and used the connector tool properly |

---

## 🗂️ Files in This Project

```
RGI_Trucking/
├── create_tables.sql       # All CREATE TABLE statements
├── insert_data.sql         # All INSERT statements for sample data
├── queries.sql             # Useful SELECT queries including the report view
├── erd_diagram.drawio      # My ERD/EERD diagram file
└── README.md               # This file you're reading right now
```

---

## 📈 Why This Matters (To Me)

This isn't just an assignment. I genuinely see how a small business like RGI Trucking would fall apart without a proper database. The difference between a paper system (60+ minutes to answer a simple question) and this database (under 1 second) is massive. I'd want my own business to use a database, so I needed to learn how to build one.

---

## 🔗 References I Used

I relied on these resources while building this project:

- Connolly, T. and Begg, C., 2022. *Database Systems*. 7th ed. Pearson.  
  https://www.pearson.com/

- Coronel, C. and Morris, S., 2023. *Database Systems*. 14th ed. Cengage.  
  https://www.cengage.com/

- Elmasri, R. and Navathe, S.B., 2022. *Fundamentals of Database Systems*. 8th ed. Pearson.  
  https://www.pearson.com/

- MySQL Documentation, 2026. *MySQL 8.0 Reference Manual*.  
  https://dev.mysql.com/doc/refman/8.0/en/

- DB-Engines Ranking, 2026. *Popularity of Database Management Systems*.  
  https://db-engines.com/en/ranking

---

## ✅ Status

**Project Status:** Complete

All tables are created, all data is inserted, all relationships work, and the report query returns exactly what I expected. The database is in 3NF and ready for hypothetical use by RGI Trucking.

---

## 🙋‍♂️ Author

This was a personal project completed for my database systems course. I built it from the ground up, made my mistakes, fixed them, and learned a ton along the way.

---

*Last updated: April 2026*

---


<img width="940" height="1254" alt="image" src="https://github.com/user-attachments/assets/c6d66d7e-b9fe-4c49-b840-2bc96baeb83e" />


