---
description: Generate a structured handover summary for a colleague, save to $OPENCODE_NOTES, and copy to clipboard
---

Generate a clear, actionable handover summary of the discussion tailored for a colleague continuing the work.

Structure the document with these sections:
- **Objective & Context**: High-level goal and background.
- **Key Decisions**: Decisions made and rationale.
- **Current State**: What has been implemented, tested, or investigated so far.
- **Next Steps & TODOs**: Immediate priorities, edge cases to watch for, and code pointers.
- **Examples / References**: Code snippets, commands, or documentation links if relevant.

Determine the target filename:
- If "$ARGUMENTS" is non-empty, use "$ARGUMENTS" (append `.md` if omitted).
- Otherwise, slugify the current session title (or topic) followed by `.md` (e.g. `test-summary-command.md`).

Save the summary file to:
{env:OPENCODE_NOTES}/handover/<filename>

After writing the file, copy its contents to the clipboard using pbcopy:
cat "{env:OPENCODE_NOTES}/handover/<filename>" | pbcopy
