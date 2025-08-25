# 🐍 Python Project Setup with direnv and .envrc

"""
Not Fully Vetted

"""

## 🎯 Objective

This guide provides a streamlined approach to initializing new Python projects with:
	•	A standardized directory structure under ~/Code/$PROJECT_NAME
	•	Automatic creation and activation of a virtual environment using direnv
	•	Optional Git repository initialization
	•	Optional installation of base requirements from requirements.txt ￼

By automating these steps, you can ensure consistency across projects and reduce setup time.

## 🛠️ Prerequisites

Ensure the following are installed on your system:
	•	Python 3
	•	direnv

## Installing direnv on macOS

You can install direnv using Homebrew:

brew install direnv

After installation, hook direnv into your shell by adding the following line to your shell configuration file (~/.bashrc, ~/.zshrc, etc.):

eval "$(direnv hook bash)"  # For Bash
# or
eval "$(direnv hook zsh)"   # For Zsh

Then, reload your shell configuration: ￼

source ~/.bashrc  # or source ~/.zshrc

## 📁 Project Template Directory

Create a directory to serve as your Python project template:
```bash
mkdir -p ~/Templates/python-template
```

Populate this directory with the standard files and structure you want every new project to have, such as:
	•	README.md
	•	.gitignore
	•	requirements.txt
	•	Any other boilerplate code or configuration files ￼ ￼

## 📜 Project Initialization Script

Save the following script as ~/bin/new-python-project.sh and make it executable:

```bash
#!/bin/bash

PROJECT_NAME="$1"
TEMPLATE_DIR="$HOME/Templates/python-template"
DEST_DIR="$HOME/Code/$PROJECT_NAME"

if [[ -z "$PROJECT_NAME" ]]; then
  echo "Usage: $0 <project-name>"
  exit 1
fi

if [[ ! -d "$TEMPLATE_DIR" ]]; then
  echo "Error: Template directory not found at $TEMPLATE_DIR"
  exit 1
fi

mkdir -p "$DEST_DIR"
cp -R "$TEMPLATE_DIR/"* "$DEST_DIR"

cd "$DEST_DIR" || exit
python3 -m venv .venv

echo 'layout python .venv' > .envrc
direnv allow

# Optional: create Git repo
git init -b main > /dev/null

# Optional: install base requirements
if [[ -f requirements.txt ]]; then
  . .venv/bin/activate
  pip install -r requirements.txt
fi

echo "[✔] Project '$PROJECT_NAME' initialized at $DEST_DIR"
```

Make the script executable:
```bash
chmod +x ~/bin/new-python-project.sh
```

## 🚀 Usage

To create a new Python project, run:
```bash
setup-pyton-project.sh my-awesome-tool
```

This will: ￼
	•	Create a new directory at ~/Code/my-awesome-tool
	•	Copy the contents of your template directory into it
	•	Create a Python virtual environment in .venv
	•	Set up .envrc with layout python .venv
	•	Allow direnv to manage the environment
	•	Initialize a Git repository
	•	Install dependencies from requirements.txt if it exists ￼

Now, whenever you navigate into your project directory, direnv will automatically activate the virtual environment. ￼

## 🧠 Notes
	•	The layout python .venv directive in .envrc tells direnv to manage the virtual environment located at .venv.
	•	direnv allow is required once per project to approve the .envrc file for security reasons.
	•	Ensure that your shell is properly configured to work with direnv as described in the prerequisites.

By following this setup, you can maintain a consistent and efficient workflow for your Python projects.

⸻
