---
description: Generate summary, save it to $OPENCODE_NOTES, and copy to clipboard
---

Generate a summary of the previous discussion.



Determine the target filename:
- If "$ARGUMENTS" is non-empty, use "$ARGUMENTS" (append `.md` if omitted).
- Otherwise, slugify the current session title (or topic) followed by `.md` (e.g. `test-summary-command.md`).

Save the summary file to:
{env:OPENCODE_NOTES}/<filename>

After writing the file, copy its contents to the clipboard using pbcopy:
cat "{env:OPENCODE_NOTES}/<filename>" | pbcopy
