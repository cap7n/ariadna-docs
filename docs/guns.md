# 05 · Modular Gun System

> Assemble the weapon yourself. Stats update live as parts snap into place.

Power in Ariadna is **crafted**, not looted whole. The player scavenges components across rooms and builds guns on a workbench, watching damage, accuracy, recoil, and range shift in real time as pieces change.

## Components

Five part types. Two are mandatory, three are optional trade-offs:

| Part | Required | Primarily affects |
|---|---|---|
| **Body** | ✅ Yes | Core frame — chassis for everything else |
| **Handle** | ✅ Yes | Handling / control baseline |
| **Barrel** | Optional | Damage, range |
| **Stock** | Optional | Recoil, stability |
| **Sight** | Optional | Accuracy, aim |

A Body + Handle is a working gun. Everything past that is a choice about what to sacrifice for what.

## Assembly flow

1. **Five component types** available for customization.
2. A **workbench interface** with drag, snap-to-slot, and **live stat updates**.
3. A **96-slot inventory** dedicated to storing weapon parts.
4. Three tracked states per part: **World**, **Inventory**, and **Assembled**.

```
  WORLD  ──pick up──▶  INVENTORY  ──drag to bench──▶  ASSEMBLED
   (in a room)          (96 slots)                    (live stats)
```

## Design intent

The assembly should feel **ritualistic** — metalwork, focused lighting, negative space — rather than a menu of stat bars. The fantasy is a woman methodically building the tool that lets her survive one more return into the maze.

---

!!! info "Legacy note"
    This system aligns with an earlier version of Ariadna's GDD and is presented here as a modern, readable reference for the team. Exact stat weightings live in the `PartRegistry` — treat any numbers here as intent, not gospel.
