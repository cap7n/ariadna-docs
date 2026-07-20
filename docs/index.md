---
title: Home
---

# Ariadna Design Wiki

<p class="hero-pitch">
A single-player, first-person sci-fi horror game. A young woman is trapped inside a labyrinth spun from her own trauma — rooms that materialize as she enters them and grow crueler every time she returns.
</p>

Ariadna kills her adoptive father and finds the facility around her folding into an impossible maze. There is no clean way out: the corridors loop, the rooms level up on every visit, and her father keeps coming back — larger, stranger, harder — until she is ready to face the thing at the center.

The design rests on three ideas: **tension through escalation**, **crafted power through modular guns**, and **psychological weight** carried by the rooms, the enemies, and the boss.

## Core identity

- **Genre** — single-player, first-person sci-fi horror.
- **Loop** — *Enter → Survive → Collect → Return stronger.* Rooms don't exist until you walk into them, and each one remembers how many times you've been there.
- **Power** — a modular gun system: scavenge parts, assemble them on a workbench, watch the stats update live.
- **Pressure** — a recurring boss (the father) fought across six escalating tiers that never reset once cleared.
- **Tone** — low-poly retro, film grain, oppressive contrast. Fear-red, rust-amber, cold-memory tones, and dark voids.

## Project status

| Area | State | Notes |
|---|---|---|
| Modular gun system | <span class="pill wip">In progress</span> | Body + Handle required; Barrel / Stock / Sight optional. Live stats. |
| Room streaming | <span class="pill wip">Prototype</span> | Pre-spawned neighbors, nav-baked, door graph with wrap edges; levels 1–5. |
| Enemies | <span class="pill wip">In progress</span> | Four archetypes on a shared FSM + utility AI. Only the slammer deals damage so far. |
| Core loop | <span class="pill todo">Next</span> | Enter / Survive / Collect / Return needs to be playable end-to-end. |
| Boss v1 | <span class="pill todo">Planned</span> | Six-tier escalation, tier never resets. |
| Environment & art | <span class="pill wip">Moodboard</span> | Clinical → oppressive transition, moodboard locked. |
| Engine | <span class="pill done">Locked</span> | Godot 4.6, Forward+ (D3D12), Jolt Physics. |

## Where to start

<div class="grid cards" markdown>

- :material-pillar: **[Design Pillars](pillars.md)**

    The three commitments every feature is measured against.

- :material-book-open-page-variant: **[Narrative](narrative.md)**

    Ariadna, Oliwier Brytol, the labyrinth, and the fish.

- :material-refresh: **[Core Loop](loop.md)**

    Enter, survive, collect, return stronger.

- :material-pistol: **[Modular Guns](guns.md)**

    Five part types, a workbench, and live stats.

- :material-skull: **[Enemies](enemies.md)**

    Four archetypes, one shared FSM and utility brain.

</div>

---

!!! quote ""
    This wiki records decisions — it doesn't replace making them. If a page and the game disagree, the game is right and the page is stale; fix the page.
