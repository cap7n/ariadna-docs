# 03 · Rooms

The map is **16 main rooms** in four clusters, a **central boss arena**, and **four hallways** that connect the clusters to the boss, all stitched together by a hand-authored door graph.

!!! info "Source"
    Written from `Scripts/Rooms/` (`room_graph.gd`, `room_manager.gd`). The layout and streaming below are what the code actually does today.

## Layout

Four clusters of four rooms each make up the sixteen main rooms, named by cluster and index (`nw1…nw4`, `ne1…ne4`, `sw1…sw4`, `se1…se4`):

| Cluster | Slots | Role |
|---|---|---|
| **NW** | `nw1`–`nw4` | Cluster of four |
| **NE** | `ne1`–`ne4` | Cluster of four |
| **SW** | `sw1`–`sw4` | Cluster of four |
| **SE** | `se1`–`se4` | Cluster of four |
| **Boss** | `boss` | Central arena |
| **Hallways** | `hall_left/right/top/bot` | Connect clusters → boss |

```
   NW ─── NE
    │  ╳  │        ╳ = central boss arena, reached through the 4 hallways
   SW ─── SE
```

## Navigation: a wrap-around door graph

There is no free-roam overworld. Every doorway is an explicit edge in a **bidirectional graph** (`RoomGraph`), keyed `slot:direction` (e.g. `nw1:e`). Three kinds of edge build the map's unstable geometry:

- **Within-cluster** (16 edges): the four rooms of each cluster wired to each other.
- **Edge wraps** (8 edges), the map folds on itself: a room's **north** door can open into another cluster's **south**, its **west** into another's **east**. Walking "up" can drop you across the map.
- **Cross-gap** (4 edges): extra links jumping between clusters.
- **Hallways → boss** (8 + 4 edges): clusters feed four hallways, and each hallway opens onto one side of the boss arena.

The wrap and cross-gap edges are what give Ariadna its **non-Euclidean, psychologically unstable** feel; the space doesn't add up to a clean grid, and a room you "left" can be waiting through the next door.

!!! note "Portals vs. the graph"
    The original GDD framed this as *color-coded portals*. In the build the same disorientation is delivered by the wrap-around door graph above: no separate portal objects. If literal portals come back, they'd be authored as extra graph edges.

## Streaming

Rooms don't exist until they're needed. When a room becomes **current**, the RoomManager asynchronously, one at a time:

1. Loads and instances each graph-adjacent room.
2. Aligns it **back-to-back at the shared doorway** (with a wall-gap nudge so walls seat flush).
3. **Bakes its navigation mesh.**
4. **Spawns its enemies**, so the room is populated *before* you can walk in.

By the time you reach a door, the destination is already sitting in world space. The transition itself is just an animated walk-through: no load hitch. Only the current room's doors are active; neighbor doors are invisible phantoms so each shared doorway shows exactly one slab.

## The door locks behind you

When you cross into a new room, the door you came through **locks**: *you can't immediately backtrack the way you came*. It's released on your next transition, so you can still loop back around through a different path. Combined with rooms that level up on every visit, this keeps you moving forward into escalating danger rather than farming one safe doorway.

## Levels

Every main slot has **five level variants** (`room_<slot>_lv1…lv5.tscn`). On entry the level is `clamp(visits + 1, 1, 5)`: first visit loads level 1, and it climbs to a cap of 5 with repeat visits. **Hallways have no level variants**: they're fixed connective scenes.

| | Levels? | Scaling |
|---|---|---|
| Main rooms & boss | 1 → 5 | `clamp(visits+1, 1, 5)` |
| Hallways | None | Fixed |

---

!!! note "Authoring rooms"
    Rooms are authored as scenes so artists own lighting, materials, and layout directly in the editor. Each level variant is its own scene file. Streaming, alignment, nav-baking, enemy spawning, and door locking are all handled by the RoomManager at runtime.
