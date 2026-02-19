# Customer Success Data Operations Framework

Operational customer data framework built to support Customer Success lifecycle monitoring, segmentation governance, and revenue risk prioritization.

---

## 🎯 Business Context

Customer Success teams rely on accurate and structured customer data to:
- Identify churn risk early
- Prioritize outreach based on revenue exposure
- Segment accounts for lifecycle campaigns
- Maintain reliable reporting for leadership

This project mirrors a CS Data Operations environment where data quality, validation, and reporting stability directly impact operational execution.

---

## 💼 Core Deliverables

### 1️⃣ Data Quality & Governance
- **Identified and corrected flawed customer segmentation logic**
- **Implemented validation rules** (NULL handling, outlier checks, distribution validation)
- **Applied consistent status definitions** and tier standards
- **Structured SQL views** as controlled reporting layers

**Result:** Reliable, refresh-ready dataset suitable for downstream CRM or BI consumption.

---

### 2️⃣ Customer Lifecycle Monitoring
Defined rule-based lifecycle states using recency logic:
- **Active** (≤ 3 months)
- **At Risk** (4–8 months)
- **Inactive** (9+ months)

Built health metrics across **18,482 customers**, enabling operational visibility into engagement and revenue exposure.

**Active rate observed: 36.3%**, indicating significant retention opportunity.

---

### 3️⃣ Revenue Risk Identification
- Flagged **7,523 at-risk accounts**
- Identified **$12.3M in revenue exposure**
- Prioritized **352 high-value VIP accounts** for immediate intervention

Developed ranked intervention logic combining customer value and recency score to simulate CS outreach queue management.

---

### 4️⃣ Segmentation Recalibration (Production-Level Debugging)

**Issue Identified:** Original segmentation logic relied on static tenure thresholds, misclassifying 95% of customers into a single tier.

**Root Cause:** Business rules were inconsistent with actual data distribution (average tenure significantly lower than assumed).

**Solution:** Rebuilt segmentation using percentile-based revenue thresholds and realistic tenure cutoffs.

**Validation Performed:**
- Distribution balance checks
- Average revenue per segment comparison
- Monthly revenue consistency analysis

**Final distribution:**
- VIP: 10.2%
- Regular: 22.3%
- New: 67.5%

Segmentation now supports differentiated Customer Success playbooks.

---

## 📊 Dashboard Preview

### Page 1: Executive Health Overview
*Real-time view of customer base health and segmentation distribution*

![Executive Overview](./screenshots/page1_overview.png)

**Key Metrics Tracked:**
- Total Customers: 18,482
- Active Rate: 36.3% (6,704 customers)
- VIP Tier: 1,883 customers (10.2%)
- Total Revenue: $29.4M

**Operational Insights:**
- Customer segmentation by tier (VIP/Regular/New)
- Health status distribution (Active/At Risk/Inactive)
- Revenue concentration analysis (VIP accounts drive 48% of revenue)

---

### Page 2: Segmentation Deep Dive
*Analyst-level exploration for campaign planning and cohort analysis*

![Deep Dive Analysis](./screenshots/page2_deep_dive.png)

**Features:**
- Top 20 customers by revenue with conditional formatting
- Recency distribution showing engagement patterns
- Order frequency analysis (67% are single-purchase customers)
- Cross-segment health status breakdown

**Use Case:** Enables CS team to design differentiated playbooks based on segment behavior patterns.

---

### Page 3: At-Risk Intervention Queue
*Daily operational view for CS rep prioritization*

![Risk Analysis](./screenshots/page3_risk_analysis.png)

**Risk Metrics:**
- At-Risk Customers: 7,523 (41% of base)
- Revenue Exposure: $12.3M
- High-Priority VIPs: 352 accounts requiring immediate outreach
- Already Churned: $6.6M (win-back candidates)

**Operational Workflow:** Prioritized table sorts by customer value + recency, enabling CS reps to focus on highest-impact accounts first (VIPs at top).

---

## 🛠 Technical Implementation

### SQL (Operational-Level)
- CTE-based modular transformations
- Window functions (ROW_NUMBER, NTILE, RANK, running totals)
- Percentile calculations for segmentation
- Validation queries for distribution control
- Production-ready VIEW creation for BI integration

**Example lifecycle logic:**
```sql
CASE 
    WHEN DATEDIFF(month, last_order_date, MAX(last_order_date) OVER()) <= 3 
    THEN 'Active'
    WHEN DATEDIFF(month, last_order_date, MAX(last_order_date) OVER()) BETWEEN 4 AND 8 
    THEN 'At Risk'
    ELSE 'Inactive'
END
```

### Power BI (Operational Dashboarding)
Developed a **3-page dashboard** designed for:
- Executive health overview
- Analyst deep-dive segmentation
- Daily at-risk intervention queue

**Features:**
- Conditional formatting for risk prioritization
- Segment-based filtering
- Revenue concentration analysis
- Dynamic KPI calculations (DAX)

---

## 🔄 Operational Readiness

To reflect a Customer Success Data Operations environment:
- Applied naming conventions for reporting clarity
- Structured reusable SQL layers
- Validated metrics before dashboard publication
- Documented logic changes to ensure maintainability

Project demonstrates ability to support recurring data refreshes and maintain reporting accuracy over time.

---

## 📂 Repository Structure
```
├── sql-queries/
│   ├── report_customers.sql
│   ├── report_products.sql
│   └── segmentation_recalibration.sql
├── dashboard/
│   └── CustomerSuccessDashboard.pbix
├── screenshots/
└── README.md
```

---

## 🚀 Competencies Demonstrated

- Data cleansing & normalization
- Segmentation governance
- Revenue risk modeling
- Reporting validation & QA
- Operational dashboard design
- SQL for production-ready data layers

---

## 🎯 Role Alignment

This project reflects the responsibilities of a **Customer Success Data Operations Analyst**:
- Ensuring data accuracy and completeness
- Supporting lifecycle campaigns with validated segmentation
- Identifying and prioritizing revenue risk
- Maintaining reliable reporting layers for operational teams
Supporting lifecycle campaigns with validated segmentation

Identifying and prioritizing revenue risk

Maintaining reliable reporting layers for operational teams
