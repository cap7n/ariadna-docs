# 04 · Enemies

> Four archetypes, one shared brain. Each reads as a distinct threat, but they all run the same five-state machine underneath.

!!! info "Source"
    This page is written from the shipped enemy scripts (`Scripts/Enemies/`, `Scripts/AI/`). Numbers are current defaults and are tuned in the scenes — treat them as the state of the build, not fixed design law.

## The shared FSM

Every enemy — base `Enemy` (`CharacterBody3D`) — runs the same loop:

```
IDLE ──▶ REPOSITION ──▶ WINDUP ──▶ ATTACK ──▶ RECOVER
  ▲                                              │
  └──────────────────────────────────────────────┘
```

| State | Meaning |
|---|---|
| **IDLE** | No player in sight — stand still. |
| **REPOSITION** | Move into a favourable spot (chase / kite / hide / close in). |
| **WINDUP** | Telegraph — plant and wind up so the attack reads as *fair*. |
| **ATTACK** | Commit (dash / leap / shot / lunge). |
| **RECOVER** | Cooldown before repositioning again. |

Subclasses express personality by overriding the per-state ticks (mainly `_tick_reposition`) and `_attack()`. The base handles gravity, movement, facing, perception, and health.

## Utility AI on top

Every physics frame, before the FSM ticks, the base scores three actions — **IDLE / CHASE / ATTACK** — via `EnemyUtilityScoring.pick_best()` and a per-enemy `EnemyDisposition` (default: aggressive). The winning action gates the state transitions, so behaviour is a blend of the hand-authored FSM and the live utility decision.

- **Sight-based activation.** An idle enemy only wakes when the utility system says *engage* **and** it actually has line of sight. Enemies behind walls stay dormant.
- **Provoked on hit.** Taking damage flips `provoked = true` and snaps an idler straight into REPOSITION — you can't safely shoot one and have it ignore you.

## Health & hit feedback

Shared across all enemies (`Enemy.take_damage()`):

| Property | Default | Notes |
|---|---|---|
| Max HP | 30 | Per-scene override for tankier / squishier variants. |
| Knockback | 0.5 m | Shoved away from the shooter; decays over 0.12 s. Set 0 to disable. |
| Hit flash | 0.09 s | Mesh flashes white on each hit. Set 0 to disable. |
| Damage popup | — | Floating number above the enemy (temporary playtest aid). |

The gun's raycast just calls `take_damage(amount)` on whatever it hits — enemies need no special wiring.

## The four archetypes

### :material-rotate-orbit: Charger — flying diver
Hovers on an orbit ring around the player, blinks as it winds up, then **dashes straight through the player and well past them**, picking a fresh orbit angle for the next pass. Ignores the nav mesh — it steers directly in 3D.

- Orbit radius **10 m**, hovers **2.5 m** up · telegraph **0.7 s** · dash **40 m/s**, overshoots **9 m** past the player.

### :material-bow-arrow: Kiter — ranged zoner
Holds a **preferred range of 8 m** (±1.5 m comfort band): closes when too far, backs off when crowded, and periodically plants to fire. Prefers repositioning over firing while "reloading."

- Attacks up to **12 m** · aim telegraph **0.4 s** · reload **1 s**. *(Projectile stubbed pending final ranged damage.)*

### :material-eye-off: Ambusher — lurker
Does **not** approach. Finds a spot **out of the player's sight** (a 7–14 m ring) and waits. Two things break the wait: the player wanders into **lunge range (4.5 m)** → it lunges; or the player **sees it first** → it flees to fresh cover instead of pressing the attack.

- Lunge telegraph **0.25 s** · lunge **16 m/s** · re-hides after every lunge so it can't chain-lunge. *(Melee stubbed pending final contact damage.)*

### :material-hammer: Slammer — heavy bruiser
Lumbers toward the player on the nav mesh, rears up (blinking telegraph), and **slams the ground in place**, sending an area shockwave where it stands. It closes on foot and hits in place — no leap.

- Slam range **3.5 m** · windup **0.6 s** · AoE radius **3.5 m** · **20 damage** · recover **1 s**.

!!! warning "Only the slammer bites (for now)"
    The slammer is the only archetype currently dealing damage — the kiter's shot and the ambusher's melee are stubbed until their damage paths are finalized. The telegraph/cadence for all four is already live, so they're safe to playtest for *feel* now.

---

## Spawning

Enemies are authored per room with **spawn markers** (`EnemySpawnMarker`, a `Marker3D` carrying an `enemy_scene`). When a room is pre-spawned as a neighbor and its nav mesh is baked, the RoomManager calls `spawn_enemies()` **before the player can walk in** — so the room is already populated on arrival, not spawning in front of the player. See [Rooms](rooms.md).
