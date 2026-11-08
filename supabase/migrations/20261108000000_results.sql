-- Wyniki gry Mahjong (Miki / Maks).
-- Można uruchomić wielokrotnie: niczego nie psuje ani nie duplikuje.

create table if not exists public.results (
  id           bigint generated always as identity primary key,
  client_id    text        not null unique,             -- id wyniku nadane na tablecie (chroni przed podwójnym wysłaniem)
  played_at    timestamptz not null,                    -- kiedy partia została ukończona
  player       text        not null check (player in ('Miki', 'Maks')),
  level        text        not null check (level in ('easy', 'medium', 'hard')),
  theme        text        not null check (char_length(theme) <= 20),
  time_seconds integer     not null check (time_seconds between 1 and 86400),
  hints        integer     not null default 0 check (hints    between 0 and 10000),
  undos        integer     not null default 0 check (undos    between 0 and 10000),
  shuffles     integer     not null default 0 check (shuffles between 0 and 10000),
  device       text        check (char_length(device) <= 40), -- losowy identyfikator tabletu
  created_at   timestamptz not null default now()          -- kiedy wynik dotarł do bazy
);

create index if not exists results_player_level_idx on public.results (player, level, time_seconds);
create index if not exists results_played_at_idx    on public.results (played_at desc);

-- Warstwa 1: uprawnienia. Klucz publiczny (rola anon) może tylko czytać i dodawać.
alter table public.results enable row level security;
revoke all on public.results from anon, authenticated;
grant select, insert on public.results to anon;

-- Warstwa 2: reguły RLS. Bez reguły dla UPDATE/DELETE te operacje są zablokowane.
drop policy if exists results_read   on public.results;
drop policy if exists results_insert on public.results;
create policy results_read   on public.results for select to anon using (true);
create policy results_insert on public.results for insert to anon with check (true);
