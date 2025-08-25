# Obsidian Plugin: Dataview – Filter & Group Options

## Overview

This reference sheet provides the available filter and grouping options for the [Dataview](https://blacksmithgu.github.io/obsidian-dataview/) plugin in Obsidian. These commands are useful when querying structured data from your notes using frontmatter or inline fields.

---

## 🧪 Filter Expressions

These are used in `WHERE` clauses to control what entries show up in your query results.

### Comparison Operators
- `=` or `==`: Equal
- `!=`: Not equal
- `>`: Greater than
- `<`: Less than
- `>=`: Greater than or equal
- `<=`: Less than or equal
- `in`: Is element in list
- `contains`: Does list contain element
- `regexmatch()`: Does string match regular expression

### Logical Operators
- `and`: Logical AND
- `or`: Logical OR
- `not`: Logical NOT

### Examples
```dataview
where status = "applied"
where tags contains "remote"
where date >= date(2024-01-01)
where title != null and priority = "high"
```

---

## 📊 Grouping Data

Use `GROUP BY` to group your results based on shared field values.

### Syntax
```dataview
TABLE status, count(rows) AS total
FROM "jobs"
GROUP BY status
```

### Options
- `group by <field>` – group by any valid field (e.g., `status`, `category`, `tags`)
- `group by function(<field>)` – group by result of a function (e.g., `date(year, file.ctime)`)

---

## 📁 Folder Filtering

You can restrict queries to folders and subfolders:

```dataview
from "jobs/old-pool"
from "projects" and !contains(file.name, "archive")
```

---

## 🕵️ Date Utilities

- `date(today)`, `date(now)`
- `file.ctime`, `file.mtime`, `file.name`
- `dateformat(field, "yyyy-MM-dd")`

---

## 📦 Field Access

- Frontmatter: `status`, `priority`, `job_title`
- Inline Fields: `Status:: Active`
- File Metadata: `file.name`, `file.path`, `file.ctime`, `file.tags`

---

## 🛠 Function Helpers

- `length()`
- `contains()`
- `choice()`
- `replace()`
- `default()`
- `filter()`
- `flatten()`
- `sum()`, `avg()`, `min()`, `max()`

---

## ✅ Examples

### Basic Table
```dataview
table status, file.ctime
from "jobs"
where status = "queued"
sort file.ctime desc
```

### Count by Status
```dataview
table count(rows) as Total
from "jobs"
group by status
```

### Files Modified This Week
```dataview
table file.name, file.mtime
from "jobs"
where file.mtime >= date(today) - dur(7 days)
```

---

Generated for Bryan’s Vault 🧠

---
