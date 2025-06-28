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
