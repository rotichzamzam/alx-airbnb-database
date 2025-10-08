# **AirBnB Database Schema – SQL Definition**

## **Project Overview**
This directory contains the SQL scripts that define the AirBnB database schema for the `alx-airbnb-database` project.

The schema defines all entities, relationships, and constraints based on the AirBnB specification, following **Third Normal Form (3NF)**.

---

## ** Files**

| File | Description |
|------|--------------|
| `schema.sql` | Contains all `CREATE TABLE` statements, primary and foreign keys, and indexes. |
| `README.md` | Provides documentation and setup instructions for the database. |

---

## ** Database Overview**

### **Entities**
- **Users**
- **Properties**
- **Bookings**
- **Payments**
- **Reviews**
- **Messages**

### **Relationships**
- One **User** (host) → Many **Properties**
- One **User** (guest) → Many **Bookings**
- One **Property** → Many **Bookings**
- One **Booking** → One **Payment**
- One **User** & **Property** → Many **Reviews**
- One **User** → Many **Messages** (sent or received)

---

