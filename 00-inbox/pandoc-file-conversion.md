# Pandoc Defaults File: Full Capabilities Guide

Pandoc uses YAML "defaults" files (invoked with `--defaults=file.yaml`) to configure conversions, like Markdown to PDF via LaTeX. These override CLI options, support environment vars (e.g., `${HOME}`), and can chain via `include` for modularity. Structure: Start with `---`, key-value pairs or lists, end optional.

---

## Run Conversion


```bash
pandoc resume.md -o resume.pdf --defaults=resume_config.yaml
```
- source file
- set destination file name
- apply formatting instruction using yaml

---

## Core Structure and Usage
- **File Format**: YAML, e.g.:
  ```yaml
  ---
  input-files:
    - input.md
  output-file: output.pdf
  from: markdown
  to: pdf
  pdf-engine: pdflatex
  variables:
    geometry: margin=1in
  ---
  ```
- **Invocation**: `pandoc --defaults=myconfig.yaml`.
- **Priorities**: CLI args > defaults file > built-in defaults.
- **Environment Interpolation**: Use `${VAR}` in paths, e.g., `template: ${HOME}/custom.tex`.
- **Chaining**: Use `defaults: [file1.yaml, file2.yaml]` to combine, later overrides earlier.

---
## File Naming Options
- `input-files`: List of input files, e.g., `- file1.md - file2.md`. Empty for stdin.
- `output-file`: Output path, e.g., `output.pdf`. Use `-` for stdout.
- `data-dir`: Custom data directory for templates/CSLs.
- `log-file`: Path for log output.

---

## Formatting and PDF-Specific Options (via LaTeX)
- `from`: Input format, e.g., `markdown+smart`.
- `to`: Output format, e.g., `pdf`.
- `pdf-engine`: LaTeX engine, e.g., `pdflatex`, `xelatex`, `lualatex`.
- `pdf-engine-opts`: List of engine args, e.g., `- -shell-escape`.
- `template`: Path to custom LaTeX template.
- `variables`: Key-value map for template vars, e.g.:
  - `geometry`: Page margins, e.g., `margin=1in`.
  - `mainfont`: Body font, e.g., `Times New Roman`.
  - `fontsize`: e.g., `12pt`.
  - `linkcolor`: Hyperlink color, e.g., `blue`.
  - `papersize`: e.g., `a4`.
  - `toc`: `true` for table of contents.
  - `toc-depth`: Max header level in TOC, e.g., `3`.
  - `number-sections`: `true` to number headers.
  - `include-in-header`, `include-before-body`, `include-after-body`: Paths/lists for extra LaTeX code.
- `filters`: List of Lua/JSON filters, e.g., `- citeproc - custom.lua`.
- `metadata`: Document metadata, e.g., `title: My Doc`, affects PDF properties.
- `metadata-files`: External YAML metadata files.
- `cite-method`: Citation style, e.g., `citeproc`.
- `top-level-division`: Header grouping, e.g., `part`, `chapter`, `section`.
- `reference-section-title`: Title for references section.

---

## Markdown Element Conversion to PDF
Pandoc translates Markdown to LaTeX structures for PDF. Config influences via reader/writer options:

- **Headers**:
  - `# H1`: Becomes `\section{}` (or `\part{}`/`chapter{}` with `top-level-division: chapter`).
  - `## H2`: `\subsection{}`.
  - `### H3`: `\subsubsection{}`.
  - `#### H4`: `\paragraph{}`.
  - Config: `shift-heading-level-by: 1` to offset levels (e.g., make # H1 into \chapter{}).
  - `number-sections: true` adds numbering like 1.1.
  - Unnumbered: Add `{-}` after header, e.g., `# Header {-}`.

- **Body Text**:
  - Plain text: Wrapped in paragraphs.
  - Inline: *Italic* → \emph{}, **bold** → \textbf{}.
  - Lists: - Bullet → itemize; 1. Numbered → enumerate.
  - Code: `inline` → \texttt{}; fenced blocks → verbatim or listings package.
  - Config: `indented-code-classes: [python]` adds language class for highlighting.

- **Blank Rows/Lines**:
  - Single blank: Paragraph break (new \paragraph in LaTeX).
  - Multiple blanks: Treated as one; use `  ` (two spaces) at line end for line break.
  - Horizontal rule: --- → \hrule.
  - Config: No direct, but `preserve-tabs: true` or `tab-stop: 4` affects indented code/blocks.

- **Other Elements**:
  - Images: `![alt](path)→ \includegraphics{}; config `default-image-extension: .png`.`
  - Links: [text](url) → \href{}.
  - Tables: Pipe tables → longtable or tabular.
  - Blockquotes: > → quote env.
  - Config Impacts: `strip-comments: true` removes HTML comments; `track-changes: accept` for Word-like edits.

---

## Advanced Features
- `verbosity`: `INFO`, `ERROR`, etc., for logging.
- `sandbox: true`: Restrict file access.
- `resource-path`: Search paths for images/files.
- `request-headers`: For HTTP fetches.
- `fail-if-warnings: true`: Error on warnings.
- `trace: true`: Debug filter execution.
- `abbreviations`: Custom abbrev file.
- `extract-media: dir`: Extract embedded media.

For full list, see Pandoc manual. Example full config for PDF:
```yaml
---
# Input/Output
from: markdown+smart+pipe_tables # Enable smart quotes, pipe tables
to: pdf
input-files: 
  - input.md # Input file
output-file: output.pdf # Output file
data-dir: ${HOME}/pandoc # Custom data directory for templates
log-file: build.log # Log output

# PDF Engine
pdf-engine: xelatex # Use xelatex for fontspec compatibility
pdf-engine-opts:
  - -shell-escape # Allow external commands (e.g., for minted code blocks)

# Document Structure
top-level-division: section # Treat # H1 as \section{}
shift-heading-level-by: 0 # No header level offset
number-sections: true # Number sections (e.g., 1.1, 1.2)
toc: true # Include table of contents
toc-depth: 3 # Include up to ### H3 in TOC
reference-section-title: References # Title for bibliography section

# Typography and Layout
variables:
  geometry: margin=0.5in # Narrow margins
  mainfont: Arial # Body and default header font
  sansfont: Helvetica # Sans-serif font for specific elements
  monofont: Courier New # Monospace font for code
  fontsize: 11pt # Body text size
  linestretch: 1.15 # Line spacing (alternative to setspace)
  papersize: a4 # Paper size
  documentclass: article # LaTeX document class
  classoption:
    - twoside # Two-sided document
  indent: true # Indent paragraphs
  linkcolor: blue # Hyperlink color
  urlcolor: cyan # URL color
  citecolor: magenta # Citation color
  colorlinks: true # Enable colored links
  header-includes: |
    \usepackage{titlesec}
    \titleformat{\section}{\Large\bfseries}{Section \thesection}{1em}{} # H1: Large, bold
    \titleformat{\subsection}{\large\bfseries}{\thesubsection}{1em}{} # H2: Slightly smaller
    \titleformat{\subsubsection}{\normalsize\bfseries}{\thesubsubsection}{1em}{} # H3
    \titleformat{\paragraph}{\normalsize\itshape}{\theparagraph}{1em}{} # H4
    \usepackage{setspace}
    \onehalfspacing # Body text spacing
    \usepackage{fancyhdr}
    \pagestyle{fancy}
    \fancyhead[L]{Bryan’s Doc} # Custom header
    \fancyfoot[C]{\thepage} # Page number in footer
    \usepackage{xcolor} # For colored text
    \usepackage{longtable} # For Markdown tables
  include-before-body: |
    \usepackage{parskip}
    \setlength{\parskip}{1em} # Extra spacing for blank lines
  include-after-body: |
    \newpage
    \section*{Appendix} # Custom appendix
  include-in-header: |
    \usepackage{hyperref} # Hyperlinks setup
    \hypersetup{breaklinks=true} # Allow link breaks

# Metadata
metadata:
  title: Bryan’s Document # Document title
  author: Bryan # Author name
  date: \today # Dynamic date
  keywords:
    - document
    - pandoc
    - pdf # PDF metadata keywords
  lang: en-US # Document language
  abstract: A sample document for Pandoc PDF output # Abstract for metadata

# Citations
cite-method: citeproc # Use citeproc for citations
bibliography: references.bib # Bibliography file
csl: apa.csl # Citation style (e.g., APA)
biblio-style: authoryear # BibTeX style
bibentry: true # Include full bibliography entries
suppress-bibliography: false # Include bibliography in output

# Filters and Processing
filters:
  - citeproc # Citation processing filter
  - custom.lua # Custom Lua filter (placeholder)
strip-comments: true # Remove HTML comments
track-changes: accept # Accept tracked changes
preserve-tabs: true # Preserve tabs in code blocks
tab-stop: 4 # Tab width
default-image-extension: .png # Default image extension
highlight-style: pygments # Code block highlighting style

# Advanced Options
verbosity: INFO # Logging level
sandbox: true # Restrict file access
resource-path:
  - . # Current directory for images/files
  - ${HOME}/resources # Additional resource path
request-headers:
  - - User-Agent
    - Pandoc/3.0 # Custom HTTP header
fail-if-warnings: false # Don’t fail on warnings
trace: false # Disable filter debug
abbreviations: abbr.txt # Custom abbreviations file
extract-media: media/ # Extract embedded media to directory
dpi: 300 # Image resolution for PDF
standalone: true # Produce full document
self-contained: false # Don’t embed external resources
pdfa: true # PDF/A compliance
---
```


*Pandoc: Because who needs Word when you've got command-line magic?*

---

## Installation Steps for Pandoc and LaTeX Pipeline

### Install Pandoc

```bash
# Install Pandoc via Homebrew
brew install pandoc

# Verify Pandoc installation
pandoc --version
```
  
### Install BasicTeX

```bash
# Install BasicTeX via Homebrew
brew install basictex

# Verify BasicTeX installation
pdflatex --version
tlmgr --version
```

### Install Required LaTeX Packages

Install required LaTeX packages for Pandoc formatting
```bash
sudo tlmgr install geometry fontspec fancyhdr titlesec setspace longtable xcolor
```

### Optional: Install Poppler for PDF Conversions

Install poppler for PDF-to-Markdown/DOCX conversions
```bash
brew install poppler
```

### Optional: Clean Up Homebrew

Clean up Homebrew to keep system lean
```bash
brew autoremove
brew cleanup
```