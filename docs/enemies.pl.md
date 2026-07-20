# 04 · Przeciwnicy

> Cztery archetypy, jeden wspólny mózg. Każdy czyta się jako odrębne zagrożenie, ale pod spodem wszystkie działają na tej samej pięciostanowej maszynie.

!!! info "Źródło"
    Ta strona powstała na podstawie wdrożonych skryptów przeciwników (`Scripts/Enemies/`, `Scripts/AI/`). Liczby to bieżące wartości domyślne, strojone w scenach. Traktuj je jako stan gry, a nie sztywne prawo projektowe.

## Wspólny FSM

Każdy przeciwnik, bazowy `Enemy` (`CharacterBody3D`), działa na tej samej pętli:

```
IDLE ──▶ REPOSITION ──▶ WINDUP ──▶ ATTACK ──▶ RECOVER
  ▲                                              │
  └──────────────────────────────────────────────┘
```

| Stan | Znaczenie |
|---|---|
| **IDLE** | Gracz poza zasięgiem wzroku: stój w miejscu. |
| **REPOSITION** | Zajmij korzystną pozycję (goń / kituj / kryj się / zbliż). |
| **WINDUP** | Telegraf: zaprzyj się i naładuj atak, żeby czytał się *uczciwie*. |
| **ATTACK** | Wykonaj (doskok / skok / strzał / wypad). |
| **RECOVER** | Cooldown przed kolejnym repozycjonowaniem. |

Podklasy wyrażają osobowość, nadpisując ticki poszczególnych stanów (głównie `_tick_reposition`) i `_attack()`. Baza obsługuje grawitację, ruch, zwrot, percepcję i zdrowie.

## Utility AI na wierzchu

Co klatkę fizyki, przed tickiem FSM, baza ocenia trzy akcje (**IDLE / CHASE / ATTACK**) przez `EnemyUtilityScoring.pick_best()` i indywidualną `EnemyDisposition` (domyślnie: agresywna). Zwycięska akcja bramkuje przejścia stanów, więc zachowanie to mieszanka ręcznie napisanego FSM i decyzji utility na żywo.

- **Aktywacja oparta na wzroku.** Bezczynny przeciwnik budzi się tylko, gdy system utility mówi *angażuj* **i** faktycznie ma linię wzroku. Przeciwnicy za ścianami pozostają uśpieni.
- **Sprowokowany trafieniem.** Otrzymanie obrażeń ustawia `provoked = true` i wyrywa bezczynnego prosto do REPOSITION; nie da się bezpiecznie postrzelić przeciwnika i liczyć, że cię zignoruje.

## Zdrowie i informacja zwrotna o trafieniu

Wspólne dla wszystkich przeciwników (`Enemy.take_damage()`):

| Właściwość | Domyślnie | Uwagi |
|---|---|---|
| Maks. HP | 30 | Nadpisywane per scena dla twardszych / słabszych wariantów. |
| Odrzut | 0,5 m | Odepchnięcie od strzelca; wygasa w 0,12 s. Ustaw 0, by wyłączyć. |
| Błysk trafienia | 0,09 s | Mesh błyska na biało przy każdym trafieniu. Ustaw 0, by wyłączyć. |
| Liczba obrażeń | N/D | Pływająca liczba nad przeciwnikiem (tymczasowa pomoc do playtestów). |

Raycast broni po prostu woła `take_damage(amount)` na tym, w co trafi. Przeciwnicy nie wymagają specjalnego okablowania.

## Cztery archetypy

### :material-rotate-orbit: Charger: latający nurek
Krąży po orbicie wokół gracza, błyska, gdy się ładuje, a potem **doskakuje prosto przez gracza i daleko za niego**, wybierając świeży kąt orbity na kolejny przelot. Ignoruje nav mesh; steruje bezpośrednio w 3D.

- Promień orbity **10 m**, unosi się **2,5 m** wyżej · telegraf **0,7 s** · doskok **40 m/s**, przelatuje **9 m** za gracza.

### :material-bow-arrow: Kiter: dystansowy strefowicz
Utrzymuje **preferowany dystans 8 m** (pas komfortu ±1,5 m): zbliża się, gdy za daleko, cofa, gdy za blisko, i okresowo staje, by strzelić. Woli repozycjonowanie od strzału podczas „przeładowania”.

- Atakuje do **12 m** · telegraf celowania **0,4 s** · przeładowanie **1 s**. *(Pocisk zaślepiony do czasu finalnych obrażeń dystansowych.)*

### :material-eye-off: Ambusher: czatownik
**Nie** zbliża się. Znajduje miejsce **poza zasięgiem wzroku gracza** (pierścień 7–14 m) i czeka. Dwie rzeczy przerywają czekanie: gracz wchodzi w **zasięg wypadu (4,5 m)** → następuje wypad; albo gracz **zauważa go pierwszy** → ucieka do świeżej kryjówki zamiast forsować atak.

- Telegraf wypadu **0,25 s** · wypad **16 m/s** · po każdym wypadzie chowa się ponownie, więc nie może łączyć wypadów w serię. *(Zwarcie zaślepione do czasu finalnych obrażeń kontaktowych.)*

### :material-hammer: Slammer: ciężki siłacz
Ociężale zmierza do gracza po nav meshu, staje dęba (mrugający telegraf) i **wali w ziemię w miejscu**, wysyłając falę uderzeniową tam, gdzie stoi. Zbliża się na piechotę i uderza w miejscu: bez skoku.

- Zasięg uderzenia **3,5 m** · nawijanie **0,6 s** · promień AoE **3,5 m** · **20 obrażeń** · odpoczynek **1 s**.

!!! warning "Na razie gryzie tylko slammer"
    Slammer to jedyny archetyp, który obecnie zadaje obrażenia; strzał kitera i zwarcie ambushera są zaślepione do czasu sfinalizowania ich ścieżek obrażeń. Telegraf i kadencja wszystkich czterech już działają, więc bezpiecznie można je playtestować pod kątem *odczucia*.

---

## Spawnowanie

Przeciwnicy są tworzeni per pokój za pomocą **znaczników spawnu** (`EnemySpawnMarker`, `Marker3D` niosący `enemy_scene`). Gdy pokój jest wstępnie zespawnowany jako sąsiad i jego nav mesh jest wypieczony, RoomManager woła `spawn_enemies()` **zanim gracz zdąży wejść**, więc pokój jest już zaludniony na wejściu, a nie spawnuje się na oczach gracza. Zobacz [Pokoje](rooms.md).
