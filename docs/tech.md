# 07 · Engine & Runtime

The technical foundation, kept deliberately lean so the horror — not the tech — is the hard part.

## Stack

| Layer | Choice |
|---|---|
| Engine | **Godot 4.6** |
| Renderer | **Forward+** (D3D12 on Windows) |
| Physics | **Jolt Physics** |
| Post | Film grain, vignette, subtle chromatic aberration |

Forward+ with D3D12 gives the lighting headroom for the clinical-to-oppressive lighting shifts; the post stack (grain, vignette, light chromatic aberration) glues the low-poly look into a single cohesive image.

## Core runtime systems

Five systems carry the moment-to-moment game:

| System | Responsibility |
|---|---|
| **PartRegistry** | Source of truth for gun parts and their stats |
| **PlayerInventory** | The 96-slot part storage and part state |
| **GunHolder** | The assembled weapon the player is holding |
| **MousePartInteractor** | Workbench interaction — pick, drag, snap |
| **Room Generator** | Runtime room materialization and level scaling |

## Controls

First-person plus workbench interaction:

| Input | Action |
|---|---|
| **WASD** | Move |
| **Space** | Jump |
| **Shift** | Dash / sprint |
| **LMB** | Fire / interact |
| **I** | Inventory |
| **O** | Workbench |
| **Escape** | Pause / back out |

---

!!! info "Legacy note"
    This page is a modernized, readable presentation of the GDD's tech section adapted to the current build. Where the running project and this page disagree, the project wins — file a fix on the [Editing Guide](editing.md) terms.
