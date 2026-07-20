# 06 · Boss

> Manifestacja przemocowego ojca Ariadny, pokonywana raz za razem na sześciu narastających poziomach.

Boss jest kręgosłupem gry. Nie jest bramą na końcu przebiegu (jego pokój jest otwarty **kiedy tylko gracz zechce**), ale to jedyna ścieżka presji, która zawsze rośnie.

## Dostęp i progresja

- Do pokoju bossa można wejść **w dowolnym momencie**.
- Progresja przebiega przez **sześć odrębnych poziomów**.
- **Osiągnięty poziom nigdy się nie resetuje.** Gdy poziom zostanie ukończony, pozostaje ukończony. Gracz może wyjść, wzmocnić się gdzie indziej i wrócić do kolejnego poziomu.

## Eskalacja

Każde starcie coś dodaje: więcej złożoności, nowe zagrożenia środowiskowe, głębszą fabułę. Ojciec staje się większy, dziwniejszy i trudniejszy do rozszyfrowania. Ponieważ poziomy się nie cofają, każda wizyta to prawdziwy krok naprzód: nie ma mielenia tej samej walki, jest tylko wspinaczka.

Odwzorowuje to wprost fabułę: Ariadna zabija Oliwiera **pięć razy** w ciągu subiektywnych lat, zanim dochodzi do ostatecznej konfrontacji przy pustym akwarium. Poziomy bossa *są* tymi śmierciami, przełożonymi na mechanikę.

## Filozofia projektowa

Boss jest jednocześnie **wyzwaniem mechanicznym** i **narracyjnym punktem centralnym**. Jego język wizualny jest celowo anty-potworny: ciężka, pionowa forma, niski kontrast, presja psychiczna zamiast spektaklu. Czyta się go jako *grozę*, a nie jako stwora, którym można się zachwycać.

---

| Właściwość | Wartość |
|---|---|
| Poziomy | 6 |
| Reset po śmierci | Nie: osiągnięty poziom pozostaje |
| Dostępność pokoju | Zawsze otwarty |
| Tożsamość | Manifestacja ojca (Oliwiera) |
| Cel projektowy | Presja i groza, nie konwencjonalny spektakl potwora |

!!! warning "Ryzyko balansu"
    Ponieważ boss jest zawsze dostępny i nigdy się nie cofa, balans musi zapobiec temu, by gracze porywali się na poziom, którego nie mogą pokonać, i blokowali swoje poczucie postępu. Bramkowanie poziomów i tempo nagród to otwarte [decyzje](decisions.md).

!!! note "Poziomy a implementacja"
    **Sześć poziomów** to cel projektowy. W bieżącej wersji boss ładuje się przez ten sam system pokoi co wszystko inne (`room_boss_lv1…lv5.tscn`, skalowany przez `clamp(wizyty + 1, 1, 5)`), więc dziś istnieje pięć wariantów poziomu. Szósty poziom i trwałość „nigdy się nie resetuje” to zamysł jeszcze nie w pełni okablowany. Zobacz [Pokoje](rooms.md).
