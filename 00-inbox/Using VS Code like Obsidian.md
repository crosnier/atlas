---
status: logged
---

# Using VS Code like Obsidian

- [Using VS Code like Obsidian](#using-vs-code-like-obsidian)
    - [🛠 Core Setup](#-core-setup)
    - [🔥 Suggested Extensions](#-suggested-extensions)
    - [🗂 Folder Structure Example](#-folder-structure-example)
    - [✍ Template Example (templates/default-note.md)](#-template-example-templatesdefault-notemd)
    - [🚀 Quick Workflow Example](#-quick-workflow-example)
    - [🛸 Bonus Tips](#-bonus-tips)
    - [💬 Final Call](#-final-call)

---

### 🛠 Core Setup
	•	Markdown Notes:
→ Just normal .md files in folders.
	•	Templates:
→ Create a templates folder.
→ Copy-paste template manually when making a new file.
→ (Optional: automate with an extension, see below.)
	•	Relative Links:
→ Use [link text](../folder/filename.md) manually.
→ VS Code will autocomplete file names with default behavior.
	•	Table of Contents (Optional):
→ Extension to generate it: see below.
	•	GitHub Push:
→ Git panel built into VS Code.
→ Stage → Commit → Push. Easy clicks.

---

### 🔥 Suggested Extensions

Extension	Purpose	Notes
Markdown All in One	TOC generation, formatting, keyboard shortcuts	Mandatory 🔥
Markdown Links	Smarter relative link management	Optional
GitHub Pull Requests and Issues	GitHub integration (good push/pull flow)	Optional
Template Manager (or Insert File)	Helps with quick template insertion	Optional
Auto Commit (if you want daily auto commits)	Auto git commit and push on timer	Optional

---

### 🗂 Folder Structure Example
```
/notes/
├── templates/
│   └── default-note.md
├── project1/
│   ├── note1.md
│   ├── note2.md
├── project2/
│   ├── meeting-notes.md
.gitignore
README.md
```


---

### ✍ Template Example (templates/default-note.md)

```
# Title

## Table of Contents
<!-- TOC -->

## Section 1

## Section 2

## Section 3
```

(TOC auto-fills when you run the “Markdown All in One” → “Update Table of Contents” command.)

---

### 🚀 Quick Workflow Example
	1.	Copy templates/default-note.md into new file.
	2.	Start typing.
	3.	Insert relative links manually (autocomplete helps).
	4.	Save.
	5.	(Optional) Press hotkey to auto-insert TOC.
	6.	Stage → Commit → Push changes when ready.

---

### 🛸 Bonus Tips
	•	Ctrl+Shift+P → “Markdown All in One: Create Table of Contents”
	•	Git commits can be done in 3 clicks inside VS Code.
	•	If you want timed auto-commits, Auto Commit extension can push every X hours.

---

### 💬 Final Call

Yes, VS Code is perfect for this without any drama.
No overthinking. No rabbit holes.
Just Markdown, folders, Git.

---

Here’s a straight-up recommended VS Code settings checklist tailored for your markdown + git workflow:

Setting Key	Recommended Value	Why It Helps
files.autoSave	"afterDelay"	Saves files automatically so you don’t lose work.
files.autoSaveDelay	1000	1 second after you stop typing, file saves.
editor.wordWrap	"on"	Makes long markdown lines easier to read without scrolling horizontally.
editor.renderWhitespace	"boundary"	Shows spaces and tabs at line ends (helps when editing templates cleanly).
editor.tabSize	2	Clean, small indentation for markdown. (Personal preference, optional.)
markdown.extension.toc.updateOnSave	true	Auto-update the Table of Contents every time you save.
markdown.extension.toc.orderedList	false	Keeps TOC bullet points instead of numbered (looks cleaner in notes).
markdown.preview.breaks	true	Treat single line breaks as real breaks in markdown preview.
git.autofetch	true	Git automatically fetches changes in background.
git.confirmSync	false	Skip “Are you sure you want to sync?” popup.
git.enableSmartCommit	true	Lets you just click “Commit” without typing a message (if you want to move fast).
explorer.confirmDelete	false	Speeds up deleting notes if needed (no “Are you sure?”).
workbench.editor.enablePreview	false	Open every file in its own tab (not reuse tabs) - more natural for notes.

|column   |header   |
|---|---|
|table |value|

---

🛠 Full settings.json Block Example
```json
{
  "files.autoSave": "afterDelay",
  "files.autoSaveDelay": 1000,
  "editor.wordWrap": "on",
  "editor.renderWhitespace": "boundary",
  "editor.tabSize": 2,
  "markdown.extension.toc.updateOnSave": true,
  "markdown.extension.toc.orderedList": false,
  "markdown.preview.breaks": true,
  "git.autofetch": true,
  "git.confirmSync": false,
  "git.enableSmartCommit": true,
  "explorer.confirmDelete": false,
  "workbench.editor.enablePreview": false
}
```

✅ You can paste this directly into your VS Code settings.json.


---

🔥 Here’s how you can almost mimic it:

Feature	Solution	Notes
Auto Preview on open	Use Markdown Preview Enhanced extension	Opens preview tab when you open .md file.
Quick Edit Mode	Use Markdown Preview Enhanced → “Open preview to the side” + split pane workflow	Click to the editor side to edit quickly.
Shortcut key to toggle edit/preview	Built-in VS Code Command: Ctrl+K V (open preview)	Or map a custom keybinding for speed.
Optional - Extension: “Markdown Notes”	Better Obsidian-like UX for fast note creation/editing	If you want slightly more Obsidian feel



---

🛠 Practical Setup Steps
	1.	Install extension → Markdown Preview Enhanced
	2.	Open Markdown file.
	3.	Right Click → Open Preview to the Side
	4.	Click left pane (edit mode) to type.
	5.	View right pane (live preview) anytime.

Bonus:
In settings.json, you can auto-open preview with:

"markdown.preview.openSideBySide": true,
"markdown.preview.autoShowPreviewToSide": true



---

🖥 True Split-Screen “Obsidian Feel” Workflow:
	•	Left: Raw Markdown you click into when you want to edit
	•	Right: Always-updated preview
	•	Save (Ctrl+S) = preview refreshes
	•	No mode switching needed

---

🚨 Reality Check:
	•	In VS Code you always edit in a “raw” pane.
	•	But the side-by-side preview gets very close to Obsidian’s fluidity.

---

⚡ Pro Tip:
You could also rig a keybinding so when you open any .md file, it automatically opens side-by-side preview mode. Would you like me to generate a ready-to-paste keybindings.json for that too? 🎯
(Makes it a single shortcut!)


