# 07 · Engine & Runtime

The technical foundation, kept deliberately lean so the horror, not the tech, is the hard part.

!!! info "Source"
    Written from `project.godot` and the player/gun/room scripts. Controls, autoloads, and layers below are the current project settings.

## Stack

| Layer | Choice |
|---|---|
| Engine | **Godot 4.6**, Forward+ |
| Rendering device | **D3D12** on Windows |
| Physics | **Jolt Physics** (with physics interpolation on) |
| Display | 1920 × 1080, fullscreen |
| Post | Film grain, vignette, subtle chromatic aberration |

## Autoload singletons

Four globals carry cross-scene state (`[autoload]` in `project.godot`):

| Autoload | Responsibility |
|---|---|
| **PartRegistry** | Source of truth for gun parts, indexed by state (World / Inventory / Assembled). |
| **PlayerInventory** | The persistent 12 × 8 = 96-slot part grid. |
| **RoomGraph** | Static door topology: every `slot:direction` edge and each slot's scene paths. |
| **RoomManager** | Runtime room streaming, alignment, nav-baking, transitions, and level scaling. |

## Physics layers

Three 3D layers keep hits clean:

| Layer | Name | Used by |
|---|---|---|
| 1 | **World** | Geometry, furniture: blocks line of sight. |
| 2 | **Enemy** | Enemy bodies. |
| 3 | **Player** | The player capsule. |

The gun's hit mask targets World + Enemy so shots hit enemies and walls but never the player.

## Controls

First-person, mapped in the input map:

| Input | Action | |
|---|---|---|
| **W A S D** | Move | |
| **Space** | Jump | |
| **Shift** | Sprint | ×1.5 speed |
| **Shift + Space** | **Dash** | Directional burst: see below |
| **LMB** | Fire | |
| **E** | Interact | Open the focused door |
| **I** | Toggle inventory | 96-slot grid |
| **O** | Place gun | Drop to top-down workbench view |
| **Esc** | Toggle mouse capture | |

## Player movement & health

From `Scripts/Player/player.gd`:

| Property | Value |
|---|---|
| Walk speed | 5 m/s |
| Sprint multiplier | ×1.5 |
| Jump velocity | 4.5 m/s |
| **Dash** | 18 m/s burst · 0.18 s · 0.8 s cooldown |
| Max HP | 100 |
| Mouse sensitivity | 0.003 rad/px · pitch clamped ±89° |

The **dash** (Shift + tap Space) is a flat burst along the current move direction. Strafes drive a horizontal screen smear, forward/back a radial one (the `dash_blur` shader). Health runs through `take_damage()` / `heal()` / `revive()`, drives the HUD orb (`hp_ratio`), and emits `health_changed` / `died`. Any attacker deals damage reference-free:

```gdscript
get_tree().call_group(&"player", &"take_damage", amount)
```

---

!!! info "Legacy note"
    This page is a modernized, readable presentation of the GDD's tech section reconciled against the current build. Where the running project and this page disagree, the project wins. File a fix on the [Editing Guide](editing.md) terms.
