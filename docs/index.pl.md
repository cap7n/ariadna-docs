---
title: Start
---

# Wiki projektowe Ariadny

<p class="hero-pitch">
Jednoosobowa gra survival horror sci-fi z perspektywy pierwszej osoby. Młoda kobieta zostaje uwięziona w labiryncie utkanym z jej własnej traumy — w pokojach, które materializują się dopiero, gdy do nich wchodzi, i stają się coraz okrutniejsze za każdym powrotem.
</p>

Ariadna zabija swojego przybranego ojca i odkrywa, że ośrodek wokół niej zwija się w niemożliwy labirynt. Nie ma czystego wyjścia: korytarze zapętlają się, pokoje awansują o poziom przy każdej wizycie, a ojciec wraca raz za razem — większy, dziwniejszy, trudniejszy — dopóki nie będzie gotowa stanąć twarzą w twarz z tym, co czeka w centrum.

Projekt opiera się na trzech ideach: **napięcie przez eskalację**, **moc budowana własnoręcznie dzięki modułowej broni** oraz **ciężar psychologiczny** niesiony przez pokoje, przeciwników i bossa.

## Tożsamość gry

- **Gatunek** — jednoosobowy, first-person, sci-fi horror.
- **Pętla** — *Wejdź → Przetrwaj → Zbierz → Wróć silniejsza.* Pokoje nie istnieją, dopóki do nich nie wejdziesz, a każdy pamięta, ile razy w nim byłaś.
- **Moc** — modułowy system broni: zbieraj części, składaj je na warsztacie, obserwuj statystyki aktualizujące się na żywo.
- **Presja** — powracający boss (ojciec) pokonywany na sześciu narastających poziomach, które nigdy się nie resetują.
- **Klimat** — low-poly retro, ziarno filmowe, przytłaczający kontrast. Barwy strachu (czerwień), rdzawy bursztyn, zimne tony pamięci i mroczne pustki.

## Status projektu

| Obszar | Stan | Uwagi |
|---|---|---|
| Modułowy system broni | <span class="pill wip">W toku</span> | Korpus + Chwyt wymagane; Lufa / Kolba / Celownik opcjonalne. Statystyki na żywo. |
| Strumieniowanie pokoi | <span class="pill wip">Prototyp</span> | Wstępnie spawnowani sąsiedzi, wypieczona nawigacja, graf drzwi z zawinięciami; poziomy 1–5. |
| Przeciwnicy | <span class="pill wip">W toku</span> | Cztery archetypy na wspólnym FSM + utility AI. Na razie tylko slammer zadaje obrażenia. |
| Pętla rozgrywki | <span class="pill todo">Następne</span> | Wejdź / Przetrwaj / Zbierz / Wróć musi być grywalne od początku do końca. |
| Boss v1 | <span class="pill todo">Zaplanowane</span> | Eskalacja na sześciu poziomach, poziom nigdy się nie resetuje. |
| Środowisko i art | <span class="pill wip">Moodboard</span> | Przejście kliniczne → przytłaczające, moodboard zablokowany. |
| Silnik | <span class="pill done">Ustalone</span> | Godot 4.6, Forward+ (D3D12), Jolt Physics. |

## Od czego zacząć

<div class="grid cards" markdown>

- :material-pillar: **[Filary projektu](pillars.md)**

    Trzy zobowiązania, względem których mierzona jest każda funkcja.

- :material-book-open-page-variant: **[Fabuła](narrative.md)**

    Ariadna, Oliwier Brytol, labirynt i ryba.

- :material-refresh: **[Pętla rozgrywki](loop.md)**

    Wejdź, przetrwaj, zbierz, wróć silniejsza.

- :material-pistol: **[Modułowa broń](guns.md)**

    Pięć typów części, warsztat i statystyki na żywo.

- :material-skull: **[Przeciwnicy](enemies.md)**

    Cztery archetypy, jeden wspólny FSM i mózg utility.

</div>

---

!!! quote ""
    To wiki zapisuje decyzje — nie zastępuje ich podejmowania. Jeśli strona i gra się nie zgadzają, to gra ma rację, a strona jest nieaktualna; popraw stronę.
