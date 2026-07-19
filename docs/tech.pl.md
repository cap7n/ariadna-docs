# 07 · Silnik i runtime

Fundament techniczny, utrzymany celowo szczupło, by trudną częścią była groza — nie technologia.

## Stos

| Warstwa | Wybór |
|---|---|
| Silnik | **Godot 4.6** |
| Renderer | **Forward+** (D3D12 na Windows) |
| Fizyka | **Jolt Physics** |
| Post-processing | Ziarno filmowe, winieta, subtelna aberracja chromatyczna |

Forward+ z D3D12 daje zapas oświetleniowy na przejścia świateł od klinicznych ku przytłaczającym; stos post-processingu (ziarno, winieta, lekka aberracja chromatyczna) skleja look low-poly w jeden spójny obraz.

## Główne systemy runtime

Pięć systemów niesie grę z chwili na chwilę:

| System | Odpowiedzialność |
|---|---|
| **PartRegistry** | Źródło prawdy o częściach broni i ich statystykach |
| **PlayerInventory** | 96-slotowy magazyn części i ich stany |
| **GunHolder** | Złożona broń trzymana przez gracza |
| **MousePartInteractor** | Interakcja z warsztatem — wybór, przeciąganie, przyciąganie |
| **Room Generator** | Materializacja pokoi w czasie rzeczywistym i skalowanie poziomów |

## Sterowanie

First-person plus interakcja z warsztatem:

| Wejście | Akcja |
|---|---|
| **WASD** | Ruch |
| **Spacja** | Skok |
| **Shift** | Doskok / sprint |
| **LPM** | Strzał / interakcja |
| **I** | Ekwipunek |
| **O** | Warsztat |
| **Escape** | Pauza / cofnięcie |

---

!!! info "Uwaga o wersji"
    Ta strona to unowocześniona, czytelna prezentacja sekcji technicznej GDD dostosowana do bieżącej wersji gry. Tam, gdzie działający projekt i ta strona się nie zgadzają, wygrywa projekt — zgłoś poprawkę na zasadach z [Jak edytować wiki](editing.md).
