# Searching Indeed


---
## **✅ Indeed Search URL Master Reference (Verified)**

**Base URL:**
```
https://www.indeed.com/jobs
```

---
### **Core Parameters**

|**Parameter**|**Purpose**|**Verified Values / Examples**|
|---|---|---|
|q|Keywords|q=system+implementation, q=project+manager|
|l|Location|l=Franklin%2C+TN, l=Nashville%2C+TN|
|radius|Distance (miles)|radius=10, radius=25, radius=35, radius=50|
|fromage|Date posted|1 = past 24h, 3 = past 3 days, 7 = past week, 14 = past 2 weeks, 30 = past month|
|jobsWithPay|Only show jobs with pay info|1 = enabled (only jobs that list salary)|
|salaryType|Salary threshold|%2450%2C000%2B = $50,000+, %2480%2C000%2B = $80,000+, %24100%2C000%2B = $100,000+|
|jt|Job type|jt=fulltime, jt=parttime, jt=contract, jt=internship, jt=temporary|
|sort|Sort order|sort=date (newest first), sort=relevance (default)|
|from|Context flag|Usually from=searchOnDesktopSerp (safe to ignore)|
|vjk|Specific job highlight|Example: vjk=ac791733fd9823b1 (not needed for general search)|

---
### Experience Level (explvl)

Verified working filters (US market):
- explvl=entry_level
- explvl=mid_level
- explvl=senior_level

(Indeed may suppress these in some regions, but when used they filter correctly.)

---
### **Example — All Filters Together**

  **Search:** “system administrator” in Nashville, TN, posted last 7 days, only jobs with pay info, salary $100k+, full-time, mid/senior level, within 25 miles, newest first:

```
https://www.indeed.com/jobs?
q=system+administrator
&l=Nashville%2C+TN
&fromage=7
&jobsWithPay=1
&salaryType=%24100%2C000%2B
&radius=25
&jt=fulltime
&explvl=mid_level
&explvl=senior_level
&sort=date
```

> Remote/onsite (sc) filters exist but are **obfuscated/encoded** and can’t be reliably hand-edited — I excluded them since they’re not practical for direct tweaking.

---
## **🔹 Indeed Search URL Template**

a **ready-to-copy template** for Indeed search URLs with placeholders you can swap in directly

```
https://www.indeed.com/jobs?
q={keywords}
&l={location}
&radius={miles}
&fromage={days}
&jobsWithPay={0-or-1}
&salaryType=%24{salary}+%2B
&jt={jobtype}
&explvl={experience}
&sort={sortorder}
```

---

### **🔹 Placeholder Guide**

| **Placeholder** | **What to Insert**                      | **Examples**                                                               |
| --------------- | --------------------------------------- | -------------------------------------------------------------------------- |
| {keywords}      | Search terms (use + for spaces)         | project+manager, system+implementation                                     |
| {location}      | City/State (URL encoded)                | Nashville%2C+TN, Franklin%2C+TN                                            |
| {miles}         | Distance radius in miles                | 10, 25, 35, 50                                                             |
| {days}          | Date posted (days back)                 | 1 = past 24h, 3 = past 3 days, 7 = past week, 30 = past month              |
| {0-or-1}        | Only show jobs with pay info            | 1 = enabled, 0 = disabled                                                  |
| {salary}        | Salary floor (no commas in placeholder) | 80000 → %2480%2C000%2B, 100000 → %24100%2C000%2B                           |
| {jobtype}       | Employment type                         | fulltime, parttime, contract, internship, temporary                        |
| {experience}    | Experience level                        | entry_level, mid_level, senior_level (can repeat multiple &explvl= params) |
| {sortorder}     | Sorting                                 | date (newest first), relevance (default)                                   |

---

### **🔹 Example (Populated)**

**Search:** “implementation specialist” in Franklin, TN, within 35 miles, last 3 days, salary $80k+, only jobs with pay info, full-time, entry/mid level, sorted by newest.

```
https://www.indeed.com/jobs?
q=implementation+specialist
&l=Franklin%2C+TN
&radius=35
&fromage=3
&jobsWithPay=1
&salaryType=%2480%2C000%2B
&jt=fulltime
&explvl=entry_level
&explvl=mid_level
&sort=date
```

---

## Shell Script Template

```bash
#!/usr/bin/env bash
# indeed-url-builder.sh

set -euo pipefail

# ---------- CONFIG: set what you want ----------
KEYWORDS="implementation specialist"    # spaces OK
LOCATION="Franklin, TN"                 # city, state
MILES="35"                              # 10, 25, 35, 50
DAYS="3"                                # 1=24h, 3=3d, 7=week, 14, 30
ONLY_WITH_PAY="1"                       # 1 to require pay info, 0 or "" to omit
SALARY_FLOOR="80000"                    # integer like 80000; empty to skip
JOB_TYPE="fulltime"                     # fulltime|parttime|contract|internship|temporary; empty to skip
EXPERIENCE="entry_level,mid_level"      # comma-separated; empty to skip
SORT_ORDER="date"                       # date|relevance

# ---------- helpers ----------
have_py() { command -v python3 >/dev/null 2>&1 || command -v python >/dev/null 2>&1; }

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

commafy() {
  # format integer with thousands separators
  python3 - <<'PY' "$1" 2>/dev/null || python - <<'PY' "$1"
import sys
n = int(sys.argv[1])
print(f"{n:,}")
PY
}

build_salary_param() {
  local floor="${1:-}"
  [[ -z "$floor" ]] && return 0
  local with_commas; with_commas="$(commafy "$floor")"        # 80000 -> 80,000
  local label="\$${with_commas}+"
  local encoded; encoded="$(url_encode "$label")"             # -> %2480%2C000%2B
  printf "&salaryType=%s" "$encoded"
}

build_explvl_params() {
  local levels="${1:-}"
  [[ -z "$levels" ]] && return 0
  IFS=',' read -ra arr <<< "$levels"
  for lvl in "${arr[@]}"; do
    printf "&explvl=%s" "$lvl"
  done
}

# ---------- build URL ----------
BASE="https://www.indeed.com/jobs"

Q="$(url_encode "$KEYWORDS")"
L="$(url_encode "$LOCATION")"

url="${BASE}?q=${Q}&l=${L}"

[[ -n "${MILES:-}"    ]] && url+="&radius=${MILES}"
[[ -n "${DAYS:-}"     ]] && url+="&fromage=${DAYS}"
[[ "${ONLY_WITH_PAY:-}" = "1" ]] && url+="&jobsWithPay=1"
url+="$(build_salary_param "${SALARY_FLOOR:-}")"
[[ -n "${JOB_TYPE:-}" ]] && url+="&jt=${JOB_TYPE}"
url+="$(build_explvl_params "${EXPERIENCE:-}")"
[[ -n "${SORT_ORDER:-}" ]] && url+="&sort=${SORT_ORDER}"

echo "$url"
```

Usage:
- Save as indeed-url-builder.sh.
- chmod +x indeed-url-builder.sh
- Edit the CONFIG block, then run: ./indeed-url-builder.sh    
- Output is a complete URL you can open or paste.

Tip:
- Multiple experience levels: EXPERIENCE="entry_level,mid_level,senior_level" generates repeated &explvl= params as Indeed expects.
- Omit a filter by leaving its variable empty.