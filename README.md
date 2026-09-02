# Expense Tracker — Deploy to Vercel

Static site + free cloud sync (Supabase free tier). Login works on any device after setup.

## Deploy to Vercel (2 min)

### Option A — Dashboard (easiest)
1. Go to https://vercel.com/new
2. **Import Git Repository** → select `expense-tracker`
3. Framework Preset: **Other** → **Deploy**

### Option B — CLI
```bash
npm i -g vercel
cd Expense_Tracker
vercel
vercel --prod
```

## Login
- First visit: **Create Account** (username + password) — now supports unlimited users (fixed bug).
- Next visits: **Sign In** — same username + password on any device.
- Data is per account (`expense_tracker_v2_<username>`). Logout does NOT delete data.
- Credit: **made by mehta xd ✨** shown on login screen.

## Free Cloud Sync (Supabase — 100% free)

Without this, data stays per-browser (localStorage). With it, same login → same data on phone + laptop.

1. Go to https://supabase.com → Sign up (free) → **New Project** (free tier)
2. Project → **Settings → API** → copy **URL** and **anon public key**
3. In Supabase: **SQL Editor → New query** → paste contents of `supabase-setup.sql` → **Run**
4. Open your deployed site → login → in the **☁️ Cloud Sync** card, paste URL + anon key → **Connect & Sync**
5. Done — every change auto-syncs. Login from another device with same credentials → data appears.

> Free tier limits are generous for personal use. No credit card needed for Supabase free tier.

## Files
- `index.html` — app (auth + tracker + Supabase sync)
- `supabase-setup.sql` — run once in Supabase SQL Editor
- `vercel.json` — Vercel config
- `Expense Tracker.html` — original standalone (local use)
