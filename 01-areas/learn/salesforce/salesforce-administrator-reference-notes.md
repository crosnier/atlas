



## **Salesforce “Clouds” (Product Suites)**

> Think of these as major **business domains** or **platform bundles**

### **🔧 Core Business Clouds**
- **Sales Cloud** – CRM + pipeline mgmt
- **Service Cloud** – Case mgmt + support tools
- **Experience Cloud** – Portals, communities, extranets
- **Marketing Cloud** – Campaigns, journeys, email, SMS
- **Commerce Cloud** – B2C & B2B eCommerce
- **Analytics Cloud (Tableau CRM)** – Dashboards, reporting, ML
- **Financial Services Cloud** – For banks, wealth, insurance
- **Health Cloud** – Healthcare provider/patient mgmt
- **Education Cloud** – Higher ed + K-12 solutions
- **Manufacturing Cloud** – Forecasting, partner mgmt
- **Nonprofit Cloud** – Donor mgmt, program tracking
- **CPQ & Billing** – Configure-price-quote tools
- **Field Service** – Technician scheduling, dispatch, mobile
- **Revenue Cloud** – Monetization (CPQ + Billing + Subscriptions)
- **Slack + Salesforce** – Workflow & alerts inside Slack
    

---

## **Salesforce “Apps” (Functional Modules/Features)**

> These are **components** or **tools** you use within Clouds or Orgs.

### **🧠 Standard Apps**
- **Sales** – Leads, Opportunities, Accounts, Contacts
- **Service** – Cases, Knowledge, Service Console
- **Marketing** – Campaigns, Leads, Journey Builder
- **Field Service** – Work Orders, Appointments
- **Reports & Dashboards**
- **Tasks & Events** (Activity Timeline)
- **Forecasts**
- **App Launcher** – Cross-app navigation

### **🧰 Admin/Platform Apps**
- **Setup**
- **AppExchange**
- **Flow Builder**
- **Approval Process**
- **Object Manager**
- **Schema Builder**
    
---

🔍 **Custom Apps**: You can build your own apps with tabs, objects, and pages for any use case (via Lightning App Builder).

---

_“Salesforce Clouds are the skies you work in. Apps are the tools in your cockpit.”_


---

## Permissions


### Salesforce Permissions Controls
```
User
├── Profile         (Defines baseline access: objects, fields, tabs, etc.)
│   ├── Page Layout Assignment
│   ├── Record Types
│   └── Object Permissions (CRUD)
│
├── Role            (Defines record visibility via role hierarchy)
│   └── Influences record access through org-wide defaults & sharing rules
│
├── Permission Set  (Grants additional permissions beyond Profile)
│   └── Can include: Object permissions, App access, Apex classes, etc.
│
├── Permission Set Group (Bundle multiple permission sets logically)
│
├── Public Groups / Queues / Territories (Used for sharing/access control)
│
└── Sharing Rules   (Automates record sharing beyond roles/org defaults)
```







