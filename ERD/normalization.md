# **Normalization – AirBnB Database**

## **Objective**
Apply normalization principles to ensure that the AirBnB database design is in **Third Normal Form (3NF)**, eliminating redundancy and ensuring data consistency.

---

## **1. Understanding Normalization**

**Normalization** is the process of structuring a relational database to reduce redundancy and improve data integrity.

**Goals of normalization:**
- Prevent data duplication
- Ensure data dependencies make sense
- Optimize for scalability and maintenance

---

## **2. Overview of Normal Forms**

| Normal Form | Description |
|--------------|-------------|
| **1NF** | Each table has atomic values (no repeating groups or arrays). |
| **2NF** | The table is in 1NF and all non-key attributes are fully dependent on the primary key. |
| **3NF** | The table is in 2NF and all attributes depend only on the primary key (no transitive dependencies). |

---

## **3. Step-by-Step Normalization**

### **Step 1: First Normal Form (1NF)**

**Rule:**  
- Each column must contain atomic (indivisible) values.
- Each table must have a primary key.

**Action:**  
All attributes in the AirBnB schema are atomic.  
For example:
- `User.email` holds a single value, not multiple emails.
- `Property.location` stores a single location string.
- Each table has a unique primary key (`user_id`, `property_id`, etc.).

 **Result:** The database satisfies **1NF**.

---

### **Step 2: Second Normal Form (2NF)**

**Rule:**  
- The table must first satisfy 1NF.
- All non-key attributes must depend on the entire primary key.

**Action:**  
- Each table uses a **single primary key**, not a composite key.
- Every attribute depends on the primary key directly:
  - In **User**, `email`, `role`, `password_hash` all depend on `user_id`.
  - In **Property**, all details depend on `property_id`.
  - In **Booking**, all fields depend on `booking_id`.

 **Result:** The database satisfies **2NF**.

---

### **Step 3: Third Normal Form (3NF)**

**Rule:**  
- The table must first satisfy 2NF.
- There must be **no transitive dependencies** (no attribute depends on another non-key attribute).

**Analysis:**
- **User:** Attributes depend only on `user_id`.
- **Property:** `host_id` is a foreign key referencing `User.user_id`; all other fields describe the property.
- **Booking:** `total_price` is functionally dependent on `booking_id`. Although it could be derived, keeping it stored doesn’t break 3NF.
- **Payment:** Each field depends only on `payment_id`.
- **Review:** Depends on `review_id` only.
- **Message:** Depends only on `message_id`.

 **Result:** No transitive dependencies exist. The schema satisfies **3NF**.

---

## **4. Validation Summary**

| Table | |  | |Notes |
|--------|------|------|------|-------|
| **User** || Atomic, unique email |
| **Property** |  | Linked to User via host_id |
| **Booking** |  | Linked to Property and User |
| **Payment** | | Linked to Booking |
| **Review** | | Linked to Property and User |
| **Message** | |Sender and recipient linked to User |

---

## **5. Final Normalized Schema (3NF)**

### **User**
`user_id (PK)`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`

### **Property**
`property_id (PK)`, `host_id (FK)`, `name`, `description`, `location`, `price_per_night`, `created_at`, `updated_at`

### **Booking**
`booking_id (PK)`, `property_id (FK)`, `user_id (FK)`, `start_date`, `end_date`, `total_price`, `status`, `created_at`

### **Payment**
`payment_id (PK)`, `booking_id (FK)`, `amount`, `payment_date`, `payment_method`

### **Review**
`review_id (PK)`, `property_id (FK)`, `user_id (FK)`, `rating`, `comment`, `created_at`

### **Message**
`message_id (PK)`, `sender_id (FK)`, `recipient_id (FK)`, `message_body`, `sent_at`

---

## **6. Conclusion**

The AirBnB database design achieves **Third Normal Form (3NF)**:
- All tables contain atomic data (1NF)
- Each non-key attribute depends entirely on its primary key (2NF)
- No transitive dependencies exist (3NF)

This ensures:
- **Data integrity**
- **Minimal redundancy**
- **Improved performance and scalability**

 **Final Result:** Database schema is **fully normalized to 3NF**.
