# 📦 macOS Shortcuts: Workflow Launcher Guide

## 🚀 Goal
Create a Shortcut that opens the following apps for a daily workflow:
- Mail
- Safari
- Discord
- Slack
- Calendar
- Spotify
- Plex
- Finder
- ChatGPT (Mac app)

---

## 🛠️ Step-by-Step: Create the Shortcut

1. Open the **Shortcuts** app.
2. Click **+** to create a new Shortcut.
3. Rename it to something like `Daily Workspace`.
4. Search for and add the **Open App** action.
5. For each app, click **App** and choose from the list.
6. Add these in order:
    - Mail
    - Safari
    - Discord
    - Slack
    - Calendar
    - Spotify
    - Plex
    - Finder
    - ChatGPT

💡 Optionally: Add a **Wait** action (e.g., 3 seconds) to delay before triggering your layout hotkey manually.

---

## 💻 Run via CLI (Terminal)

You can trigger any shortcut from the terminal using:

```bash
shortcuts run "Daily Workspace"
```

➡️ Add this to an alias or Automator `.command` file for double-click execution.

---

## 🖱️ Run via Right-Click (Quick Actions)

1. In Shortcuts app, click the Shortcut’s ⓘ info button.
2. Check **Use as Quick Action**.
3. Enable in:
    - **Services Menu**
    - **Finder right-click menu**
4. Now you can right-click any file or empty desktop space → **Quick Actions → Daily Workspace**

---

## 🧷 Create a Desktop Shortcut

### Method 1: Drag & Drop

1. Open **Shortcuts** app.
2. Drag the shortcut from the sidebar onto the desktop.
3. This creates a `.shortcut` file.
4. Double-click it anytime to run.

### Method 2: Automator App Wrapper

1. Open **Automator** → New → **Application**
2. Add one action: `Run Shell Script`
3. Paste:
    ```bash
    shortcuts run "Daily Workspace"
    ```
4. Save as `Launch Daily Workspace.app` to your Desktop.
