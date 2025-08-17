# Vault Structure (atlas PKM)

This document outlines the organizational structure and principles behind the `atlas` PKM vault. The vault is designed to support personal knowledge management across multiple domains while maintaining consistency, clarity, and efficiency.

> This vault is a living system and will continue to evolve as needs grow and change.

---

## 🧱 Vault Layout (Root)

```markdown
PKM/
├── 00-inbox/          # Quick capture zone for any incoming notes
├── 01-areas/          # All active focus areas (formerly "projects")
│   └── bgre/
│   ├── coding-projects/
│   ├── entertainment/
│   ├── homelab/
│   ├── learn/
│   ├── life/
│   ├── job/
│   ├── techy/
│   ├── to/
│   ├── sm-app/
├── 02-templates/      # Templater, QuickAdd, and snippet templates
├── 03-meta/           # Dashboards, workflows, config notes
└── 04-archive/        # Deprecated notes, paused or completed areas
```

- All **areas of life and work** are nested under `01-areas/`.
    
- Prefix numbers are used for **system-level folders** to control order and separation.
    

---

## 📁 Area Structures

Each area has a tailored structure depending on its purpose, but all follow these principles:

- `index.md` serves as the folder dashboard or table of contents
    
- `overview.md` explains the context, purpose, or long-term goals of the area
    
- Subfolders group major categories of content, logs, or artifacts
    

---

### 🔹 `life/`

```markdown
life/
├── index.md
├── overview.md
├── notes/
├── finances/
├── relationships/
├── housing/
├── health/
└── logs/
```

- Used for personal thoughts, values, financial planning, and wellbeing
    
- Evergreen and reflective notes go in `notes/`
    

---

### 🔹 `job/`

```markdown
job/
├── index.md
├── overview.md
├── resumes/
│   ├── Resume-Implementation-Manager.docx
│   ├── Resume-Operations-Strategist.docx
├── job-search-01/
│   ├── index.md
│   ├── positions/
│   │   ├── amazon-senior-pm.md
│   │   └── samsara-customer-success.md
│   ├── logs/
│   ├── templates/
│   └── archive/
```

- Resumes are stored thematically and referenced via YAML frontmatter in each position note
    
- Job position files live in a flat `positions/` folder
    
- Lifecycle status (e.g., queued, applied, interview) is tracked via metadata — not by moving files
    

```yaml
---
company: Amazon
role: Senior PM
status: queued
resume_used: Resume-Implementation-Manager
applied: 2025-08-01
---
```

---

### 🔹 `learn/`

Under consideration. Proposed structure:

```markdown
learn/
├── index.md
├── overview.md
├── salesforce/
├── aws/
├── python/
└── misc/
```

- Each folder represents a **distinct subject** or body of learning
    
- Project-based or tactical notes related to implementation go in `homelab/` or `code-projects/`
    

---

## 🔧 Strategy Principles

- All notes use **YAML frontmatter** for metadata (e.g., `area`, `status`, `type`, `tags`)
    
- Areas are treated as **persistent domains**, not temporary projects
    
- System folders use numeric prefixes for UI order control
    
- Attachments are stored globally in `-assets/` at the vault root, renamed and organized automatically
    
- Evergreen notes are embedded within the areas where they originate, but marked with `type: evergreen`
    

---

## 📍 Next Steps

More area structures will be added iteratively as they are stabilized:

- `homelab/`
    
- `techy/`
    
- `tol/`
    
- `sm-app/`
    
- `bgre/`
    
- `entertainment/`
    

Full tagging, status tracking, and dashboard logic will be documented in:

- `03-meta/tagging-strategy.md`
    
- `03-meta/dataview-dashboards.md`
    
- `03-meta/workflow-guides/`
    

---

> Last updated: 2025-08-17