# Ariadna Design Wiki

Living design documentation for **Ariadna** — a single-player, first-person sci-fi horror game.

Built with [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/). Bilingual **EN / PL** via [`mkdocs-static-i18n`](https://github.com/ultrabug/mkdocs-static-i18n).

## Local preview

```bash
python -m pip install -r requirements.txt
mkdocs serve
# http://127.0.0.1:8000
```

## Structure

```
docs/
  index.md            Home / pitch
  pillars.md          Design pillars
  narrative.md        Story & cast
  loop.md             Core gameplay loop
  rooms.md            Room system
  guns.md             Modular gun system
  boss.md             The boss
  environment.md      Art direction
  tech.md             Engine & runtime
  scope.md            Scope & milestones
  decisions.md        Decision log
  backlog.md          Backlog
  editing.md          How to edit this wiki
  *.pl.md             Polish translations (one per page)
  stylesheets/        Custom palette
mkdocs.yml            Site config + nav + i18n
.github/workflows/    Auto-deploy to GitHub Pages
```

## Languages

Each page has an English file (`page.md`) and a Polish twin (`page.pl.md`). The **EN / PL** switch in the header is generated automatically. Keep the pairs in sync — see [`docs/editing.md`](docs/editing.md).

## Deploy

Push to `master`. GitHub Actions builds with `mkdocs build --strict` and publishes to GitHub Pages. Enable Pages → *Build and deployment* → **GitHub Actions** once, in the repo settings.
