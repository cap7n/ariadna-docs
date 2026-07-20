# 11 · Backlog

> Lista rzeczy do zbudowania: *lista zadań do realizacji*. Pogrupowana wg kamieni milowych, najwyższe priorytety na górze każdej grupy.

Legenda: <span class="pill wip">W toku</span> w trakcie · <span class="pill todo">Do zrobienia</span> nierozpoczęte · <span class="pill risk">Ryzyko</span> wymaga decyzji · <span class="pill done">Gotowe</span> dowiezione.

## System broni

- <span class="pill wip">W toku</span> Warsztat: przeciąganie, przyciąganie do slotu, statystyki na żywo.
- <span class="pill todo">Do zrobienia</span> Przejścia stanów części: Świat → Ekwipunek → Złożona.
- <span class="pill todo">Do zrobienia</span> UI 96-slotowego ekwipunku części.
- <span class="pill risk">Ryzyko</span> Ostateczne wagi statystyk per część (obrażenia / celność / odrzut / waga). Zobacz [Otwarte pytania](open-questions.md#ostateczne-wagi-statystyk-czesci-broni).

## System pokoi

- <span class="pill done">Gotowe</span> Układ 16 pokoi w klastrach (NW / NE / SW / SE) + boss + 4 korytarze, okablowane jako graf drzwi.
- <span class="pill done">Gotowe</span> Nieeuklidesowa nawigacja z zawijaniem (krawędzie zawinięć + skoków przez lukę).
- <span class="pill done">Gotowe</span> Wstępny spawn sąsiadów: wyrównaj, wypiecz nawigację, zaludnij przed wejściem.
- <span class="pill done">Gotowe</span> Zamykanie drzwi za graczem przy przejściu.
- <span class="pill wip">W toku</span> Śledzenie poziomu per pokój i skalowanie (poziomy 1–5, `clamp(wizyty+1,1,5)`).
- <span class="pill todo">Do zrobienia</span> Stworzenie wariantów poziomów 2–5 dla każdego slotu.

## Przeciwnicy

- <span class="pill done">Gotowe</span> Wspólny FSM (IDLE/REPOSITION/WINDUP/ATTACK/RECOVER) + utility AI + aktywacja wzrokiem.
- <span class="pill done">Gotowe</span> Cztery archetypy: charger, kiter, ambusher, slammer.
- <span class="pill done">Gotowe</span> Zdrowie, odrzut, błysk trafienia, znaczniki spawnu.
- <span class="pill wip">W toku</span> Ścieżki obrażeń: na razie trafia tylko slammer.
- <span class="pill todo">Do zrobienia</span> Pocisk kitera + zwarcie ambushera.
- <span class="pill risk">Ryzyko</span> Usunąć tymczasowe pływające liczby obrażeń przed wydaniem (psują klimat grozy). Zobacz [Otwarte pytania](open-questions.md#kiedy-usunac-pywajace-liczby-obrazen).

## Pętla rozgrywki

- <span class="pill todo">Do zrobienia</span> Grywalne Wejdź → Przetrwaj → Zbierz → Wróć od początku do końca.
- <span class="pill todo">Do zrobienia</span> Wypłata nagród: części broni + fragmenty fabuły po oczyszczeniu.
- <span class="pill risk">Ryzyko</span> Krzywa nagród za ponowne wizyty: lepszy łup vs. niekontrolowana trudność. Zobacz [Otwarte pytania](open-questions.md#krzywa-nagrod-za-ponowne-wizyty).

## Boss

- <span class="pill todo">Do zrobienia</span> Boss v1: eskalacja na sześciu poziomach, trwały poziom.
- <span class="pill todo">Do zrobienia</span> Bramkowanie poziomów, by gracze nie zablokowali się na niepokonalnym poziomie.

## Świat i szlif

- <span class="pill wip">W toku</span> Moodboard środowiska → przełożenie materiałów w silniku.
- <span class="pill todo">Do zrobienia</span> Stos post-processingu: strojenie ziarna, winiety, aberracji chromatycznej.
- <span class="pill todo">Do zrobienia</span> Przejście dźwiękowe.
- <span class="pill todo">Do zrobienia</span> Przejście wydajnościowe (Forward+ / D3D12).

---

!!! note "Źródło"
    Oryginalny deck GDD pozostawił tę sekcję jako *„Treść wkrótce”*. Powyższe pozycje wywodzą się ze ścieżki kamieni milowych z [Zakresu](scope.md) oraz z systemów opisanych w całym wiki. Utrzymuj tę listę uczciwą; przenoś rzeczy do <span class="pill done">Gotowe</span> dopiero, gdy naprawdę są w grze.
