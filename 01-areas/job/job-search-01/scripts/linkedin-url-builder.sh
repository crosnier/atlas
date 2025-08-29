#!/usr/bin/env bash
# linkedin-url-builder.sh
# Build a LinkedIn Jobs search URL from user-prompted variables with GEO_ID lookup for specified cities.

set -eo pipefail

# ---------- GEO_ID lookup (limited to user-specified cities) ----------
declare -A GEO_MAP=(
  ["Franklin,TN"]="90000536"
  ["Nashville,TN"]="101452733"
  ["Nashville Metropolitan Area"]="105696783"
)

get_geo_id() {
  local city_state="$1"
  if [[ -n "${GEO_MAP[$city_state]}" ]]; then
    echo "${GEO_MAP[$city_state]}"
  else
    echo ""
  fi
}

# ---------- Prompt for user input ----------
read -p "Enter job keywords (e.g., 'implementation specialist'): " KEYWORDS
KEYWORDS=${KEYWORDS:-"implementation specialist"}

while true; do
  read -p "Enter city and state (e.g., 'Franklin,TN'; options: Franklin,TN=90000536, Nashville,TN=101452733, Nashville Metropolitan Area=105696783): " CITY_STATE
  CITY_STATE=${CITY_STATE:-""}
  
  # Check if input is numeric (likely a geoId)
  if [[ "$CITY_STATE" =~ ^[0-9]+$ ]]; then
    echo "Detected numeric input. Using '$CITY_STATE' as GEO_ID directly."
    GEO_ID="$CITY_STATE"
    break
  fi
  
  # Try to get GEO_ID from city/state
  GEO_ID=$(get_geo_id "$CITY_STATE")
  if [[ -n "$GEO_ID" ]]; then
    break
  else
    echo "ERROR: No GEO_ID found for '$CITY_STATE'. Use one of: Franklin,TN, Nashville,TN, Nashville Metropolitan Area, or enter a geoId manually."
    read -p "Enter LinkedIn geoId manually (e.g., '90000536' for Franklin,TN): " GEO_ID
    GEO_ID=${GEO_ID:-""}
    if [[ -n "$GEO_ID" ]]; then
      break
    fi
  fi
done

read -p "Enter search radius in miles (e.g., '25', press Enter to omit): " DISTANCE_MILES
DISTANCE_MILES=${DISTANCE_MILES:-""}

read -p "Enter time posted in hours (e.g., 24 for past 24h, 168 for past week, 720 for past month, press Enter to omit): " TPR_HOURS
if [[ -n "$TPR_HOURS" ]]; then
  TPR_SECONDS=$((TPR_HOURS * 3600))
else
  TPR_SECONDS=""
fi

read -p "Enter experience levels (comma-separated, 1=Intern, 2=Entry, 3=Associate, 4=Mid-Senior, 5=Director, 6=Executive, e.g., '2,3,4', press Enter to omit): " EXPERIENCE
EXPERIENCE=${EXPERIENCE:-""}

read -p "Enter job types (comma-separated, F=Full-time, P=Part-time, C=Contract, T=Temporary, I=Internship, V=Volunteer, O=Other, e.g., 'F,C', press Enter to omit): " JOB_TYPES
JOB_TYPES=${JOB_TYPES:-"F,C"}

read -p "Enter work types (comma-separated, 1=On-site, 2=Hybrid, 3=Remote, default '1,2,3' for all, press Enter for default): " WORK_TYPES
WORK_TYPES=${WORK_TYPES:-"1,2,3"}

echo "Salary bucket options: 3=$80k+, 4=$100k+, 5=$120k+, 6=$140k+, 7=$160k+, 8=$180k+, 9=$200k+ (varies by region)"
read -p "Enter salary bucket (e.g., '3' for $80k+, press Enter for default '3'): " SALARY_BUCKET
SALARY_BUCKET=${SALARY_BUCKET:-"3"}

read -p "Enter sort order (R=Relevance, DD=Date newest, default 'R'): " SORT_BY
SORT_BY=${SORT_BY:-"R"}

read -p "Enter current job ID (press Enter to omit): " CURRENT_JOB_ID
CURRENT_JOB_ID=${CURRENT_JOB_ID:-""}

read -p "Enter refresh (true or press Enter to omit): " REFRESH
REFRESH=${REFRESH:-""}

read -p "Enter origin (e.g., 'JOB_SEARCH_PAGE_JOB_FILTER', press Enter to omit): " ORIGIN
ORIGIN=${ORIGIN:-""}

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