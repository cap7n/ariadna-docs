# 03 · Rooms

The map is built from **17 rooms**: sixteen combat/exploration rooms arranged in four clusters, plus one central boss arena.

## Layout

Four clusters of four rooms each make up the sixteen non-boss rooms:

| Cluster | Rooms | Role |
|---|---|---|
| **NW** | 4 | Cluster of four |
| **NE** | 4 | Cluster of four |
| **SW** | 4 | Cluster of four |
| **SE** | 4 | Cluster of four |
| **Center** | 1 | Boss arena |

```
   NW ─── NE
    │  ╳  │        ╳ = central boss arena
   SW ─── SE
```

## Streaming & levels

Rooms materialize at runtime as the player enters them — they don't exist ahead of time. Each room owns its **own level**, which rises on repeat visits and drives how its enemies, hazards, and behavior scale. (See [Core Loop](loop.md).)

## Navigation

Two connection types tie the map together:

- **Hallways** — conventional physical paths between adjacent rooms.
- **Color-coded portals** — wrap the player across the map, creating a **non-Euclidean, psychologically unstable** sense of space. Two rooms that feel far apart can be one portal step away; a room you "left" can be waiting through the next door.

The disorientation is deliberate. The maze is a projection of Ariadna's mind, and the navigation is tuned to keep the player from ever building a stable mental map.

---

!!! note "Authoring rooms"
    Rooms are authored as scenes so artists can edit lighting, materials, and layout directly in the editor. Level scaling and streaming are handled by the room-manager / generator systems at runtime rather than baked into each scene.
