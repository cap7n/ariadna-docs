# Open Questions

> Ideas that aren't set in stone yet, but need a decision. Different from the [Decision Log](decisions.md): that page records what we've already decided and why; this page holds what we haven't decided yet.

When a question here gets resolved, move it to the [Decision Log](decisions.md) as a new dated entry and delete it from this page. Don't let answered questions pile up here; this list should always be short enough to actually read.

## How to add a question

Copy the block, fill it in, put newest at the top:

```markdown
### Short title
**The question:** what needs deciding, in one sentence.
**Why it's open:** the tension or trade-off making this hard to just pick.
**Options on the table:** the realistic choices, briefly.
**Owner:** who should make the call (or "unassigned").
```

## Questions

### Music stereo split by instruments
**The question:** should the soundtrack split instruments across stereo channels (or spatial positions) so each instrument can be manipulated independently at runtime, rather than baking a pre-mixed stereo track?
**Why it's open:** dynamic instrument-level control enables reactive music (muting/soloing layers, crossfading intensity per instrument) could deepen psychological horror by mirroring Ariadna's state, but requires authoring stems per track, a runtime mixer setup, and may clash with spatial audio priorities.
**Options on the table:** baked stereo stems per intensity tier (simplest, least flexible), runtime stereo panning per stem with automation curves, or full 3D spatial audio per instrument tied to room geometry (max flexibility, highest authoring cost).
**Owner:** unassigned.

### Spatial music mix for immersion
**The question:** should different instruments be placed at different positions around the room to create a stereo effect and push, rather than a flat stereo mix?
**Why it's open:** spatial music could deepen immersion and disorientation — which fits the horror tone — but it adds authoring complexity (per-room mix layouts) and risks conflicting with gameplay sound cues.
**Options on the table:** flat stereo mix (simplest), per-room 3D spatialisation with instruments anchored to room geometry, or a hybrid where only specific atmospheric layers are spatialised while core rhythm/tension tracks stay in stereo.
**Owner:** unassigned.

### Final gun part stat weightings
**The question:** what damage / accuracy / recoil / weight values should each part variant actually carry?
**Why it's open:** the [modular gun system](guns.md) plumbing is done, but the numbers are still placeholders. Getting this wrong either makes every build feel the same or makes one part combo strictly best.
**Options on the table:** hand-tune by feel during playtesting, or draft a spreadsheet model first (budget points per part, like a mini gear score) and tune from there.
**Owner:** unassigned.

### When to pull the floating damage numbers
**The question:** at what point do we remove the on-hit damage popups?
**Why it's open:** they're flagged in the [Backlog](backlog.md) as playtest-only. Playtesters explicitly asked for them to tune balance, but leaving them in breaks the psychological-horror tone once the game ships (see [Design Pillars](pillars.md)). Pull too early and balance work gets harder; pull too late and it risks becoming permanent by inertia.
**Options on the table:** tie removal to a specific milestone (e.g. once [Core Loop Playable](scope.md) is signed off), or gate it behind a debug flag so it's easy to keep around internally after it's gone from the shipping build.
**Owner:** unassigned.

### Revisit reward curve
**The question:** how much better should loot get on repeat room visits, relative to how much harder the room gets?
**Why it's open:** rooms scale enemies/hazards on every revisit ([Rooms](rooms.md)), and that's supposed to be worth it, but "worth it" isn't defined yet. Too generous and revisiting trivializes exploration; too stingy and revisiting isn't worth the risk, which undercuts the [Core Loop](loop.md).
**Options on the table:** loot scales linearly with room level, loot scales in steps at specific level thresholds, or loot type changes (not just quantity/quality) so a level-5 room drops something a level-1 room can't.
**Owner:** unassigned.

### Boss tier gating and pacing
**The question:** what stops a player from walking into a boss tier they can't beat and stalling their sense of progress, given the [tier never resets](boss.md)?
**Why it's open:** the boss room is always open by design, and tiers are permanent once cleared. That's the point (mounting pressure) but it also means a bad decision to push a tier early has no natural undo.
**Options on the table:** a soft warning before entering a tier well above the player's current gear/room progress, a hard gate tied to a milestone (e.g. minimum gun stat total), or leaving it fully open and treating a bad push as a valid, if painful, player choice.
**Owner:** unassigned.

---

!!! tip "Keep it short"
    This page works best as a live scratchpad, not an archive. If a question has been sitting here for a while with a clear answer, just decide, log it in the [Decision Log](decisions.md), and delete it from here.
