# 07 · Silnik i runtime

Fundament techniczny, utrzymany celowo szczupło, by trudną częścią była groza — nie technologia.

!!! info "Źródło"
    Napisane na podstawie `project.godot` oraz skryptów gracza / broni / pokoi. Poniższe sterowanie, autoloady i warstwy to bieżące ustawienia projektu.

## Stos

| Warstwa | Wybór |
|---|---|
| Silnik | **Godot 4.6**, Forward+ |
| Urządzenie renderujące | **D3D12** na Windows |
| Fizyka | **Jolt Physics** (z włączoną interpolacją fizyki) |
| Wyświetlanie | 1920 × 1080, pełny ekran |
| Post-processing | Ziarno filmowe, winieta, subtelna aberracja chromatyczna |

## Singletony autoload

Cztery globalne obiekty niosą stan między scenami (`[autoload]` w `project.godot`):

| Autoload | Odpowiedzialność |
|---|---|
| **PartRegistry** | Źródło prawdy o częściach broni, indeksowane wg stanu (Świat / Ekwipunek / Złożona). |
| **PlayerInventory** | Trwała siatka części 12 × 8 = 96 slotów. |
| **RoomGraph** | Statyczna topologia drzwi — każda krawędź `slot:kierunek` i ścieżki scen slotów. |
| **RoomManager** | Strumieniowanie pokoi, wyrównanie, wypiekanie nawigacji, przejścia i skalowanie poziomów. |

## Warstwy fizyki

Trzy warstwy 3D utrzymują czyste trafienia:

| Warstwa | Nazwa | Używana przez |
|---|---|---|
| 1 | **World** | Geometria, meble — blokują linię wzroku. |
| 2 | **Enemy** | Ciała przeciwników. |
| 3 | **Player** | Kapsuła gracza. |

Maska trafień broni celuje w World + Enemy, więc strzały trafiają w przeciwników i ściany, ale nigdy w gracza.

## Sterowanie

Pierwsza osoba, zmapowane w input mapie:

| Wejście | Akcja | |
|---|---|---|
| **W A S D** | Ruch | |
| **Spacja** | Skok | |
| **Shift** | Sprint | ×1,5 prędkości |
| **Shift + Spacja** | **Doskok** | Kierunkowy zryw — patrz niżej |
| **LPM** | Strzał | |
| **E** | Interakcja | Otwórz wskazane drzwi |
| **I** | Przełącz ekwipunek | Siatka 96 slotów |
| **O** | Odłóż broń | Zejście do widoku warsztatu z góry |
| **Esc** | Przełącz przechwyt myszy | |

## Ruch i zdrowie gracza

Z `Scripts/Player/player.gd`:

| Właściwość | Wartość |
|---|---|
| Prędkość marszu | 5 m/s |
| Mnożnik sprintu | ×1,5 |
| Prędkość skoku | 4,5 m/s |
| **Doskok** | zryw 18 m/s · 0,18 s · cooldown 0,8 s |
| Maks. HP | 100 |
| Czułość myszy | 0,003 rad/px · pochylenie ±89° |

**Doskok** (Shift + tap Spacja) to płaski zryw wzdłuż bieżącego kierunku ruchu — kroki w bok napędzają poziomą smugę na ekranie, przód/tył promienistą (shader `dash_blur`). Zdrowie przechodzi przez `take_damage()` / `heal()` / `revive()`, napędza kulę HUD (`hp_ratio`) i emituje `health_changed` / `died`. Każdy atakujący zadaje obrażenia bez referencji:

```gdscript
get_tree().call_group(&"player", &"take_damage", amount)
```

---

!!! info "Uwaga o wersji"
    Ta strona to unowocześniona, czytelna prezentacja sekcji technicznej GDD pogodzona z bieżącą wersją gry. Tam, gdzie działający projekt i ta strona się nie zgadzają, wygrywa projekt — zgłoś poprawkę na zasadach z [Jak edytować wiki](editing.md).
