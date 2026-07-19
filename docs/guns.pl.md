# 05 · Modułowy system broni

> Złóż broń sama. Statystyki aktualizują się na żywo, gdy części wskakują na miejsce.

Moc w Ariadnie jest **budowana**, a nie znajdowana w całości. Gracz zbiera komponenty w pokojach i buduje broń z części, obserwując, jak łączne statystyki zmieniają się wraz z częściami.

!!! info "Źródło"
    Napisane na podstawie `Scripts/Gun/` i `Scripts/Inventory/`. Poniższe części, statystyki i liczby slotów to to, co kod definiuje dziś.

## Komponenty

Pięć typów slotów (`GunPartType`). **Korpus** to kręgosłup — każda inna część się do niego mocuje:

| Część | Slot | Rola |
|---|---|---|
| **Korpus** | `BODY` | Kręgosłup / rama, do której wszystko się mocuje |
| **Chwyt** | `HANDLE` | Uchwyt |
| **Lufa** | `BARREL` | — |
| **Kolba** | `STOCK` | — |
| **Celownik** | `SIGHT` | — |

Każdy wariant części jest tworzony jako zasób `.tres` (`GunPartData`), więc może istnieć wiele wersji jednego slotu — „długa lufa”, „przyrządy żelazne” i tak dalej — każda z własnym wkładem w statystyki i meshem.

## Statystyki

Części wnoszą **addytywnie** do czterech łącznych statystyk (`GunStats`). Brakująca część wnosi po prostu zero:

| Statystyka | Znaczenie |
|---|---|
| **Obrażenia** | Dodatkowe obrażenia na strzał. |
| **Celność** | Wyżej = ciaśniejszy rozrzut. |
| **Odrzut** | Wyżej = więcej kopnięcia na strzał. |
| **Waga** | Jednostki umowne — zarezerwowane pod kary do ruchu. |

!!! warning "To *waga*, nie zasięg"
    Bieżąca wersja śledzi **obrażenia / celność / odrzut / wagę**. Wcześniejszy GDD wymieniał „zasięg”; kod tego nie robi. Waga jest okablowana jako statystyka, ale jej kara do ruchu nie jest jeszcze podpięta.

## Przebieg składania

Warsztat jest diegetyczny — nie otwierasz menu, tylko **odkładasz broń i przy niej pracujesz**:

1. Naciśnij **`O` (odłóż broń)** — kamera przechodzi do **widoku z góry** nad punktem odłożenia, a gracz zamiera.
2. Otwórz **ekwipunek (`I`)** — wsuwa się siatka **12 × 8 = 96 slotów**; widok 3D przesuwa się w prawo, by części i broń pozostały widoczne.
3. **Majstruj myszą** (`MousePartInteractor`) — przeciągaj części między światem, ekwipunkiem a bronią. Broń odrzuca części w niewłaściwym slocie.
4. Nakładka statystyk pokazuje **łączne statystyki na żywo**, gdy części się zmieniają.
5. Podnieś broń z powrotem — kamera wraca do pierwszej osoby.

Każda część śledzi jeden z trzech stanów, więc systemy mogą pytać np. „każda luźna Lufa”:

```
  ŚWIAT  ◀──▶  EKWIPUNEK  ◀──▶  ZŁOŻONA
(odłożona)     (96 slotów)     (na broni)
```

## Zamysł projektowy

Składanie powinno być **rytualne** — metaloplastyka, skupione światło, negatywna przestrzeń — a nie rozwijana lista statystyk. Fantazja to kobieta, która metodycznie buduje narzędzie pozwalające jej przetrwać jeszcze jeden powrót do labiryntu.

---

!!! info "Gdzie żyją liczby"
    Wagi statystyk są tworzone per część w wariantach `.tres` i łączone przez `Gun.get_stats()`. Wszelkie liczby w innych miejscach tego wiki traktuj jako zamysł; źródłem prawdy są części.
