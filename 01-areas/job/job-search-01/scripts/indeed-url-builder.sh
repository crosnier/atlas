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