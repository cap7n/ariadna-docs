# 3D Backlog

> Zadania 3D: modele, rigi, animacje, VFX, shadery, geometria poziomów. Pogrupowane po systemach, najnowsze priorytety na górze.

Legenda: <span class="pill wip">WIP</span> w toku · <span class="pill todo">Do zrobienia</span> nie rozpoczynano · <span class="pill risk">Ryzyko</span> wymaga decyzji · <span class="pill done">Gotowe</span> wydane.

## System broni

- <span class="pill wip">WIP</span> Warsztat 3D: przeciąganie, snap-do-slotu, live aktualizacja statystyk.
- <span class="pill todo">Do zrobienia</span> Przejścia stanów części: Świat → Ekwipunek → Zmontowana (obiekty 3D).

## System pokoi

- <span class="pill done">Gotowe</span> Układ 16-pokojowy (NW / NE / SW / SE) + boss + 4 korytarze, podpięte jako graf drzwi.
- <span class="pill done">Gotowe</span> Nawigacja nie-euklidesowa wrap-around (edge-wrap + cross-gap krawędzie grafu).
- <span class="pill done">Gotowe</span> Pre-spawn sąsiadów: wyrównanie, nav-bake, populate przed wejściem.
- <span class="pill done">Gotowe</span> Drzwi-zamykają-się-za-tobą na przejściu.
- <span class="pill wip">WIP</span> Śledzenie poziomu pokoju i skalowanie (poziomy 1–5, `clamp(visits+1,1,5)`).
- <span class="pill todo">Do zrobienia</span> Opracowanie wariantów poziomów 2–5 dla każdego slota.

## Przeciwnicy

- <span class="pill done">Gotowe</span> Wspólny FSM (IDLE/REPOZYCJA/WINDUP/ATAK/RECOVER) + utility AI + aktywacja wzrokiem.
- <span class="pill done">Gotowe</span> Cztery archetypy: ładujący, kitujący, zaskarbujący, uderzający (modele, rigi, animacje).
- <span class="pill done">Gotowe</span> Zdrowie, odrzut, hit-flash, markery spawnowe.
- <span class="pill wip">WIP</span> Ścieżki dmg: na razie tylko uderzający trafia.
- <span class="pill todo">Do zrobienia</span> Projektyl kitującego VFX + animacja ataku zbliżeniowego zaskarbującego.

## Boss

- <span class="pill todo">Do zrobienia</span> Boss v1: model, rig, zestaw animacji, eskalacja 6-stopniowa, trwały tier.
- <span class="pill todo">Do zrobienia</span> Wizualne feedback tier-gatingu, by gracze nie zablokowali się na niepokonalnym tierze.

## Świat i szlif

- <span class="pill wip">WIP</span> Moodboard środowiska → przełożenie materiałów w silniku.
- <span class="pill todo">Do zrobienia</span> Post-stack: ziarno filmu, winieta, chromatyczna abberacja — strojenie.
- <span class="pill todo">Do zrobienia</span> Przejście wydajnościowe (Forward+ / D3D12).

---

!!! note "Źródło"
    Podział z głównego [Backlogu](backlog.md). Same zadania 3D — UI/UX w [UI Backlog](ui-backlog.md).