# 05 · Modułowy system broni

> Złóż broń sama. Statystyki aktualizują się na żywo, gdy części wskakują na miejsce.

Moc w Ariadnie jest **budowana**, a nie znajdowana w całości. Gracz zbiera komponenty w pokojach i składa broń na warsztacie, obserwując, jak obrażenia, celność, odrzut i zasięg zmieniają się w czasie rzeczywistym wraz z częściami.

## Komponenty

Pięć typów części. Dwa obowiązkowe, trzy to opcjonalne kompromisy:

| Część | Wymagana | Wpływa głównie na |
|---|---|---|
| **Korpus** | ✅ Tak | Rdzeń ramy — podstawa dla wszystkiego innego |
| **Chwyt** | ✅ Tak | Bazowe prowadzenie / kontrola |
| **Lufa** | Opcjonalna | Obrażenia, zasięg |
| **Kolba** | Opcjonalna | Odrzut, stabilność |
| **Celownik** | Opcjonalny | Celność, mierzenie |

Korpus + Chwyt to działająca broń. Wszystko poza tym to wybór, co poświęcić w zamian za co.

## Przebieg składania

1. **Pięć typów komponentów** dostępnych do personalizacji.
2. **Interfejs warsztatu** z przeciąganiem, przyciąganiem do slotu i **statystykami na żywo**.
3. **96-slotowy ekwipunek** przeznaczony na części broni.
4. Trzy śledzone stany każdej części: **Świat**, **Ekwipunek** i **Złożona**.

```
  ŚWIAT  ──podnieś──▶  EKWIPUNEK  ──przeciągnij na warsztat──▶  ZŁOŻONA
  (w pokoju)           (96 slotów)                             (statystyki na żywo)
```

## Zamysł projektowy

Składanie powinno być **rytualne** — metaloplastyka, skupione światło, negatywna przestrzeń — a nie menu pasków statystyk. Fantazja to kobieta, która metodycznie buduje narzędzie pozwalające jej przetrwać jeszcze jeden powrót do labiryntu.

---

!!! info "Uwaga o wersji"
    Ten system odpowiada wcześniejszej wersji GDD Ariadny i jest tu przedstawiony jako nowoczesne, czytelne źródło dla zespołu. Dokładne wagi statystyk żyją w `PartRegistry` — wszelkie liczby tutaj traktuj jako zamysł, nie jako pewnik.
