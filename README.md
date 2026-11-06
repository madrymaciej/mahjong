# Mahjong 🀄

Mahjong-pasjans dla dzieci: obrazkowe kafelki (zwierzęta, jedzenie, zabawa), 3 poziomy trudności.
Gra działa w przeglądarce i można ją zainstalować na tablecie jak aplikację (PWA). Po pierwszym uruchomieniu działa bez internetu.

## Zasady
Dotknij dwóch takich samych **wolnych** kafelków, żeby je zdjąć. Kafelek jest wolny, gdy nic na nim nie leży
i ma pusty bok z lewej albo z prawej. Wygrywasz, gdy zdejmiesz wszystkie kafelki.

- 💡 Podpowiedź – miga pasująca para
- ↩️ Cofnij – cofa ostatni ruch
- 🔀 Tasuj – miesza pozostałe kafelki (zawsze da się dokończyć; w razie potrzeby gra sama cofnie kilka ruchów)

Każde rozdanie jest generowane tak, żeby dało się je ułożyć do końca. Gra zapamiętuje rozpoczętą partię i rekordy czasu.

## Instalacja na tablecie
1. Otwórz adres gry (GitHub Pages) na tablecie.
2. **iPad (Safari):** przycisk Udostępnij → „Do ekranu początkowego”.
   **Android (Chrome):** menu ⋮ → „Dodaj do ekranu głównego” / „Zainstaluj aplikację”.

## Aktualizacja
Po zmianie plików podbij numer `CACHE` w `sw.js` (np. `mahjong-v2`), żeby tablety pobrały nową wersję.
