# Jak edytować wiki

Jak pracować nad tym wiki, nie psując go. W skrócie: **edytuj Markdown, trzymaj oba języki w synchronizacji, pozwól GitHubowi je zbudować.**

## Czym jest to wiki

Stroną [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/). Każda strona to plik Markdown w `docs/`. Wypchnięcie na `master` uruchamia akcję GitHub, która buduje stronę i publikuje ją na GitHub Pages. Nigdy nie budujesz strony na żywo ręcznie.

## Edytowanie strony

1. Znajdź stronę w `docs/` (np. `docs/rooms.md`).
2. Edytuj Markdown.
3. Zatwierdź i wypchnij na `master`.
4. Akcja przebudowuje i wdraża w minutę lub dwie.

## Przełącznik języka EN / PL

Każda strona istnieje dwukrotnie:

| Język | Plik | URL |
|---|---|---|
| Angielski (domyślny) | `rooms.md` | `/rooms/` |
| Polski | `rooms.pl.md` | `/pl/rooms/` |

Przełącznik języka na górnym pasku (**EN / PL**) jest generowany automatycznie z tych par przez wtyczkę `mkdocs-static-i18n`.

!!! warning "Trzymaj pary w synchronizacji"
    Gdy zmieniasz `rooms.md`, zaktualizuj też `rooms.pl.md`. Jeśli plik `.pl.md` jest brakujący, wtyczka wraca do strony angielskiej, więc nic się nie psuje, ale czytelnik po polsku po cichu dostaje angielski. Tłumacz, nie zostawiaj luk.

!!! tip "Pisanie w jednym języku jest w porządku"
    Jeśli tłumaczenie na bieżąco jest uciążliwe, po prostu pisz w języku, w którym czujesz się swobodnie. CI odnotuje rozjazd, a opiekun repozytorium okresowo uruchamia synchronizację tłumaczeń, która scala obie strony i przywraca zgodność par. Najpierw treść, tłumaczenie później.

## Podgląd lokalny (opcjonalnie)

```bash
python -m pip install -r requirements.txt
mkdocs serve
# otwórz http://127.0.0.1:8000
```

## Piguły statusu

Używaj wspólnych stylów pigułek dla stanu:

```html
<span class="pill done">Gotowe</span>
<span class="pill wip">W toku</span>
<span class="pill risk">Ryzyko</span>
<span class="pill todo">Do zrobienia</span>
```

## Reguły domu

- **To wiki zapisuje decyzje; nie zastępuje ich podejmowania.** Jeśli gra i strona się nie zgadzają, rację ma gra; popraw stronę.
- **Najnowsze na górze** w [Logu decyzji](decisions.md) i [Backlogu](backlog.md).
- **Nie usuwaj historii:** zastępuj ją. Odwrócone decyzje dostają nowy datowany wpis, a nie cichą edycję.
