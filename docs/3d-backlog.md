# 3D Backlog

> 3D art, tech art, and scene implementation tasks. Design decisions live in [Backlog](backlog.md).

Legend: <span class="pill wip">WIP</span> in progress · <span class="pill todo">Todo</span> not started · <span class="pill risk">Risk</span> needs decision · <span class="pill done">Done</span> shipped.

## Gun system

- <span class="pill wip">WIP</span> Workbench: drag, snap-to-slot, live stat updates (3D interaction).
- <span class="pill todo">Todo</span> 96-slot part inventory 3D layout.
- <span class="pill todo">Todo</span> Part-state transitions: World pickup → Inventory UI → Assembled gun.

## Room system

- <span class="pill todo">Todo</span> Author level 2–5 variants for all 16 room slots (geometry, lighting, props).
- <span class="pill todo">Todo</span> Room transition effects (door animations, particle wipes, lighting shifts).
- <span class="pill todo">Todo</span> Non-Euclidean portal VFX (color-coded, shimmer, distortion).

## Enemies

- <span class="pill todo">Todo</span> Charger model, rig, animations (charge windup, impact, stagger).
- <span class="pill todo">Todo</span> Kiter model, rig, animations (strafe, projectile spawn, hit reaction).
- <span class="pill todo">Todo</span> Ambusher model, rig, animations (cloak/uncloak, lunge, retreat).
- <span class="pill todo">Todo</span> Slammer model, rig, animations (overhead slam, shockwave, recovery).
- <span class="pill todo">Todo</span> Shared hit FX: blood, impact decals, knockback dust, screen shake.

## Boss

- <span class="pill todo">Todo</span> Boss base model + 6 tier progression variants (scale, armor, corruption).
- <span class="pill todo">Todo</span> Boss arena: 6 tier layouts with escalating hazards.
- <span class="pill todo">Todo</span> Boss VFX per tier: phase transitions, telegraphs, death sequence.

## Environment

- <span class="pill wip">WIP</span> Clinical → oppressive material pass (tiles, walls, lights, decals).
- <span class="pill todo">Todo</span> Prop kit: medical, industrial, organic-corrupted variants per tier.
- <span class="pill todo">Todo</span> Lighting scenarios per room level (1–5): clinical → flickering → red-alert → void.

## Tech art

- <span class="pill todo">Todo</span> LODs + impostors for room clusters.
- <span class="pill todo">Todo</span> NavMesh baking pipeline for procedural neighbors.
- <span class="pill todo">Todo</span> GPU-driven instancing for repeated props.