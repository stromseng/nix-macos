# Create PR

## Overview
Create a well-structured pull request with proper description, labels, and reviewers.

Use git and the github cli tool.

## Steps

### 1. Prepare branch
- Ensure all changes are committed
- Push branch: `git push -u origin HEAD`
- Verify branch is up to date with main

### 2. Create PR with GitHub CLI

**IMPORTANT: Always include `--web` flag to open browser for final review and submission.**

**Basic create:**
```bash
gh pr create --title "Short, clear title" --body "Concise summary" --web
```

**Common flags:**
- `--base main`: Base branch
- `--head <branch>`: Head branch
- `--draft`: Open as draft
- `--fill`: Use commit messages for title/body
- `--body-file path/to/PR_BODY.md`: Use a prepared description
- `--label "bug,backend"`: Comma-separated labels
- `--reviewer user1,user2`: Request reviewers
- `--assignee me,user3`: Assign users
- `--web`: **REQUIRED** - Open browser to finish

**Structured body example:**
```bash
gh pr create \
  --base main \
  --title "Add search to product list" \
  --body "## Summary
- Add server-side search and debounce on client

## Motivation
- Improves discoverability and performance

## Breaking Changes
- None

Closes #123" \
  --web
```