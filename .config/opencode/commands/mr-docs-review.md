---
description: Analyze repo docs to understand the next MR's goal and find gaps (security, bugs, tests, ...)
---

You are reviewing the documentation of this repository to prepare the next merge request (MR).
Do NOT modify any files. This is an analysis only.

## MR goal (provided by the user)
$ARGUMENTS

If the above is empty, infer the goal from the branch name, recent commits, and any roadmap, TODO, ticket, or spec documents. State clearly that it is inferred and your confidence level.

## Repository context
Current branch and recent history:
!`git branch --show-current 2>/dev/null; git log --oneline -15 2>/dev/null || true`

Uncommitted / branch changes so far:
!`git status --short 2>/dev/null; git diff --stat main...HEAD 2>/dev/null || git diff --stat master...HEAD 2>/dev/null || true`

Documentation files found:
!`git ls-files '*.md' '*.mdx' '*.rst' 'docs/**' 'doc/**' 2>/dev/null | head -100 || true`

## Steps
1. Read the relevant docs (README, docs/, ADRs, specs, CHANGELOG, CONTRIBUTING, SECURITY.md, and anything related to the goal). Skim the code only when needed to verify a claim made in the docs.
2. Write a clear one-paragraph statement of what the next MR must achieve, plus its scope and non-goals.
3. Identify what the docs already state that applies to this MR (requirements, constraints, conventions).
4. Check the documentation for MISSING or WEAK coverage in these areas, specifically as they relate to the MR:
   - **Security**: authn/authz, input validation, secrets handling, data exposure, dependencies, threat model
   - **Bugs & edge cases**: known issues, failure modes, race conditions, error handling, limits
   - **Testing**: expected unit/integration/e2e coverage, acceptance criteria
   - **Migration & rollout**: data migrations, backward compatibility, feature flags, rollback plan
   - **Operations**: logging, monitoring, performance, config/env changes
   - **Docs themselves**: outdated, contradictory, or undocumented behavior that this MR will touch

## Output format
1. **MR Goal**: statement of the goal, scope, non-goals (and confidence if inferred).
2. **Relevant Existing Documentation**: file paths with a one-line takeaway each.
3. **Gaps & Risks**: a markdown table with columns: `Area` | `Gap / Concern` | `Severity (High/Med/Low)` | `Evidence (file:line or "absent")`.
4. **Open Questions**: blockers or ambiguities to resolve before implementation.
5. **Suggested MR Checklist**: ordered, actionable tasks (including what docs must be updated as part of the MR).

Rules:
- Clearly separate what the documentation STATES from what you INFER.
- Cite file paths for every claim.
- Do not invent requirements. If something is unknown, place it in Open Questions.
