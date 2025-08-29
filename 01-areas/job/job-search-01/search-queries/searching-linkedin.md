# Searching LinkedIn


---
## LinkedIn Job Search Modifiers Guide

LinkedIn supports Boolean operators in the main search bar for keywords (job titles, skills, companies). Use them to combine/exclude terms. All operators must be UPPERCASE. These work on top of filters like location or date.

### Core Operators
- **Quoted Phrases**: Exact match for multi-word phrases.
  - Sample: `"data scientist"` – Finds jobs with exact "data scientist" in title/description.  

- **AND**: Requires all terms (default if no operator, but explicit for clarity).
  - Sample: `engineer AND remote` – Jobs with both "engineer" and "remote".

- **OR**: Matches any term.
  - Sample: `sales OR marketing` – Jobs with "sales" or "marketing".

- **NOT**: Excludes terms (use for negative searches).
  - Sample: `analyst NOT senior` – Jobs with "analyst" but without "senior".

- **Parentheses**: Groups operators for complex queries.
  - Sample: `(developer OR engineer) AND (python OR java)` – Jobs with "developer" or "engineer", plus "python" or "java".

### Advanced Tips & Samples
- Combine for precision: `(manager OR director) NOT (accounting OR finance)` – Leadership roles excluding accounting/finance.
- Target fields implicitly: Modifiers apply to keywords, titles, companies in descriptions (not strictly field-specific in basic search).
- Wildcards: No native support, but quotes handle phrases.
- Negation chains: `sales NOT "cold calling" NOT telemarketing` – Sales jobs excluding unwanted tasks.
- Company focus: `engineer AND Google OR Microsoft` – Engineer roles at Google or Microsoft.
- Skills-based: `"machine learning" AND (tensorflow OR pytorch) NOT internship` – ML jobs with specific frameworks, no internships.


---
## **LinkedIn Jobs URL Filter Codes**

**Base**
```
https://www.linkedin.com/jobs/search/
```

| **Parameter** | **Purpose**                     | **Values / Notes**                                                                                               |
| ------------- | ------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| currentJobId  | Highlights a job (view context) | Specific job ID; optional.                                                                                       |
| distance      | Radius in miles                 | Set to desired miles (e.g., distance=50).                                                                        |
| geoId         | Location ID                     | Numeric ID for location; look up via LinkedIn search.                                                            |
| keywords      | Search term                     | URL-encoded phrase.                                                                                              |
| f_TPR         | Time posted filter              | Seconds: r3600 (1h), r86400 (24h), r604800 (week), r2592000 (month).                                             |
| f_E           | Experience level filter         | Map: 1 = Internship, 2 = Entry, 3 = Associate, 4 = Mid-Senior, 5 = Director, 6 = Executive. Combine with commas. |
| f_JT          | Job type filter                 | F = Full-time, P = Part-time, C = Contract, T = Temporary, I = Internship, V = Volunteer, O = Other.             |
| f_WT          | Work schedule                   | 1 = On-site, 2 = Hybrid, 3 = Remote. Combine.                                                                    |
| f_SB2         | Salary (or industry?) bucket    | Numeric codes, such as 3 for $80k+ (varies).                                                                     |
| f_AL          | Actively hiring filter          | true only shows active hiring.                                                                                   |
| f_EA          | Easy Apply filter               | true for Easy Apply posts.                                                                                       |
| f_JIYN        | Jobs where you have connections | true if you are connected.                                                                                       |
| f_VJ          | Verified jobs only              | true filters verified postings.                                                                                  |
| f_F           | Job function category           | Codes like sale, mgmt, it, mktg, etc. Combined: f_F=sale,mgmt.                                                   |
| origin        | Context flag (ignore)           | Usually JOB_SEARCH_PAGE_JOB_FILTER; not essential.                                                               |
| refresh       | Force results reload            | Set to true.                                                                                                     |
| sortBy        | Sorting order                   | R = Relevance, DD = Date Posted (newest first).                                                                  |

---
### **Example Breakdown Using Your Sample URL**

```
https://www.linkedin.com/jobs/search/
?currentJobId=4291309411
&distance=25
&f_E=2%2C3%2C4
&f_JT=F%2CC
&f_SB2=3
&f_TPR=r86400
&f_WT=2%2C1%2C3
&geoId=90000536
&keywords=implementation%20specialist
&origin=JOB_SEARCH_PAGE_JOB_FILTER
&refresh=true
&sortBy=R
```

Mapping:
- **Date posted**: f_TPR=r86400 → Past 24h
- **Experience**: f_E=2,3,4 → Entry, Associate, Mid-Senior
- **Job type**: f_JT=F,C → Full-time, Contract
- **Salary**: f_SB2=3 → $80k+
- **Work type**: f_WT=2,1,3 → Hybrid, On-site, Remote
- **Location**: geoId=90000536 → Franklin, TN
- **Title**: keywords=implementation specialist
---
Edit filter values, reorder parameters. Results update. No page refresh needed—fast tune.

---

**SAMPLE URL**
```html
https://www.linkedin.com/jobs/search/?currentJobId=4291309411&distance=25&f_E=2%2C3%2C4&f_JT=F%2CC&f_SB2=3&f_TPR=r86400&f_WT=2%2C1%2C3&geoId=90000536&keywords=implementation%20specialist&origin=JOB_SEARCH_PAGE_JOB_FILTER&refresh=true&sortBy=R
```

breakdown of that LinkedIn Jobs search URL and what each query parameter means:
**Parameters**
- currentJobId=4291309411
    - Highlights a specific job ID (likely the one you clicked into). Does not control the search filters themselves.
- distance=25
    - Radius in miles (25 miles around the selected geo location).
- f_E=2%2C3%2C4
    - Experience levels filter. Encoded commas (%2C) separate values:
        - 2 = Entry level
        - 3 = Associate
        - 4 = Mid-senior level
- f_JT=F%2CC
    - Job type filter:
        - F = Full-time
        - C = Contract
- f_SB2=3
    - Salary bucket filter. 3 corresponds to “$80,000+”.
- f_TPR=r86400
    - Time Posted filter:
        - r means “relative”
        - 86400 seconds = 24 hours → Past 24 hours
- f_WT=2%2C1%2C3
    - Work type filter:
        - 2 = Remote
        - 1 = On-site
        - 3 = Hybrid
- geoId=90000536
    - Location ID. 90000536 = Franklin, Tennessee, United States.
- keywords=implementation%20specialist
    - Search keywords (decoded: “implementation specialist”).
- origin=JOB_SEARCH_PAGE_JOB_FILTER
    - Context of the search (applied from the job search filters page). Not editable in a useful way.
- refresh=true
    - Forces the search to reload results.
- sortBy=R
    - Sort results by Relevance (R). Other option is Date Posted (DD).

**Mapping back to your manual filter selections:**
- Date posted → f_TPR=r86400
- Experience level → f_E=2,3,4
- Job type → f_JT=F,C
- Remote/On-site/Hybrid → f_WT=2,1,3
- Salary $80,000+ → f_SB2=3
- Title → keywords=implementation specialist
- Location (Franklin, TN) → geoId=90000536

---
## Shell Script Template

a ready-to-run Bash builder for **LinkedIn Jobs** URLs. It handles URL-encoding and the comma-encoding LinkedIn expects for multi-select filters.  

```bash
#!/usr/bin/env bash
# linkedin-url-builder.sh
# Build a LinkedIn Jobs search URL from variables (verified params only).

set -euo pipefail

# ---------- CONFIG: set what you want ----------
KEYWORDS="implementation specialist"  # free text; spaces OK
GEO_ID="90000536"                     # REQUIRED: LinkedIn geoId (e.g., Franklin, TN = 90000536)
DISTANCE_MILES="25"                   # radius in miles; empty to omit

# Time posted: pick ONE of the preset seconds below or leave empty
# 3600=Past hour, 86400=Past 24h, 604800=Past week, 2592000=Past month
TPR_SECONDS="86400"                   # empty to omit

# Experience levels: numbers 1..6; comma-separated -> 1=Intern,2=Entry,3=Associate,4=Mid-Senior,5=Director,6=Executive
EXPERIENCE="2,3,4"                    # e.g., "2,3,4" or "" to omit

# Job types: letters; comma-separated -> F=Full-time,P=Part-time,C=Contract,T=Temporary,I=Internship,V=Volunteer,O=Other
JOB_TYPES="F,C"                       # e.g., "F,C" or "" to omit

# Work types: numbers; comma-separated -> 1=On-site,2=Hybrid,3=Remote
WORK_TYPES="2,1,3"                    # e.g., "2,1,3" or "" to omit

# Salary bucket (experimental, varies by region): integers like 3 for $80k+
SALARY_BUCKET="3"                     # "" to omit

# Sorting: R=Relevance, DD=Date (newest)
SORT_BY="R"                           # "DD" for newest

# Optional misc
CURRENT_JOB_ID=""                     # highlight a job id or leave ""
REFRESH="true"                        # "true" or ""
ORIGIN="JOB_SEARCH_PAGE_JOB_FILTER"   # safe default; or leave ""

# ---------- helpers ----------
url_encode() {
  local s="$1"
  if command -v python3 >/dev/null 2>&1; then
    python3 - <<'PY' "$s"
import sys, urllib.parse
print(urllib.parse.quote_plus(sys.argv[1]))
PY
  else
    python - <<'PY' "$s"
import sys, urllib
print(urllib.quote_plus(sys.argv[1]))
PY
  fi
}

encode_commas() {
  # LinkedIn wants commas URL-encoded as %2C inside some params
  # Input like "2,3,4" -> "2%2C3%2C4"
  echo "${1//,/%2C}"
}

# ---------- build URL ----------
BASE="https://www.linkedin.com/jobs/search/"

[[ -z "${GEO_ID:-}" ]] && { echo "ERROR: GEO_ID is required."; exit 1; }

kw_enc="$(url_encode "$KEYWORDS")"
url="${BASE}?geoId=${GEO_ID}&keywords=${kw_enc}"

[[ -n "${DISTANCE_MILES:-}" ]] && url+="&distance=${DISTANCE_MILES}"

if [[ -n "${TPR_SECONDS:-}" ]]; then
  case "$TPR_SECONDS" in
    3600|86400|604800|2592000) url+="&f_TPR=r${TPR_SECONDS}";;
    *) echo "WARN: TPR_SECONDS not a known preset; using as-is"; url+="&f_TPR=r${TPR_SECONDS}";;
  esac
fi

if [[ -n "${EXPERIENCE:-}" ]]; then
  url+="&f_E=$(encode_commas "${EXPERIENCE}")"
fi

if [[ -n "${JOB_TYPES:-}" ]]; then
  url+="&f_JT=$(encode_commas "${JOB_TYPES}")"
fi

if [[ -n "${WORK_TYPES:-}" ]]; then
  url+="&f_WT=$(encode_commas "${WORK_TYPES}")"
fi

[[ -n "${SALARY_BUCKET:-}" ]] && url+="&f_SB2=${SALARY_BUCKET}"
[[ -n "${CURRENT_JOB_ID:-}" ]] && url+="&currentJobId=${CURRENT_JOB_ID}"
[[ -n "${ORIGIN:-}" ]] && url+="&origin=${ORIGIN}"
[[ -n "${REFRESH:-}" ]] && url+="&refresh=${REFRESH}"
[[ -n "${SORT_BY:-}" ]] && url+="&sortBy=${SORT_BY}"

echo "$url"
```

**Notes**
- GEO_ID is required. Get it by running a manual LinkedIn search and copying the geoId value from the URL.
- Multi-select params (f_E, f_JT, f_WT) must use %2C between values. The script handles that.
- Valid f_TPR presets are enforced. You can still pass a custom seconds value if you want.
- Leave any variable empty to omit that filter.