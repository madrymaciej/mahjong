# Mahjong 🀄

Mahjong-pasjans dla dzieci: obrazkowe kafelki (zwierzęta, jedzenie, zabawa, Liga Mistrzów), 3 poziomy trudności.
Gra działa w przeglądarce i można ją zainstalować na tablecie jak aplikację (PWA). Po pierwszym uruchomieniu działa bez internetu.

## Zasady
Dotknij dwóch takich samych **wolnych** kafelków, żeby je zdjąć. Kafelek jest wolny, gdy nic na nim nie leży
i ma pusty bok z lewej albo z prawej. Wygrywasz, gdy zdejmiesz wszystkie kafelki.

- 💡 Podpowiedź – miga pasująca para
- ↩️ Cofnij – cofa ostatni ruch
- ⏸️ Pauza – okienko z opcjami: Kontynuuj, Restart (ten sam układ od początku), Zakończ (powrót do menu głównego)
- 🎵 (czerwona nutka) – włącza i wyłącza muzykę w tle (własny motyw generowany w przeglądarce, bez plików audio)
- 🔀 Tasuj – miesza pozostałe kafelki (zawsze da się dokończyć; w razie potrzeby gra sama cofnie kilka ruchów)

Każde rozdanie jest generowane tak, żeby dało się je ułożyć do końca. Gra zapamiętuje rozpoczętą partię i rekordy czasu.

## Instalacja na tablecie
1. Otwórz adres gry (GitHub Pages) na tablecie.
2. **iPad (Safari):** przycisk Udostępnij → „Do ekranu początkowego”.
   **Android (Chrome):** menu ⋮ → „Dodaj do ekranu głównego” / „Zainstaluj aplikację”.

## Aktualizacja
Po zmianie plików podbij numer `CACHE` w `sw.js` (np. `mahjong-v2`), żeby tablety pobrały nową wersję.

## Zestaw „Liga Mistrzów”
36 klubów fazy ligowej Ligi Mistrzów 2026/27. Gra pokazuje herby klubów z pliku `herby/herby-liga-mistrzow.json`;
w menu można je wyłączyć – wtedy pokazuje własne tarcze w barwach klubów (tablica `CLUBS` w `index.html`).

### Prawa do herbów
Herby klubów są znakami towarowymi i utworami należącymi do ich właścicieli (klubów). Ten projekt nie jest
powiązany z żadnym klubem, UEFA ani FootyLogos i nie rości sobie żadnych praw do herbów. Pliki herbów pochodzą
z bazy [FootyLogos.com](https://www.footylogos.com/logo-usage-right) i są używane wyłącznie w prywatnej,
niekomercyjnej grze dla dzieci. Właściciel praw, który chce usunięcia herbu, może zgłosić to w Issues – zostanie usunięty.

## Gracze i wyniki
W menu głównym wybiera się gracza (Miki / Maks). Po każdej wygranej gra zapisuje: datę, gracza, poziom, zestaw obrazków,
czas, liczbę podpowiedzi i cofnięć. Tabela „🏆 Wyniki” ma filtry po graczu i poziomie; ⭐ oznacza rekord gracza na poziomie.

### Baza wyników (Supabase)
- Wynik zapisuje się najpierw na tablecie (localStorage `mj_results`), potem w tle trafia do tabeli `results` w Supabase.
  Bez internetu wynik czeka i wysyła się przy następnej okazji (start gry, powrót sieci, otwarcie wyników).
- Tabela wyników w grze pokazuje wyniki z obu tabletów (kopia z bazy w `mj_remote`).
- Schemat i reguły dostępu: `supabase/migrations/`. Klucz publiczny w kodzie może tylko czytać i dodawać (RLS + GRANT);
  zmiana i kasowanie – tylko w panelu Supabase.
- `.github/workflows/supabase-keepalive.yml` – codzienne zapytanie, żeby darmowy projekt nie został uśpiony.
