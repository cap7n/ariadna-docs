# 05 · Modular Gun System

> Assemble the weapon yourself. Stats update live as parts snap into place.

Power in Ariadna is **crafted**, not looted whole. The player scavenges components across rooms and builds guns from parts, watching the combined stats shift as pieces change.

!!! info "Source"
    Written from `Scripts/Gun/` and `Scripts/Inventory/`. Parts, stats, and slot counts below are what the code defines today.

## Components

Five slot types (`GunPartType`). The **Body** is the spine — every other part attaches to it:

| Part | Slot | Role |
|---|---|---|
| **Body** | `BODY` | The spine / chassis everything attaches to |
| **Handle** | `HANDLE` | Grip |
| **Barrel** | `BARREL` | — |
| **Stock** | `STOCK` | — |
| **Sight** | `SIGHT` | — |

Each part variant is authored as a `.tres` resource (`GunPartData`) so many versions of a slot can exist — "long barrel," "iron sight," and so on — each with its own stat contribution and mesh.

## Stats

Parts contribute **additively** to four combined stats (`GunStats`). A missing part just contributes zero:

| Stat | Meaning |
|---|---|
| **Damage** | Extra damage per shot. |
| **Accuracy** | Higher = tighter spread. |
| **Recoil** | Higher = more kick per shot. |
| **Weight** | Arbitrary units — reserved for movement penalties. |

!!! warning "It's *weight*, not range"
    The current build tracks **damage / accuracy / recoil / weight**. An earlier GDD listed "range"; the code doesn't. Weight is wired as a stat but its movement penalty isn't hooked up yet.

## Assembly flow

The workbench is diegetic — you don't open a menu, you **put the gun down and work on it**:

1. Press **`O` (place gun)** — the camera tweens to a **top-down view** over the drop point and the player freezes.
2. Open the **inventory (`I`)** — a **12 × 8 = 96-slot** grid slides in; the 3D view shifts right so parts and gun stay visible.
3. **Tinker with the mouse** (`MousePartInteractor`) — drag parts between the world, the inventory, and the gun. The gun rejects parts in the wrong slot.
4. A stat overlay previews the **live combined stats** as parts change.
5. Pick the gun back up — the camera tweens back to first-person.

Each part tracks one of three states, so systems can query e.g. "every loose Barrel":

```
  WORLD  ◀──▶  INVENTORY  ◀──▶  ASSEMBLED
 (dropped)     (96 slots)      (on the gun)
```

## Design intent

The assembly should feel **ritualistic** — metalwork, focused lighting, negative space — rather than a stat dropdown. The fantasy is a woman methodically building the tool that lets her survive one more return into the maze.

---

!!! info "Where the numbers live"
    Stat weightings are authored per part in the `.tres` variants and combined by `Gun.get_stats()`. Treat any numbers elsewhere in this wiki as intent; the parts are the source of truth.
