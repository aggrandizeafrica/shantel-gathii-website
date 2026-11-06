#!/usr/bin/env bash
# Builds the standalone site (index.html) from page.html (the artifact preview source).
set -euo pipefail
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  printf '<meta name="theme-color" content="#e5333b">\n<link rel="icon" href="favicon.svg" type="image/svg+xml">\n'
  printf '<meta property="og:title" content="Shantel &amp; Gathii | Insurance &amp; Financial Solutions">\n<meta property="og:description" content="Protect. Plan. Prosper. Insurance and financial guidance in Nairobi, Kenya.">\n<meta property="og:image" content="images/shantel-hero.jpg">\n<meta property="og:type" content="website">\n'
  sed -n '1,/<\/style>/p' page.html
  printf '</head>\n<body>\n'
  sed '1,/<\/style>/d' page.html
  printf '</body>\n</html>\n'
} > index.html
