# TraceIt Database Schema

## institutions

| Field | Type |
|---------|---------|
| id | UUID |
| name | VARCHAR |
| logo_url | TEXT |
| domain | VARCHAR |
| status | VARCHAR |
| created_at | TIMESTAMP |

---

## users

| Field | Type |
|---------|---------|
| id | UUID |
| institution_id | UUID |
| name | VARCHAR |
| email | VARCHAR |
| role | VARCHAR |
| created_at | TIMESTAMP |

Roles:
- student
- security
- admin

---

## lost_reports

| Field | Type |
|---------|---------|
| id | UUID |
| institution_id | UUID |
| user_id | UUID |
| title | VARCHAR |
| description | TEXT |
| image_url | TEXT |
| location | VARCHAR |
| status | VARCHAR |
| created_at | TIMESTAMP |

---

## found_items

| Field | Type |
|---------|---------|
| id | UUID |
| institution_id | UUID |
| uploaded_by | UUID |
| title | VARCHAR |
| description | TEXT |
| image_url | TEXT |
| location_found | VARCHAR |
| status | VARCHAR |
| created_at | TIMESTAMP |

---

## matches

| Field | Type |
|---------|---------|
| id | UUID |
| lost_report_id | UUID |
| found_item_id | UUID |
| similarity_score | FLOAT |
| status | VARCHAR |

---

## otp_pickups

| Field | Type |
|---------|---------|
| id | UUID |
| match_id | UUID |
| otp_code | VARCHAR |
| expires_at | TIMESTAMP |
| verified | BOOLEAN |