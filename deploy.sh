#!/bin/bash
# Publish the site: copy the files to the shared server, where the web server serves them as
# trofimchuk.com (moved off GitHub Pages 2026-10-02). Run after merging to main.
set -euo pipefail
cd "$(dirname "$0")"
HOST="${SITE_HOST:-appadmin@49.13.88.157}"
KEY="${SITE_KEY:-$HOME/.ssh/tracker-heroku-exit}"
rsync -az --delete --exclude .git --exclude .claude --exclude CNAME --exclude deploy.sh --exclude README.md \
  -e "ssh -i $KEY -o BatchMode=yes" ./ "$HOST:/opt/selectic-heroku-exit/sites/trofimchuk.com/"
echo "published: https://trofimchuk.com/"
