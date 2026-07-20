# 02 · Core Loop

> **Enter → Survive → Collect → Return stronger.**

The whole game is one cycle, tightened by the fact that space itself is unstable. The player is never just walking through a level. They are choosing, over and over, whether to push into the unknown or squeeze more out of the known at a higher price.

## Enter

Rooms do not exist until Ariadna enters them. They **materialize at runtime**, and each room carries its own current level (`clamp(visits + 1, 1, 5)`, climbing to a cap of 5). Walking through a door is a commitment: the room that assembles on the other side is scaled to how many times it has been visited, and **the door locks behind you**: no immediate backtracking the way you came. See [Rooms](rooms.md).

## Survive

Once inside, the player has to hold the space. Enemies, hazards, and room behavior all scale with the room's level. The core tension: **a room you've cleared before is not the room you'll find on your next visit**; it's a harder version wearing the same skin.

## Collect

Surviving pays out. Rewards come as:

- **Gun components** to feed the modular weapon system.
- **Narrative fragments** that fill in Ariadna's history.
- **Better loot on revisits:** higher room levels drop better parts.

## Return stronger

From any point the player chooses their next pressure:

- Re-enter a known room for tougher enemies and better rewards.
- Push into an unexplored room for first-clear loot and story.
- Take on the **boss**, advancing a tier that never resets.

Each choice raises the stakes somewhere. There is no move that lowers the overall temperature of the run.

---

```
        ┌───────────────────────────────────────────┐
        │                                           │
        ▼                                           │
   ┌─────────┐   ┌──────────┐   ┌───────────┐   ┌────┴─────┐
   │  ENTER  │──▶│ SURVIVE  │──▶│  COLLECT  │──▶│  RETURN  │
   │ (spawn) │   │ (scaled) │   │  (loot)   │   │ stronger │
   └─────────┘   └──────────┘   └───────────┘   └──────────┘
```

!!! tip "Why it works"
    Because rooms level with visits, the player's own growing power is always racing the room's growing danger. The loop stays taut as long as neither side runs away with it. See [Design Pillars](pillars.md).
