![ER Diagram](https://drive.google.com/uc?id=1GwK4gCAELum_tOW3OmQWBiRA7jP2CXAO)

# ✅ Normalization to 3NF – Airbnb Database Design

## 🎯 Objective
To apply normalization principles (1NF, 2NF, 3NF) to ensure the database design is free of redundancy, update anomalies, and dependency violations.

---

## 📘 First Normal Form (1NF)

### Rule:
- Each table has a **primary key**.
- Each field contains **atomic values**.
- No **repeating groups** or arrays.

### ✔️ Applied:
- All attributes contain atomic values.
- No multivalued or repeating groups.
- Each table has a clear primary key (`user_id`, `property_id`, etc.).

✅ **Database is in 1NF.**

---

## 📗 Second Normal Form (2NF)

### Rule:
- Must be in 1NF.
- All **non-key attributes are fully functionally dependent** on the entire primary key (especially relevant for composite keys).

### ✔️ Applied:
- All tables use **single-column primary keys (UUID)**.
- No partial dependencies exist (no composite keys with partial attribute dependencies).

✅ **Database is in 2NF.**

---

## 📙 Third Normal Form (3NF)

### Rule:
- Must be in 2NF.
- **No transitive dependencies** (i.e., non-key attribute depending on another non-key attribute).

### 🔍 Evaluation:

| Table     | Check                                           | Result |
|-----------|--------------------------------------------------|--------|
| **User**     | All attributes directly depend on `user_id`           | ✅     |
| **Property** | `host_id` is a FK, all others depend on `property_id` | ✅     |
| **Booking**  | All attributes depend on `booking_id`, including FKs  | ✅     |
| **Payment**  | Fully dependent on `payment_id`, `booking_id` as FK   | ✅     |
| **Review**   | No transitive dependency (rating, comment depend only on PK) | ✅     |
| **Message**  | Sender/Recipient IDs are foreign keys, no violations  | ✅     |

### ❌ No transitive dependencies found.

✅ **Database is in 3NF.**

---

## 🔧 Summary of Adjustments (if any)

No structural changes were needed. The original schema:
- Uses UUIDs as primary keys.
- Separates concerns across tables.
- Avoids storing derived or redundant data.
- Maintains foreign key integrity.

Thus, it adheres to best practices and satisfies 3NF.

---

## ✅ Final Verdict

> **The Airbnb-style database schema is fully normalized up to the Third Normal Form (3NF)**.  
> No redesign necessary.
