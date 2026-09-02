-- Run this ONCE in Supabase SQL Editor (free tier)
-- Creates tables for cloud sync — one row per username

-- 1) Expense data (existing)
create table if not exists public.expense_data (
  username text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.expense_data enable row level security;
drop policy if exists "Allow all for anon" on public.expense_data;
create policy "Allow all for anon"
  on public.expense_data for all
  using (true)
  with check (true);
create index if not exists idx_expense_data_updated_at on public.expense_data (updated_at desc);

-- 2) User accounts — for login on any device (phone/laptop)
create table if not exists public.app_users (
  username text primary key,
  pass text not null,
  created_at timestamptz not null default now()
);
alter table public.app_users enable row level security;
drop policy if exists "Allow all for anon" on public.app_users;
create policy "Allow all for anon"
  on public.app_users for all
  using (true)
  with check (true);

-- 3) Papa view PINs — per username
create table if not exists public.papa_pins (
  username text primary key,
  pin_hash text not null,
  updated_at timestamptz not null default now()
);
alter table public.papa_pins enable row level security;
drop policy if exists "Allow all for anon" on public.papa_pins;
create policy "Allow all for anon"
  on public.papa_pins for all
  using (true)
  with check (true);
