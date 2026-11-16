---
description: Read a handover document, implement the planned steps iteratively, and create atomic git commits per step
---

You are implementing the changes outlined in a handover document.

## 1. Locate and Read the Handover
- If "$ARGUMENTS" is non-empty:
  - Check if "$ARGUMENTS" points directly to a file, or locate `<project_root_directory>/opencode/handovers/$ARGUMENTS` (append `.md` if omitted).
- Otherwise:
  - Find and read the most recent handover file in `<project_root_directory>/opencode/handovers/`.

## 2. Review and Plan
1. Read the handover document and extract:
   - **Objective & Context**
   - **Current State**
   - **Next Steps & TODOs**
2. Inspect the relevant files in the repository to confirm the current state matches the handover.
3. Present a numbered checklist of discrete, atomic implementation steps to the user before starting.

## 3. Iterative Execution & Commits
Execute the plan step by step. For each step:
1. **Implement**: Apply only the changes needed for this specific step.
2. **Verify**: Run relevant tests, linters, or typechecks to ensure the changes are correct and don't break existing functionality.
3. **Commit**:
   - Stage only the relevant files (`git add <files>`). Never use `git add -A` or include untracked scratch files.
   - Commit using Conventional Commits format (e.g., `feat: ...`, `fix: ...`, `test: ...`, `refactor: ...`).
   - Ensure the commit leaves the repository in a clean, working state.
4. **Report**: Briefly summarize what was completed, including the commit hash and message, before moving to the next step.

## Rules & Constraints
- **Atomic commits**: Every commit should represent a single logical unit of work.
- **Never guess on ambiguity**: If you encounter contradictory requirements, edge cases not covered by the handover, or unexpected failures, pause and ask the user.
- **Scope discipline**: Do not refactor or reformat unrelated files outside the scope of the handover task.
