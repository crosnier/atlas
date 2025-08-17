# Dashboard Templates From Obsidian

Dashboard and Summary Filter templates from Obsidian or its plugins. Consider integrating into the grass-roots process.



```dataviewjs
let jobs = dv.pages('"01-jobs"');
let apps = dv.pages('"02-applications"');
let total = jobs.length + apps.length;

dv.header(3, "📊 Job Summary");
dv.paragraph(`🧾 Total Jobs: **${total}**`);
dv.paragraph(`📄 Jobs: **${jobs.length}**`);
dv.paragraph(`✅ Applications: **${apps.length}**`);
```





## 🤝 Outreach & Networking Tracker

tags: []

### 💼 All Contacts
```dataview
TABLE contact_name as "Contact", platform, status, file.mtime AS "Last Updated"
FROM "Outreach & Networking"
WHERE status
SORT file.mtime DESC
```

---

### 🕓 Waiting for Response
```dataview
TABLE contact_name, platform, file.mtime AS "Last Contacted"
FROM "Outreach & Networking"
WHERE status = "waiting"
SORT file.mtime DESC
```

---

### ✅ Replied or Scheduled
```dataview
TABLE contact_name, platform, status, file.mtime AS "Last Activity"
FROM "Outreach & Networking"
WHERE status = "replied" OR status = "scheduled"
SORT file.mtime DESC
```

---
---
---

## ✅ Application Tracker

tags: []

### 🧾 All Applications
```dataview
TABLE title, company, status, applied_on, follow_up
FROM "02-applications"
SORT applied_on DESC
```
---

### 🟡 Draft (Queued)
```dataview
TABLE title, company, status, applied_on, follow_up
FROM "01-jobs"
WHERE contains(status, "") OR contains(status, "draft")
SORT file.mtime DESC
```

---

### 🟢 Active (Applied / Interviewing)
```dataview
TABLE title, company, status, applied_on, follow_up
FROM "02-applications"
WHERE contains(status, "applied") OR contains(status, "interviewing")
SORT applied_on DESC
```

---

### ✅ Offers
```dataview
TABLE title, company, status, applied_on, follow_up
FROM "02-applications"
WHERE contains(status, "offer")
SORT file.mtime DESC
```

---

### ⏰ Upcoming Follow-Ups
```dataview
TABLE company, position, follow_up
FROM "Applications"
WHERE follow_up >= date(today)
SORT follow_up ASC
```

---

### ❌ Rejected
```dataview
TABLE company, position, applied_on
FROM "Applications"
WHERE status = "rejected"
SORT file.mtime DESC
```

---
---
---

# INDEX


---

## 📌 Jobs by Status

### 🟡 Draft (ToDos)
```dataview
TABLE title, company, status, salary_range, compatibility_score
FROM "01-jobs"
WHERE contains(status, " ") OR contains(status, "draft")
SORT file.mtime DESC
```

### 🔵 Applied (Waiting)
```dataview
TABLE title, company, status, applied_on, follow_up
FROM "02-applications"
WHERE contains(status, "applied")
SORT applied_on DESC
```

### 🟢 Interviewing
```dataview
TABLE title, company, status, applied_on, follow_up
FROM "02-applications"
WHERE contains(status, "interviewing")
SORT applied_on DESC
```

### 🚩 Offers or Pending
```dataview
TABLE title, company, status, applied_on, follow_up
FROM "02-applications"
WHERE contains(status, "offers")
SORT file.mtime DESC
```

---

## ⏰ Upcoming Follow-Ups
```dataview
TABLE title, company, follow_up
FROM "02-applications"
WHERE follow_up >= date(today)
SORT follow_up ASC
```

---

### 🪓 Rejected or Dismissed
```dataview
TABLE title, company, status, salary_range, compatibility_score
FROM "01-jobs"
WHERE contains(status, " ") OR contains(status, "draft")
SORT file.mtime DESC
```



---

## 📁 Templates
*Click a template below to create a new file using it.*

- [template-role-note](-templates/template-role-note.md)
- [template-application-note](-templates/template-application-note.md)
- [template-outreach-note](_templates/template-outreach-note.md)

---

## 🤝 Outreach & Networking Tracker
![](./_attachments/_index-2025-03-31-2103-750f0b.png)

### 📇 Active Contacts
```dataview
TABLE contact_name as "Name", platform, status, file.mtime as "Last Contacted"
FROM "outreach-and-networking"
WHERE status != "done"
SORT file.mtime DESC
```

### 📅 Follow-Up Queue
```dataview
TABLE contact_name as "name", status, follow_up as "follow-up"
FROM "outreach-and-networking"
WHERE status != "closed" AND follow_up != ""
SORT follow_up ASC
```

---

## 🗂️ Applications Overview
![|700x165](./_attachments/_index-2025-03-31-2203-ff4aea.png)

### 📌 Active Applications
```dataview
TABLE company, position, status, applied_on, follow_up
FROM "Applications"
WHERE status = "applied" OR status = "interviewing"
SORT applied_on DESC
```

### 🛑 Rejected Roles
```dataview
TABLE company, position, applied_on
FROM "Applications"
WHERE status = "rejected"
SORT applied_on DESC
```

### 🎯 Offers Received
```dataview
TABLE company, position, salary_range
FROM "Applications"
WHERE status = "offer"
```


## ✅ Application Overview

### 🧾 All Applications (YAML View)
```dataview
TABLE company, position, status, applied_on, follow_up, remote_status
FROM "Applications"
WHERE status
SORT applied_on DESC
```

### ⏳ Awaiting Follow-Up
```dataview
TABLE company, position, follow_up
FROM "Applications"
WHERE status = "applied" AND follow_up >= date(today)
SORT follow_up ASC
```

### 🟢 Interview Stages
```dataview
TABLE company, position, applied_on, status
FROM "Applications"
WHERE status = "interviewing"
SORT applied_on DESC
```


## 🤝 Outreach & Networking Tracker

### 📇 Contacted But Waiting
```dataview
TABLE contact_name, platform, status, date_initiated
FROM "Outreach & Networking"
WHERE status = "waiting"
SORT date_initiated DESC
```

### 📬 Replied / In Progress
```dataview
TABLE contact_name, platform, status, date_initiated
FROM "Outreach & Networking"
WHERE status = "replied" OR status = "scheduled"
SORT date_initiated DESC
```


---

## ✅ Applications Dashboard (YAML Smart View)

### 📅 Recently Applied
```dataview
TABLE company, position, applied_on, follow_up, status
FROM "Applications"
WHERE applied_on
SORT applied_on DESC
```

### ⏳ In Progress
```dataview
TABLE company, position, status, applied_on, follow_up
FROM "Applications"
WHERE status = "applied" or status = "interviewing"
SORT file.mtime DESC
```

### ✅ Offers Received
```dataview
TABLE company, position, salary_range, remote_status
FROM "Applications"
WHERE status = "offer"
```



---

## 🤝 Outreach Tracker

### 🟡 Awaiting Reply
```dataview
TABLE contact_name, platform, status, date_initiated
FROM "Outreach & Networking"
WHERE status = "waiting"
SORT date_initiated DESC
```

### 🟢 Replied / Scheduled
```dataview
TABLE contact_name, platform, status, date_initiated
FROM "Outreach & Networking"
WHERE status = "replied" or status = "scheduled"
SORT date_initiated DESC
```

