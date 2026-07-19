# 03 · Pokoje

Mapa zbudowana jest z **17 pokoi**: szesnastu pokoi bojowo-eksploracyjnych ułożonych w cztery klastry oraz jednej centralnej areny bossa.

## Układ

Cztery klastry po cztery pokoje tworzą szesnaście pokoi spoza areny bossa:

| Klaster | Pokoje | Rola |
|---|---|---|
| **NW** | 4 | Klaster czterech |
| **NE** | 4 | Klaster czterech |
| **SW** | 4 | Klaster czterech |
| **SE** | 4 | Klaster czterech |
| **Centrum** | 1 | Arena bossa |

```
   NW ─── NE
    │  ╳  │        ╳ = centralna arena bossa
   SW ─── SE
```

## Strumieniowanie i poziomy

Pokoje materializują się w czasie rzeczywistym, gdy gracz do nich wchodzi — nie istnieją z wyprzedzeniem. Każdy pokój ma **własny poziom**, który rośnie przy powtórnych wizytach i decyduje o tym, jak skalują się jego przeciwnicy, zagrożenia i zachowanie. (Zobacz [Pętla rozgrywki](loop.md)).

## Nawigacja

Mapę spajają dwa typy połączeń:

- **Korytarze** — konwencjonalne, fizyczne ścieżki między sąsiadującymi pokojami.
- **Portale oznaczone kolorami** — przenoszą gracza w poprzek mapy, tworząc **nieeuklidesowe, psychicznie niestabilne** poczucie przestrzeni. Dwa pokoje, które wydają się odległe, mogą dzielić jeden skok przez portal; pokój, który „opuściłaś”, może czekać za następnymi drzwiami.

Dezorientacja jest zamierzona. Labirynt to projekcja umysłu Ariadny, a nawigacja jest tak dostrojona, by gracz nigdy nie zbudował stabilnej mapy w głowie.

---

!!! note "Tworzenie pokoi"
    Pokoje są tworzone jako sceny, aby artyści mogli edytować oświetlenie, materiały i układ bezpośrednio w edytorze. Skalowanie poziomów i strumieniowanie obsługują systemy menedżera / generatora pokoi w czasie rzeczywistym, zamiast być wypalone w każdej scenie.
