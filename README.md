RGI Trucking Database Project – Summary
I built a personal database system for a fictional trucking company called RGI Trucking as part of my database assignment. I started with a messy paper report and turned it into a fully normalized 3NF database using MySQL.

What I Created
The database has 14 tables that track:

Drivers and their licences

Trucks and routes

Assignments (which driver drives which truck on which route)

Employees (dispatchers, first responders, mechanics, clerks)

Maintenance logs and maintenance queries

Emergency dispatches

Dispatcher shifts assigned by clerks

How I Did It
Normalized the original flat report to 3NF (removed duplicate data)

Designed an ERD/EERD using draw.io

Wrote SQL code to create all tables, insert sample data, and run queries

Added myself as a driver with ID RGI-DBS

Key Result
A query that used to take over 60 minutes on paper now runs in less than 1 second by joining four tables together.

What I Learned
Table creation order matters (parents before children)

Foreign keys keep data accurate

Paper systems are slow and error-prone

Databases are essential for any growing business

Status
✅ Complete – All tables created, data inserted, relationships working, and in 3NF.

<img width="940" height="1254" alt="image" src="https://github.com/user-attachments/assets/c6d66d7e-b9fe-4c49-b840-2bc96baeb83e" />


