---
description: Merge EN/PL page pairs — translate whichever side changed onto its stale twin
---

Synchronize the bilingual documentation in this repo. Every page is a pair: `docs/page.md` (English) and `docs/page.pl.md` (Polish). Contributors may edit only one side; your job is to bring the pairs back into semantic sync.

Steps:

1. Baseline: `git fetch` and locate the tag `i18n-synced` — it marks the last completed sync. Diff it against HEAD: `git diff --name-only i18n-synced..HEAD -- docs/`. If the tag is missing, say so and ask before proceeding with a full-content comparison instead.
2. Group the changed files into language pairs. For each pair:
   - **Only one side changed** → read the diff of the changed side (`git diff i18n-synced..HEAD -- <file>`), then apply the equivalent change to the twin, translated. Translate meaning, not word-for-word; match the twin's existing tone and terminology (see the glossary below). Never translate: code blocks, file paths, node/class names, slot ids (`nw1`, `hall_left`…), CSS pill markup, or proper nouns (Ariadna, Oliwier Brytol).
   - **Both sides changed** → merge: incorporate BOTH edits into BOTH languages. If the two sides genuinely contradict each other, stop and ask the user which wins before writing anything.
3. Established glossary (keep consistent): pokoje=rooms, pętla rozgrywki=core loop, przeciwnicy=enemies, doskok=dash, korpus=body, chwyt=handle, lufa=barrel, kolba=stock, celownik=sight, ekwipunek=inventory, warsztat=workbench, zawinięcia=edge wraps, W toku=WIP/In progress, Do zrobienia=Todo, Gotowe=Done, Ryzyko=Risk.
4. Validate: `python -m mkdocs build --strict` must pass with no new warnings.
5. Show the user a short summary of what was synced (which pages, which direction), then commit everything as one commit (message like "Sync EN/PL translations") and push to `master`.
6. Move the marker: `git tag -f i18n-synced` and `git push -f origin i18n-synced`.

House rules: commits under the repo owner's name only, no AI attribution anywhere. If any page fails to parse or a pair's structure has diverged badly (different section counts), flag it in the summary rather than guessing.
