# Create Commit

## Overview
Create a well-structured commit following the Conventional Commits specification for clear, semantic commit messages.

## Steps
1. **Stage changes**
   - Review changes with `git diff`
   - Stage relevant files with `git add`
   - Verify staged changes with `git diff --cached`

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