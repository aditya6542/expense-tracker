# Expense Tracker — Deploy to Vercel

Static site — no backend needed. Login is handled in the browser (per-device).

## Deploy in 2 minutes

### Option A — Vercel Dashboard (easiest)
1. Go to https://vercel.com/new
2. Click **Add New → Project → Browse** and upload / drag the `Expense_Tracker` folder
   - Or push this folder to GitHub first, then **Import Git Repository**
3. Framework Preset: **Other** (it's a static site)
4. Click **Deploy** — done. You'll get a `https://your-project.vercel.app` URL.

### Option B — Vercel CLI
```bash
npm i -g vercel
cd Expense_Tracker
vercel        # follow prompts
vercel --prod # deploy to production
```

## Login
- First visit shows **Create Account** — pick a username + password (stored locally in the browser).
- Next visits show **Sign In**.
- Data is stored **per account** in `localStorage` (key `expense_tracker_v2_<username>`), so each username has its own months/expenses.
- **Logout** is in the top bar. Clearing browser site data resets the account.

> Note: This is a client-side login (no server). It's great for a personal / family tracker on Vercel. For real multi-user auth, add Vercel Auth / Supabase / Firebase later — the UI is ready for it.

## Files
- `index.html` — the whole app (auth + tracker)
- `vercel.json` — Vercel config (clean URLs + security headers)
- `Expense Tracker.html` — original standalone file (kept for local use)
