# Anti-Patterns to Avoid

Date: 2026-05-17

## Governance Anti-Patterns

- Treating remote GitHub state as primary truth when local repos are dirty or ahead in working-tree cognition.
- Claiming readiness upgrades from bounded synthetic passes.
- Updating one governance file without synchronizing the governance set.
- Rewriting historical failures instead of preserving fail->fix->rerun lineage.

## Architecture Anti-Patterns

- Blurring NVIDIA and ABW source boundaries.
- Expanding bridge mutation surface before read-only/trust evidence is fully stable.
- Assuming UI-level hiding/restriction equals backend security boundary.

## Operational Anti-Patterns

- Resetting/cleaning dirty work by default.
- Silent file mutation without explicit audit trace.
- Counting smoke/test pass as full-system readiness proof.
- Interpreting uncommitted local sprint work as accepted milestone closure.

## Evidence Anti-Patterns

- Overweighting README prose over tests, diffs, and runtime artifacts.
- Hiding warnings (for example inline smoke warning) to preserve a cleaner narrative.
- Using optimistic language that outruns observed source/test state.

