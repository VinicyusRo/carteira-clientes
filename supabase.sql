-- Carteira do Vinicyus: uma linha por usuário com todos os dados da carteira
create table if not exists public.carteira (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.carteira enable row level security;

-- Cada usuário só enxerga e altera a própria linha
create policy "ler a propria carteira" on public.carteira
  for select using (auth.uid() = user_id);
create policy "criar a propria carteira" on public.carteira
  for insert with check (auth.uid() = user_id);
create policy "alterar a propria carteira" on public.carteira
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
