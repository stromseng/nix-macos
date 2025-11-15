# Commit Staged

## Overview
Create a well-structured commit for the currently staged changes following the Conventional Commits specification.

**Important: This command assumes files are already staged.** Use `git status` to verify staged changes before proceeding.

## Steps
1. **Review staged changes**
   - Check staged files and diff: `git status && git diff --cached`
   - Verify this is exactly what should be committed

2. **Write commit message**
   - Follow format: `<type>[optional scope]: <description>`
   - Use present tense, imperative mood
   - Keep description under 50 characters
   - Add body if needed (wrap at 72 characters)

3. **Commit types**
   - `feat`: new feature
   - `fix`: bug fix
   - `docs`: documentation changes
   - `style`: formatting, missing semicolons, etc.
   - `refactor`: code change that neither fixes bug nor adds feature
   - `test`: adding or updating tests
   - `chore`: maintenance tasks, dependency updates

4. **Create commit**
   - Use `git commit -m "type: description"`
   - Or `git commit` for multi-line messages
   - Add `!` after type for breaking changes
   - Example: `feat!: remove deprecated API endpoint`

## Important Notes
- **Do NOT stage additional files** - only commit what's already staged
- If the staged changes should be split into multiple commits, inform the user and suggest using `git reset HEAD <file>` to unstage files that should be in a separate commit

