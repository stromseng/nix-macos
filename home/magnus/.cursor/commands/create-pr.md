# Create PR

## Overview
Create a well-structured pull request with proper description, labels, and reviewers.

Use git and the github cli tool.

## Steps

### 1. Prepare branch
- Ensure all changes are committed
- Push branch: `git push -u origin HEAD`
- Verify branch is up to date with main

### 2. Review changes against main

**IMPORTANT: You MUST review the changes before creating the PR.**

Perform these steps in order:

1. **Check commit history:**
   ```bash
   git log main..HEAD
   ```

2. **Review file changes summary:**
   ```bash
   git diff main...HEAD --stat
   ```

3. **Deep dive on important changes (optional):**
   
   Based on the commit messages and file stats, identify files that seem important or complex. Examine those specific files:
   ```bash
   # View specific file changes
   git diff main...HEAD -- path/to/important/file.ext
   
   # Or view all changes (if needed)
   git diff main...HEAD
   ```

Analyze the changes thoroughly and use this information to write an accurate, informative PR description that explains what changed and why.

### 3. Create PR with GitHub CLI

**IMPORTANT: Always include `--web` flag to open browser for final review and submission.**

**PR Title Format:**

Titles MUST follow conventional commit standards:
```
<type>(<scope>): <description>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style/formatting
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Test changes
- `build`: Build system changes
- `ci`: CI/CD changes
- `chore`: Maintenance tasks

**Examples:**
- `feat(search): add debounced search to product list`
- `fix(auth): resolve token expiration issue`
- `docs(readme): update installation instructions`

**Basic create:**
```bash
gh pr create --title "feat(search): add product search functionality" --body "Concise summary" --web
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
  --title "feat(product): add search with debouncing" \
  --body "## Summary
- Add server-side search and debounce on client

## Motivation
- Improves discoverability and performance

## Breaking Changes
- None

Closes #123" \
  --web
```