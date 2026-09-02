-- Run this ONCE in Supabase SQL Editor (free tier)
-- Creates table for cloud sync — one row per username

create table if not exists public.expense_data (
  username text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

-- Allow anyone with anon key to read/write their own row
-- (simple for personal tracker — for stricter auth, add Supabase Auth later)
alter table public.expense_data enable row level security;

drop policy if exists "Allow all for anon" on public.expense_data;
create policy "Allow all for anon"
  on public.expense_data for all
  using (true)
  with check (true);

-- Optional: index for faster lookup
create index if not exists idx_expense_data_updated_at on public.expense_data (updated_at desc);
