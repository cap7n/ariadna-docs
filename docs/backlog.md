# 11 · Backlog

> The list of things to build — *lista zadań do realizacji*. Grouped by milestone, newest priorities at the top of each group.

Legend: <span class="pill wip">WIP</span> in progress · <span class="pill todo">Todo</span> not started · <span class="pill risk">Risk</span> needs a decision · <span class="pill done">Done</span> shipped.

## Gun system

- <span class="pill wip">WIP</span> Workbench: drag, snap-to-slot, live stat updates.
- <span class="pill todo">Todo</span> Part-state transitions: World → Inventory → Assembled.
- <span class="pill todo">Todo</span> 96-slot part inventory UI.
- <span class="pill risk">Risk</span> Final stat weightings per part (damage / accuracy / recoil / range).

## Room system

- <span class="pill wip">WIP</span> Runtime room materialization on entry.
- <span class="pill wip">WIP</span> Per-room level tracking and scaling of enemies / hazards.
- <span class="pill todo">Todo</span> Color-coded portal navigation (non-Euclidean wrapping).
- <span class="pill todo">Todo</span> 16-room cluster layout (NW / NE / SW / SE) + central boss arena.

## Core loop

- <span class="pill todo">Todo</span> End-to-end Enter → Survive → Collect → Return playable.
- <span class="pill todo">Todo</span> Reward payout: gun parts + narrative fragments on clear.
- <span class="pill risk">Risk</span> Revisit reward curve — better loot vs. runaway difficulty.

## Boss

- <span class="pill todo">Todo</span> Boss v1: six-tier escalation, persistent tier.
- <span class="pill todo">Todo</span> Tier-gating so players can't softlock into an unbeatable tier.

## World & polish

- <span class="pill wip">WIP</span> Environment moodboard → in-engine material pass.
- <span class="pill todo">Todo</span> Post stack: film grain, vignette, chromatic aberration tuning.
- <span class="pill todo">Todo</span> Audio pass.
- <span class="pill todo">Todo</span> Performance pass (Forward+ / D3D12).

---

!!! note "Source"
    The original GDD deck left this section as *"Treść wkrótce"* (content coming soon). The items above are derived from the [Scope](scope.md) milestone path and the systems described across the wiki. Keep this list honest — move things to <span class="pill done">Done</span> only when they're actually in the build.
