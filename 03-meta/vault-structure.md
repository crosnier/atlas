# Vault Structure (atlas PKM)


This document outlines the organizational structure and principles behind the `atlas` PKM vault. The vault is designed to support personal knowledge management across multiple domains while maintaining consistency, clarity, and efficiency.

> This vault is a living system and will continue to evolve as needs grow and change.

>*Last updated: 2025-08-17*


---

## 🧱 Vault Layout (Root)

```markdown
PKM/
├── 00-inbox/          # Quick capture zone for any incoming notes
├── 01-areas/          # All active focus areas (formerly "projects")
│   └── board-game-rule-engine/
│   ├── coding-projects/
│   ├── entertainment/
│   ├── homelab/
│   ├── learn/
│   ├── life/
│   ├── job/
│   ├── techy/
│   ├── tactfully-offensive/
│   ├── supplement-manager-app/
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

A centralized learning library for self-directed education, certifications, and instructional content — organized by subject area and limited to classroom-style learning material.

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

### 🔹 `homelab/`

A reference library of infrastructure-specific design notes, configuration details, and applied system architectures derived from learning efforts; includes implementation-focused logs and `ref-*.md` documentation.

---

### 🔹 `techy/`

A catch-all space for general technology knowledge outside of homelab work — including coding insights, OS tweaks, automation setups, software usage, and digital tooling for daily life.

---

### 🔹 `tactfully-offensive/`

A workspace for capturing ideas, visual design drafts, and message framing related to the 'Tactfully Offensive' brand and business concept.

---

### 🔹 `board-game-rule-engine/`

An incubation space for the conceptual logic, UX models, and reference material behind the board game rules engine idea — eventually evolving into a coding project.

---

### 🔹 `supplement-manager-app/`

A planning and design folder for the mobile supplement-tracking app, capturing early conceptual models, feature definitions, and product vision ahead of implementation.

---

## 🔧 Strategy Principles

- Areas are treated as **persistent domains**, not temporary projects
- System folders use numeric prefixes for UI order control
- Attachments are stored globally in `-assets/` at the vault root, renamed and organized automatically
- Evergreen notes are embedded within the areas where they originate, but marked with `type: evergreen`

---

## 📍 Next Steps

More area structures will be added iteratively as they are stabilized.

Full tagging, status tracking, and dashboard logic will be documented in:
- `03-meta/tagging-strategy.md`
- `03-meta/dataview-dashboards.md`
- `03-meta/workflow-guides/`