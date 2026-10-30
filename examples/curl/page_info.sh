#!/usr/bin/env bash
# PagesJaunes Page Info API – cURL example
# Usage: PILOTERR_API_KEY=your-key ./page_info.sh
set -euo pipefail

curl -sS -G "https://api.piloterr.com/v2/pagesjaunes/page/info" \
  -H "x-api-key: ${PILOTERR_API_KEY}" \
  --data-urlencode query=https://www.pagesjaunes.fr/pros/56824689
