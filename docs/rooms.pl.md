# 03 · Pokoje

Mapa to **16 głównych pokoi** w czterech klastrach, **centralna arena bossa** oraz **cztery korytarze**, które łączą klastry z bossem — wszystko zszyte ręcznie tworzonym grafem drzwi.

!!! info "Źródło"
    Napisane na podstawie `Scripts/Rooms/` (`room_graph.gd`, `room_manager.gd`). Poniższy układ i strumieniowanie to to, co kod faktycznie dziś robi.

## Układ

Cztery klastry po cztery pokoje tworzą szesnaście głównych pokoi, nazwanych wg klastra i indeksu (`nw1…nw4`, `ne1…ne4`, `sw1…sw4`, `se1…se4`):

| Klaster | Sloty | Rola |
|---|---|---|
| **NW** | `nw1`–`nw4` | Klaster czterech |
| **NE** | `ne1`–`ne4` | Klaster czterech |
| **SW** | `sw1`–`sw4` | Klaster czterech |
| **SE** | `se1`–`se4` | Klaster czterech |
| **Boss** | `boss` | Centralna arena |
| **Korytarze** | `hall_left/right/top/bot` | Łączą klastry → bossa |

```
   NW ─── NE
    │  ╳  │        ╳ = centralna arena bossa, osiągana przez 4 korytarze
   SW ─── SE
```

## Nawigacja — zawijający się graf drzwi

Nie ma swobodnie zwiedzanego świata. Każde przejście to jawna krawędź w **dwukierunkowym grafie** (`RoomGraph`), kluczowana `slot:kierunek` (np. `nw1:e`). Trzy rodzaje krawędzi budują niestabilną geometrię mapy:

- **Wewnątrz klastra** (16 krawędzi) — cztery pokoje każdego klastra połączone ze sobą.
- **Zawinięcia krawędzi** (8 krawędzi) — mapa składa się sama na siebie: **północne** drzwi pokoju mogą otwierać się na **południe** innego klastra, a **zachodnie** na **wschód** kolejnego. Idąc „w górę”, możesz wylądować po drugiej stronie mapy.
- **Skok przez lukę** (4 krawędzie) — dodatkowe łącza przeskakujące między klastrami.
- **Korytarze → boss** (8 + 4 krawędzie) — klastry prowadzą do czterech korytarzy, a każdy korytarz otwiera się na jedną stronę areny bossa.

Zawinięcia i skoki przez lukę dają Ariadnie **nieeuklidesowe, psychicznie niestabilne** odczucie — przestrzeń nie składa się w czystą siatkę, a pokój, który „opuściłaś”, może czekać za następnymi drzwiami.

!!! note "Portale a graf"
    Oryginalny GDD ujmował to jako *portale oznaczone kolorami*. W grze tę samą dezorientację dostarcza powyższy zawijający się graf drzwi — bez osobnych obiektów-portali. Jeśli dosłowne portale wrócą, byłyby tworzone jako dodatkowe krawędzie grafu.

## Strumieniowanie

Pokoje nie istnieją, dopóki nie są potrzebne. Gdy pokój staje się **bieżącym**, RoomManager asynchronicznie, jeden po drugim:

1. Ładuje i instancjuje każdy sąsiedni w grafie pokój.
2. Wyrównuje go **plecami do siebie przy wspólnym przejściu** (z odsunięciem o grubość ściany, by ściany zeszły się równo).
3. **Wypieka jego nav mesh.**
4. **Spawnuje jego przeciwników** — więc pokój jest zaludniony *zanim* wejdziesz.

Zanim dojdziesz do drzwi, cel już stoi w przestrzeni świata. Samo przejście to tylko animowany przemarsz — bez zacięcia ładowania. Aktywne są tylko drzwi bieżącego pokoju; drzwi sąsiadów to niewidzialne fantomy, więc każde wspólne przejście pokazuje dokładnie jedną płytę.

## Drzwi zamykają się za tobą

Gdy przekraczasz próg nowego pokoju, drzwi, którymi przyszłaś, **zamykają się** — *nie możesz od razu zawrócić tą samą drogą*. Zwalniają się przy kolejnym przejściu, więc wciąż możesz okrążyć z powrotem inną trasą. W połączeniu z pokojami awansującymi przy każdej wizycie utrzymuje to ruch naprzód, w rosnące zagrożenie, zamiast farmienia jednego bezpiecznego przejścia.

## Poziomy

Każdy główny slot ma **pięć wariantów poziomu** (`room_<slot>_lv1…lv5.tscn`). Na wejściu poziom to `clamp(wizyty + 1, 1, 5)` — pierwsza wizyta ładuje poziom 1, a przy powtórnych wizytach rośnie do limitu 5. **Korytarze nie mają wariantów poziomu** — to stałe sceny łączące.

| | Poziomy? | Skalowanie |
|---|---|---|
| Główne pokoje i boss | 1 → 5 | `clamp(wizyty+1, 1, 5)` |
| Korytarze | — | Stałe |

---

!!! note "Tworzenie pokoi"
    Pokoje są tworzone jako sceny, aby artyści bezpośrednio panowali nad oświetleniem, materiałami i układem w edytorze. Każdy wariant poziomu to osobny plik sceny. Strumieniowanie, wyrównanie, wypiekanie nawigacji, spawnowanie przeciwników i zamykanie drzwi obsługuje RoomManager w czasie rzeczywistym.
