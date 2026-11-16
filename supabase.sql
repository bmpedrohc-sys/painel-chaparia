-- Rode este script uma vez no Supabase: SQL Editor → New query → colar → Run

create table if not exists public.painel_dados (
  chave         text primary key,
  dados         text not null,
  atualizado_em timestamptz not null default now()
);

-- Row Level Security: o painel acessa com a chave pública (anon),
-- então liberamos leitura, criação e atualização para ela.
-- Não há política de DELETE: ninguém apaga registros pelo painel.
alter table public.painel_dados enable row level security;

drop policy if exists "painel leitura"     on public.painel_dados;
drop policy if exists "painel inserir"     on public.painel_dados;
drop policy if exists "painel atualizar"   on public.painel_dados;

create policy "painel leitura"   on public.painel_dados for select to anon using (true);
create policy "painel inserir"   on public.painel_dados for insert to anon with check (true);
create policy "painel atualizar" on public.painel_dados for update to anon using (true) with check (true);
