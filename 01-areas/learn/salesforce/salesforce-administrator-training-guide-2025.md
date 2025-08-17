# Salesforce Administrator Training Guide 2025

## resources

1. [Trailhead Academy ( Certifications Page )](https://trailheadacademy.salesforce.com/m) | Get Certs Here
	1. Exam : [Salesforce Certified Platform Administrator](https://trailheadacademy.salesforce.com/certificate/exam-platform-admin---Plat-Admn-201)
2. [Salesforce Certified Platform Administrator Exam Guide](https://trailhead.salesforce.com/help?article=Salesforce-Certified-Platform-Administrator-Exam-Guide)
3. [Hands-On Orgs | Trailhead Playgrounds](http://trailhead.salesforce.com/users/profiles/orgs)
	1. 

*in recommended order*
3. [Trailhead - Trailmix - Prepare for Salesforce Platform Admin Certification](https://trailhead.salesforce.com/users/strailhead/trailmixes/prepare-for-your-salesforce-administrator-credential)
4. [Trailhead - Credentials - Salesforce Certified Platform Administrator](https://trailhead.salesforce.com/en/credentials/administrator) 
5. [Youtube | How i passed the SF Admin Exam](https://youtu.be/vs9pOzt6dV0?si=43YFcjA5BSm5dpXz)
6. [Trail - Study for the Administrator Certification Exam](https://trailhead.salesforce.com/content/learn/trails/administrator-certification-prep)
7. [Test - Platform Administrator Practice Test](https://developer.salesforce.com/files/ti/thi/THI-000393/administratorpracticetest.html)
8. . 

*optional*
9. Superbadge: [Lightning Experience Reports & Dashboards Specialist](https://trailhead.salesforce.com/en/superbadges/superbadge-lex-rd)
10. Superbadge: [Business Administration Specialist](https://trailhead.salesforce.com/superbadges/superbadge_business_specialist)
11. Superbadge: [Object Relationships Superbadge Unit](https://trailhead.salesforce.com/content/learn/superbadges/superbadge-object-relationships-sbu)
12. Superbadge: [Data Validation Superbadge Unit](https://trailhead.salesforce.com/content/learn/superbadges/superbadge_data_validation_sbu)
13. Superbadge: [Flow Administration Superbadge Unit](https://trailhead.salesforce.com/content/learn/superbadges/superbadge_flow_administration_sbu)



Target Certifications

- Salesforce Certified Platform Administrator
- Salesforce Certified Platform Administrator II

---

## Salesforce Administrator 2025 - Fast-Track Study Guide
*~10–15 Hours | Hands-On Labs Included*

This fast-track study guide is designed to help experienced professionals quickly refresh and validate their Salesforce Administrator knowledge for the 2025 certification exam. It combines structured hands-on labs, day-by-day training, and focused review strategies to efficiently cover all core exam topics.


🔥 TLDR: Use Trailhead Playground unless you need advanced setup or integrations.

🧩 Playground vs Developer Sandbox Comparison

| **Feature**                 | **Trailhead Playground**                                     | **Developer Edition Org**                                   |
| ----------------------- | -------------------------------------------------------- | ------------------------------------------------------- |
| Purpose                 | Designed for Trailhead modules & hands-on practice       | Full-featured sandbox for real-world dev & testing      |
| Ease of Use             | 1-click setup via Trailhead, auto-connected              | Manual signup + config required                         |
| Access to Modules       | Pre-linked to Trailhead for “Verify Step” checks         | You have to manually connect or test steps              |
| Reset / Create Multiple | Yes, quick-create new ones anytime                       | Yes, but must manage manually                           |
| Integration Capable     | Limited (no external apps, APIs, or Apex email sendouts) | Full capabilities, including API, email, integrations   |
| Storage / Limits        | Smaller object/record limits                             | Full dev org limits                                     |
| Admin Practice          | ✅ Great for config, flows, UI, security, reports, etc.   | ✅ Better for Apex, APIs, integrations, external systems |

---

### 🔧 Setup Your Salesforce Playground

#### 1. Create a Free Trailhead Account
- Sign up at [https://trailhead.salesforce.com](https://trailhead.salesforce.com)
- Choose **"Playground"** as your default environment for hands-on work

#### 2. Launch Trailhead Playground
- Go to any module > Click **Launch** → Trailhead Playground
- It’s a full-featured Salesforce org just for you. Use it for exercises, testing, and playing.

#### 3. Optional: Create a Developer Sandbox
- Visit [https://developer.salesforce.com/signup](https://developer.salesforce.com/signup)
- Great for more advanced use cases or deeper config testing.

#### 4. Bookmark Key References
- [Salesforce Admin Exam Guide](https://trailhead.salesforce.com/help?article=Salesforce-Certified-Administrator-Exam-Guide)
- [Trailhead Admin Cert Trailmix](https://trailhead.salesforce.com/users/strailhead/trailmixes/prepare-for-your-salesforce-administrator-credential)

---

### ⏱️ Week-Long Learning Sprint Outline (10–15 Hours)

| **Day** | **Topics** | **Est. Time** | **Modules** | **Exercises** |
|--------|------------|---------------|-------------|---------------|
| **Day 1** | **Salesforce Basics** | 1.5 hrs | - Salesforce Platform Basics<br>- Data Modeling | 🔸Explore Object Manager<br>🔸Create a Custom Object |
| **Day 2** | **User Setup & Org Configuration** | 2 hrs | - Company Settings<br>- User Management<br>- Profiles & Permission Sets | 🔸Create a new user<br>🔸Assign a profile & permission set |
| **Day 3** | **Security & Access** | 1.5 hrs | - Org Access<br>- Record Access<br>- Sharing Rules | 🔸Set Org-Wide Defaults<br>🔸Create a Role Hierarchy |
| **Day 4** | **Standard & Custom Objects** | 1.5 hrs | - Custom Fields<br>- Page Layouts<br>- Record Types | 🔸Create Record Types<br>🔸Customize Page Layouts |
| **Day 5** | **Automation Basics** | 2 hrs | - Flow Basics<br>- Approval Processes<br>- Validation Rules | 🔸Build a Record-Triggered Flow<br>🔸Add a Validation Rule |
| **Day 6** | **Reports & Dashboards** | 1.5 hrs | - Report Builder<br>- Dashboard Components | 🔸Create a Tabular and Summary Report<br>🔸Build a Dashboard |
| **Day 7** | **Data Management & AppExchange** | 1.5 hrs | - Data Import Wizard<br>- Data Loader<br>- AppExchange Basics | 🔸Import Leads via Wizard<br>🔸Install a Free AppExchange Tool |

---

### 📘 Day-by-Day Training Breakdown

#### 📘 Day 1 – Salesforce Platform & Data Modeling (1.5 hrs)
##### 🔍 Concepts:
- Salesforce Cloud Overview
- Multi-Tenant Architecture
- Objects, Fields, and Relationships
- Standard vs. Custom Objects

##### 🧠 Trailhead Modules:
- Salesforce Platform Basics
- Data Modeling
- Understand Custom & Standard Objects

##### 🛠️ Exercises:
- Create a custom object (`Training_Session__c`)
- Add fields: `Date`, `Trainer`, `Location`
- Set a lookup to the `User` object
- Use Schema Builder to visualize relationships

---

#### 📘 Day 2 – Org Setup, User Management & Permissions (2 hrs)
##### 🔍 Concepts:
- Company Info & Fiscal Settings
- Users, Roles, and Licenses
- Profiles vs. Permission Sets

##### 🧠 Trailhead Modules:
- Company Settings
- User Management
- Profiles & Permission Sets

##### 🛠️ Exercises:
- Create a user: `testuser@example.com`
- Assign the `Standard User` profile
- Clone a profile → Add “View Setup” permission
- Create a permission set to allow `Modify All` on `Training_Session__c`

---

#### 📘 Day 3 – Security & Access Controls (1.5 hrs)
##### 🔍 Concepts:
- Org-Wide Defaults (OWD)
- Role Hierarchy
- Sharing Rules
- Manual Sharing

##### 🧠 Trailhead Modules:
- Data Security
- Org Access
- Record Access

##### 🛠️ Exercises:
- Set `Training_Session__c` to Private
- Create a Role Hierarchy: VP > Manager > Sales Rep
- Add a rule to share `Training_Session__c` records with Manager role

---

#### 📘 Day 4 – Object Customization & Page Layouts (1.5 hrs)
##### 🔍 Concepts:
- Custom Fields & Field Types
- Page Layouts
- Record Types
- Business Processes

##### 🧠 Trailhead Modules:
- Customize a Salesforce Object
- Record Types & Page Layouts
- Picklist & Business Process Customization

##### 🛠️ Exercises:
- Add Picklist Field: `Session_Type__c`
- Create two Record Types: "In-Person" and "Virtual"
- Customize page layouts per Record Type

---

#### 📘 Day 5 – Automation Basics (2 hrs)
##### 🔍 Concepts:
- Validation Rules
- Approval Processes
- Process Builder (Deprecated)
- Flows (Focus Area)

##### 🧠 Trailhead Modules:
- Flow Builder
- Validation Rules
- Workflow/Process Automation

##### 🛠️ Exercises:
- Create a Validation Rule: prevent blank `Location` if `Session_Type = In-Person`
- Build a Record-Triggered Flow: Auto-update `Status = Confirmed` when `Trainer__c` is filled
- Simulate an Approval Process for `Training_Session__c`

---

#### 📘 Day 6 – Reports & Dashboards (1.5 hrs)
##### 🔍 Concepts:
- Report Types
- Filters, Groupings, Summaries
- Dashboards & Components

##### 🧠 Trailhead Modules:
- Reports & Dashboards for Lightning Experience
- Custom Report Types

##### 🛠️ Exercises:
- Create a Tabular report for `Training_Session__c`
- Convert it to Summary grouped by `Trainer`
- Add chart: Sessions by Location
- Create Dashboard: “Training Overview”

---

#### 📘 Day 7 – Data Management & AppExchange (1.5 hrs)
##### 🔍 Concepts:
- Import Wizard vs. Data Loader
- Data Export/Backup
- AppExchange Basics

##### 🧠 Trailhead Modules:
- Data Management
- AppExchange Basics

##### 🛠️ Exercises:
- Use Data Import Wizard to load sample `Training_Session__c` data
- Export data as backup
- Install AppExchange App: “Adoption Dashboards”
- Review installed components and permissions

---

### 📚 Optional Deep Dive (Extra 3–5 hours)

| Topic | Modules | Activities |
|-------|---------|------------|
| **Mobile & Lightning App Customization** | - Lightning App Builder<br>- Mobile Customization | 🔸Design a Custom Lightning App |
| **Advanced Flows & Automation** | - Flow Elements Deep Dive<br>- Record Triggering Scenarios | 🔸Create a multi-object Flow |
| **Change Management** | - Change Sets<br>- Sandbox Deployments | 🔸Simulate a change deployment |

---

### 📝 Practice Questions + Review Strategy

#### 🧪 Where to Practice
- Trailhead's **Review Units** after each module
- Use **Focus on Force** for realistic mock exams
- Use **Quizlet** for community-made flashcards (search: "Salesforce Admin 2025")

#### 🧠 Study Tips
- 30-min daily review = retention
- Focus on **concepts + scenarios**, not memorization
- Practice in your Playground after each module

---

### 🎯 Certification Target

| **Exam Section**               | **Weight** |
| ------------------------------ | ---------- |
| Configuration & Setup          | 20%        |
| Object Manager & Lightning App | 20%        |
| Workflow/Process Automation    | 16%        |
| Data & Analytics Mgmt          | 14%        |
| Security & Access              | 13%        |
| Service & Support              | 12%        |
| Productivity & Collaboration   | 5%         |

---

### 🏁 Final Sprint

- Re-review your **weakest modules**
- Run 2–3 timed **mock exams**
- Book via [https://www.webassessor.com](https://www.webassessor.com)

---

### 💬 Pro Tips

- The exam is **scenario-based**. Know *when* to use what.
- **Flows > Workflow Rules** now. Focus there.
- Don’t skip **Report Types** or **Record Access Scenarios**

---

✌️ _“Flows before bros, always debug your nodes.”_



## **🧭** **Salesforce Admin Cert: Fast-Track Strategy (10–12 hrs)**

**🎯 Goal: Refresh core fundamentals + learn what’s changed since 2021–2022**

### **✅ 1.** **Focus on What’s New or Different (2–3 hrs)**
- **Flow is king now**: Process Builder and Workflow Rules are deprecated
- **Dynamic Forms** on standard objects
- **Lightning App Builder** upgrades (App Pages, Utility Bar, App Branding)
- **Permission Set Groups** and **Muting**
- **Guest user sharing model** updates
- **Record-triggered flows** replacing everything else
- **Inline editing in reports**
- **Einstein Search / Search Manager**

  

📌 Trailheads:

- [Automate Business Processes with Flow](https://trailhead.salesforce.com/content/learn/trails/automate-business-processes-with-flow)
    
- [What’s New in Salesforce](https://trailhead.salesforce.com/en/content/learn/modules/spring-24-release-highlights)
    

---

### **✅ 2.** 

### **Refresher on Admin Core (6–7 hrs)**

  

Focus only on these _exam-heavy, core admin areas_:

|**Topic**|**Must Know**|**Notes**|
|---|---|---|
|Profiles, Roles, Sharing|✅|Role Hierarchy, OWD, Sharing Rules|
|Flow Builder|✅✅|Screen, Record-triggered, Scheduled|
|Reports & Dashboards|✅|Buckets, Filters, Custom Report Types|
|Object Relationships|✅|Master-Detail, Lookup, Schema Builder|
|Permission Sets + Groups|✅|Granular control + app access|
|User Setup|✅|Login history, Login hours/IPs|
|App Builder + UX|✅|Tabs, Pages, Utility Bar, Branding|

📌 Suggested Trailheads:

- [Data Modeling](https://trailhead.salesforce.com/en/content/learn/modules/data_modeling)
    
- [Reports & Dashboards for Lightning Experience](https://trailhead.salesforce.com/en/content/learn/modules/reports_dashboards_lightning)
    
- [User Access and Permissions](https://trailhead.salesforce.com/en/content/learn/modules/user_access)
    

---

### **✅ 3.** 

### **Quick Practice Tests + Flashcards (2 hrs)**

- **Focus on scenario-style questions**
    
- Use Focus on Force or Quizlet to run flashcards rapidly
    
- Flag weak areas and re-watch specific Trailhead videos if needed
    

---

### **🧠 Pro Tips**

- Skip deep dives on Communities, Field Service, or Dev-level config
    
- Treat _Flow + Security + Reports_ as your highest ROI topics
    
- Use Trailhead’s built-in pre-test quizzes to identify weak zones fast
    

---

Want a **10-hour checklist** or rework of the markdown to fit this compressed format?



## Related Notes

[[salesforce-administrator-reference-notes]]




