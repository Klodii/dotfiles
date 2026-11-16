---
description: Sync docs/STATUS.md and milestone checklists with the latest git commits
---

You are updating repository documentation and checklists to reflect recent commits.

## Recent Git Activity
!`git log -n 12 --oneline`
!`git status --short`

## Steps
1. **Source of Truth First**:
   - Inspect `docs/STATUS.md` to see the last documented commit and state.
   - Do NOT scan all directories or read all historical markdown files.
2. **Identify Recent Commits**:
   - Compare the git log with `docs/STATUS.md` to find new commits that have not yet been documented.
3. **Update Docs**:
   - Update `docs/STATUS.md`:
     - Update the "Last Updated" date and commit hash.
     - Add entries to the "Recent Commits Log" table.
     - Update MR status (`Done`, `In Progress`, `Next`).
   - If a commit fulfills acceptance criteria of an active MR spec (e.g. `docs/milestone-X/mr-X.Y-*.md`), update only that specific MR file to check the completed boxes (`- [x]`).
   - Do NOT read or modify completed milestone folders or historical handovers.
4. **Summary**:
   - Output a concise summary of the documentation updates made and any updated checklist items.
