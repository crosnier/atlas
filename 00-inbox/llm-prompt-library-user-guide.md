# 📘 LLM Prompt Library – User Guide

*How to organize, structure, and manage an efficient, scalable LLM prompt library for personal or team use.*

---

## 🧭 Overview

This guide outlines best practices from top LLM developers for storing and using prompts. It includes:
- Folder structure
- Prompt formatting
- Tagging strategy
- Examples and tools

---

## 📁 Folder Structure

Organize prompts into clearly named, topic-based folders:

```plaintext
/prompt-library
├── _README.md
├── tags.yaml
├── /core                  # Reusable prompt basics
├── /formatting            # Prompts that shape output (e.g., markdown, tables)
├── /specialized           # Domain or task-specific prompts
├── /multi-step            # Pipelines and chained tasks
└── /archive               # Retired or unused prompts
```

---

## 🧾 Prompt File Format (`.yaml`)

Store each prompt in its own `.yaml` file with full metadata and structure:

```yaml
id: summarize-v1
title: Summarize Text
description: "Summarizes any text into concise bullet points."
tags: [core, summarization, quick-use]
created: 2025-07-21
modified: 2025-07-21
author: bryan

prompt:
  input_type: "Text block"
  output_type: "Bullet points"
  temperature: 0.3
  format: markdown
  template: |
    Summarize the following content into clear bullet points:
    ---
    {{input_text}}
    ---
    Focus on clarity, no extra commentary.

examples:
  - input: "ChatGPT is a large language model..."
    output: |
      - Built by OpenAI
      - Answers questions
      - Writes content
      - Automates tasks

notes:
  - Keep under 7 bullets
  - Works best on ≤ 1k words
```

---

## 🏷️ Tagging System

Maintain a global `tags.yaml` for consistent label use:

```yaml
core: "Fundamental prompt building blocks"
utility: "Helpful across domains"
experimental: "Not fully validated"
automated: "Used in scripts or API calls"
human-in-loop: "Designed for manual review"
chained: "Part of a multi-step flow"
```

### Tagging Tips:
- Assign 3–5 tags per prompt
- Use flat (non-nested) tags
- Avoid duplicates or inconsistent spelling

---

## 🧱 Prompt Sections (Inside Each File)

| Section     | Purpose                                  |
|-------------|-------------------------------------------|
| `title`     | Clear name of the prompt task             |
| `description`| One-line summary                        |
| `tags`      | For filtering and search                  |
| `prompt`    | Template, variables, and output format    |
| `examples`  | (Optional) Shows expected input/output     |
| `notes`     | Any tips, edge cases, or usage notes      |

---

## 🛠 Suggested Tools

| Tool            | Why Use It                            |
|-----------------|----------------------------------------|
| YAML            | Clean, versionable, human-readable     |
| Markdown        | Great for documentation and archiving  |
| GitHub          | For collaboration + version control    |
| Obsidian        | Local note management with tag search  |
| Notion          | Team-accessible prompt repo            |

---

## ✅ Best Practices Checklist

- ✅ Store each prompt as a standalone `.yaml`
- ✅ Use clear folder categories (`core`, `specialized`, etc.)
- ✅ Label prompts with consistent tags
- ✅ Keep examples + notes in the file
- ✅ Use version control (Git) when possible
- ✅ Archive old or failed prompts for reference

---

## 🚧 Experimental Areas

Use a `/drafts` folder for untested or in-progress prompts.  
Revisit periodically for review or promotion to the main library.

---

## 🧠 Tip

> **Prompts are code. Treat them like it.**  
Use versioning, modularization, and structured metadata just like any software asset.

---

*Organized prompts are powerful prompts. Don’t let genius ideas die in chat history.*
