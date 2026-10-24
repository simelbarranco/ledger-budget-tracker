#!/usr/bin/env bash
# Creates the GitHub repo, enables Pages (Actions source) and pushes.
# Requires GitHub CLI: https://cli.github.com  (run `gh auth login` once first)
set -euo pipefail
REPO=ledger-budget-tracker
OWNER=$(gh api user -q .login)
gh repo create "$REPO" --public --description "Budget, savings and expense tracker"
git init -b main
git add .
git commit -m "Initial commit: Ledger budget tracker"
git remote add origin "https://github.com/$OWNER/$REPO.git"
gh api -X POST "repos/$OWNER/$REPO/pages" -f build_type=workflow
git push -u origin main
echo "Deploying... live in about a minute at https://$OWNER.github.io/$REPO/"
