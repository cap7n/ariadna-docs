# 02 · Pętla rozgrywki

> **Wejdź → Przetrwaj → Zbierz → Wróć silniejsza.**

Cała gra to jeden cykl, zacieśniony przez to, że sama przestrzeń jest niestabilna. Gracz nigdy po prostu nie przechodzi przez poziom — wciąż na nowo decyduje, czy wedrzeć się w nieznane, czy wycisnąć więcej ze znanego za wyższą cenę.

## Wejdź

Pokoje nie istnieją, dopóki Ariadna do nich nie wejdzie. **Materializują się w czasie rzeczywistym**, a każdy niesie własny bieżący poziom. Przejście przez drzwi to zobowiązanie: pokój, który składa się po drugiej stronie, jest wyskalowany do tego, ile razy był odwiedzony.

## Przetrwaj

Po wejściu gracz musi utrzymać przestrzeń. Przeciwnicy, zagrożenia i zachowanie pokoju skalują się z jego poziomem. Główne napięcie: **pokój, który już przeszłaś, to nie ten sam pokój, który zastaniesz przy następnej wizycie** — to jego trudniejsza wersja w tej samej skórze.

## Zbierz

Przetrwanie się opłaca. Nagrody przychodzą jako:

- **Części broni** zasilające modułowy system uzbrojenia.
- **Fragmenty fabuły**, które uzupełniają historię Ariadny.
- **Lepszy łup przy ponownych wizytach** — wyższe poziomy pokoi dają lepsze części.

## Wróć silniejsza

Z dowolnego punktu gracz wybiera swoją kolejną presję:

- Wejdź ponownie do znanego pokoju po twardszych przeciwników i lepsze nagrody.
- Wedrzyj się do niezbadanego pokoju po łup za pierwsze przejście i fabułę.
- Zmierz się z **bossem**, awansując poziom, który nigdy się nie resetuje.

Każdy wybór gdzieś podnosi stawkę. Nie istnieje ruch, który obniża ogólną temperaturę przebiegu.

---

```
        ┌───────────────────────────────────────────┐
        │                                           │
        ▼                                           │
   ┌─────────┐   ┌──────────┐   ┌───────────┐   ┌────┴─────┐
   │  WEJDŹ  │──▶│ PRZETRWAJ│──▶│   ZBIERZ  │──▶│   WRÓĆ   │
   │ (spawn) │   │ (skala)  │   │  (łup)    │   │silniejsza│
   └─────────┘   └──────────┘   └───────────┘   └──────────┘
```

!!! tip "Dlaczego to działa"
    Ponieważ pokoje awansują z wizytami, rosnąca moc gracza wciąż ściga się z rosnącym zagrożeniem pokoju. Pętla pozostaje napięta, dopóki żadna ze stron nie ucieknie z nią za daleko — zobacz [Filary projektu](pillars.md).
