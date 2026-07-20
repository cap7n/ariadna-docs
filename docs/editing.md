# Editing Guide

How to work on this wiki without breaking it. Short version: **edit Markdown, keep both languages in sync, let GitHub build it.**

## What this wiki is

A [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) site. Every page is a Markdown file in `docs/`. Pushing to `master` triggers a GitHub Action that builds the site and publishes it to GitHub Pages — you never build the live site by hand.

## Editing a page

1. Find the page in `docs/` (e.g. `docs/rooms.md`).
2. Edit the Markdown.
3. Commit and push to `master`.
4. The Action rebuilds and deploys in a minute or two.

## The EN / PL language switch

Every page exists twice:

| Language | File | URL |
|---|---|---|
| English (default) | `rooms.md` | `/rooms/` |
| Polish | `rooms.pl.md` | `/pl/rooms/` |

The language switcher in the top bar (**EN / PL**) is generated automatically from these pairs by the `mkdocs-static-i18n` plugin.

!!! warning "Keep pairs in sync"
    When you change `rooms.md`, update `rooms.pl.md` too. If a `.pl.md` file is missing, the plugin falls back to the English page, so nothing breaks — but the Polish reader silently gets English. Translate, don't leave gaps.

!!! tip "Writing in one language is fine"
    If translating as you go is a hassle, just write in whichever language you're comfortable in — the CI will note the drift, and the maintainer periodically runs a translation sync that merges both sides and brings the pairs back together. Content first, translation later.

## Previewing locally (optional)

```bash
python -m pip install -r requirements.txt
mkdocs serve
# open http://127.0.0.1:8000
```

## Status pills

Use the shared pill styles for state:

```html
<span class="pill done">Done</span>
<span class="pill wip">WIP</span>
<span class="pill risk">Risk</span>
<span class="pill todo">Todo</span>
```

## House rules

- **This wiki records decisions — it doesn't replace making them.** If the game and a page disagree, the game is right; fix the page.
- **Newest at the top** in the [Decision Log](decisions.md) and [Backlog](backlog.md).
- **Don't delete history** — supersede it. Reversed decisions get a new dated entry, not a silent edit.
