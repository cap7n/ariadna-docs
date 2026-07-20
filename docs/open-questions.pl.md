# Otwarte pytania

> Pomysły, które nie są jeszcze przesądzone, ale wymagają decyzji. Różni się to od [Logu decyzji](decisions.md): tamta strona zapisuje to, co już zdecydowaliśmy i dlaczego; ta strona przechowuje to, czego jeszcze nie zdecydowaliśmy.

Gdy pytanie na tej stronie zostanie rozstrzygnięte, przenieś je do [Logu decyzji](decisions.md) jako nowy, datowany wpis i usuń je stąd. Nie pozwól, by rozstrzygnięte pytania się tu piętrzyły; ta lista powinna zawsze być na tyle krótka, by dało się ją realnie przeczytać.

## Jak dodać pytanie

Skopiuj blok, uzupełnij, wstaw najnowsze na górze:

```markdown
### Krótki tytuł
**Pytanie:** co trzeba zdecydować, w jednym zdaniu.
**Dlaczego jest otwarte:** napięcie lub kompromis, przez który trudno po prostu wybrać.
**Opcje na stole:** realne warianty wyboru, krótko.
**Odpowiedzialny:** kto powinien podjąć decyzję (lub "nieprzypisany").
```

## Pytania

### Przestrzenny miks muzyki dla immersji
**Pytanie:** czy różne instrumenty powinny być umiejscowione w różnych pozycjach wokół pokoju, aby stworzyć efekt stereo i "push", zamiast płaskiego miksu stereo?
**Dlaczego jest otwarte:** przestrzenna muzyka może pogłębić immersję i dezorientację — co pasuje do klimatu horroru — ale zwiększa złożoność produkcji (układy miksu per pokój) i ryzykuje konflikt z dźwiękami rozgrywki.
**Opcje na stole:** płaski miks stereo (najprostszy), przestrzenna 3D z instrumentami zakotwiczonymi w geometrii pokoju, albo hybryda gdzie tylko wybrane warstwy atmosferyczne są przestrzenne, a główne ścieżki rytmu/napięcia pozostają w stereo.
**Odpowiedzialny:** nieprzypisany.

### Ostateczne wagi statystyk części broni
**Pytanie:** jakie wartości obrażeń / celności / odrzutu / wagi powinna faktycznie nieść każda wersja części?
**Dlaczego jest otwarte:** instalacja [modułowego systemu broni](guns.md) jest gotowa, ale liczby to wciąż placeholdery. Złe ustawienie sprawi, że albo każdy zestaw będzie odczuwalny tak samo, albo jedna kombinacja części stanie się jednoznacznie najlepsza.
**Opcje na stole:** ręczne dostrajanie „na wyczucie” podczas playtestów, albo najpierw naszkicowanie modelu w arkuszu (punkty budżetowe na część, jak mini gear score) i dostrajanie od tego punktu.
**Odpowiedzialny:** nieprzypisany.

### Kiedy usunąć pływające liczby obrażeń
**Pytanie:** w którym momencie usuwamy popupy obrażeń przy trafieniu?
**Dlaczego jest otwarte:** są oznaczone w [Backlogu](backlog.md) jako narzędzie tylko do playtestów. Testerzy wprost poprosili o nie, by dostroić balans, ale pozostawienie ich psuje klimat psychologicznego horroru po premierze (patrz [Filary projektu](pillars.md)). Usunięcie zbyt wcześnie utrudnia pracę nad balansem; usunięcie zbyt późno grozi, że zostaną na stałe przez bezwładność.
**Opcje na stole:** powiązanie usunięcia z konkretnym kamieniem milowym (np. po zatwierdzeniu [Pętli rozgrywki grywalnej](scope.md)), albo schowanie ich za flagą debug, żeby łatwo było je zachować wewnętrznie po tym, jak znikną z wersji wydawanej graczom.
**Odpowiedzialny:** nieprzypisany.

### Krzywa nagród za ponowne wizyty
**Pytanie:** o ile lepszy powinien być łup przy powtórnych wizytach w pokoju, względem tego, o ile trudniejszy staje się pokój?
**Dlaczego jest otwarte:** pokoje skalują przeciwników / zagrożenia przy każdej ponownej wizycie ([Pokoje](rooms.md)), a to ma się opłacać, tylko że „opłacać się” nie jest jeszcze zdefiniowane. Zbyt hojnie i ponowna wizyta trywializuje eksplorację; zbyt skąpo i ponowna wizyta nie jest warta ryzyka, co podcina [Pętlę rozgrywki](loop.md).
**Opcje na stole:** łup skaluje się liniowo z poziomem pokoju, łup skaluje się skokowo przy konkretnych progach poziomu, albo zmienia się typ łupu (nie tylko ilość/jakość), tak by pokój poziomu 5 dawał coś, czego pokój poziomu 1 dać nie może.
**Odpowiedzialny:** nieprzypisany.

### Bramkowanie i tempo poziomów bossa
**Pytanie:** co powstrzymuje gracza przed wejściem na poziom bossa, którego nie jest w stanie pokonać, i zablokowaniem poczucia postępu, skoro [poziom nigdy się nie resetuje](boss.md)?
**Dlaczego jest otwarte:** pokój bossa jest z założenia zawsze otwarty, a poziomy są trwałe po ukończeniu. O to właśnie chodzi (narastająca presja), ale to też oznacza, że zła decyzja o zbyt wczesnym wejściu na wyższy poziom nie ma naturalnego cofnięcia.
**Opcje na stole:** łagodne ostrzeżenie przed wejściem na poziom znacznie przewyższający obecny sprzęt/postęp gracza, twarda blokada powiązana z kamieniem milowym (np. minimalna suma statystyk broni), albo pozostawienie tego w pełni otwartym i traktowanie złego wejścia jako ważnego, choć bolesnego, wyboru gracza.
**Odpowiedzialny:** nieprzypisany.

---

!!! tip "Trzymaj to krótko"
    Ta strona działa najlepiej jako żywy brudnopis, nie archiwum. Jeśli pytanie leży tu już jakiś czas z jasną odpowiedzią, po prostu zdecyduj, zapisz to w [Logu decyzji](decisions.md) i usuń je stąd.
