# Smart Commit

## Overview
Intelligently analyze unstaged changes and create one or more well-structured commits following the Conventional Commits specification. Determine the best way to group related changes into logical, atomic commits.

## Philosophy
- **Atomic commits**: Each commit should represent a single logical change
- **Related changes together**: Group changes that serve the same purpose
- **Separate concerns**: Split unrelated changes into different commits
- **Meaningful history**: Create a clean, understandable git history

## Steps
1. **Analyze changes**
   - Review all unstaged changes: `git diff`
   - Review all untracked files: `git status`
   - Identify logical groupings of related changes
   - Determine if changes should be split into multiple commits

2. **Plan commits**
   - Decide how many commits are needed
   - Group related files together
   - Order commits logically (dependencies first)
   - Consider which changes might be breaking

3. **Stage and commit iteratively**
   - For each logical group:
     - Stage relevant files: `git add <files>`
     - Verify staged changes: `git diff --cached`
     - Create commit with appropriate message
     - Repeat for next group

4. **Commit message format**
   - Follow format: `<type>[optional scope]: <description>`
   - Use present tense, imperative mood
   - Keep description under 50 characters
   - Add body if needed (wrap at 72 characters)

5. **Commit types**
   - `feat`: new feature
   - `fix`: bug fix
   - `docs`: documentation changes
   - `style`: formatting, missing semicolons, etc.
   - `refactor`: code change that neither fixes bug nor adds feature
   - `test`: adding or updating tests
   - `chore`: maintenance tasks, dependency updates

6. **Execute commits**
   - Use `git commit -m "type: description"`
   - Or `git commit` for multi-line messages
   - Add `!` after type for breaking changes
   - Example: `feat!: remove deprecated API endpoint`

## Examples

### Single commit scenario
All changes relate to one feature:
```bash
git add src/search.ts src/components/SearchBar.tsx
git commit -m "feat(search): add product search functionality"
```

### Multiple commits scenario
Changes span different concerns:
```bash
# First commit: Fix a bug
git add src/auth/session.ts
git commit -m "fix(auth): resolve token expiration issue"

# Second commit: Add new feature
git add src/search.ts src/components/SearchBar.tsx
git commit -m "feat(search): add product search"

# Third commit: Update docs
git add README.md
git commit -m "docs: update search feature documentation"
```