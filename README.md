# Velzone Granito — PO Tracker

Production tracking PWA for Velzone Granito purchase orders.

## Setup Guide (3 Steps)

---

### STEP 1: Create Supabase Database (5 minutes)

1. Go to **https://supabase.com** → Click **"Start your project"**
2. Sign up with your **GitHub account** (create GitHub first if needed — Step 2)
3. Click **"New Project"**
   - Organization: your default org
   - Project name: `velzone-tracker`
   - Database password: choose a strong password (save it!)
   - Region: pick the closest to you (e.g., Mumbai for India)
   - Click **"Create new project"** — wait 1-2 minutes

4. Once ready, go to **SQL Editor** (left sidebar)
   - Click **"New query"**
   - Copy-paste the ENTIRE contents of `supabase-schema.sql` file
   - Click **"Run"** (or Ctrl+Enter)
   - You should see "Success" message

5. Get your API credentials:
   - Go to **Settings** (gear icon, left sidebar) → **API**
   - Copy **Project URL** — looks like `https://xxxxx.supabase.co`
   - Copy **anon public key** — starts with `eyJhbGciOi...`
   - Keep these — you'll enter them in the app later

---

### STEP 2: Push Code to GitHub (5 minutes)

1. Go to **https://github.com** → Sign up or log in

2. Click the **"+"** button (top right) → **"New repository"**
   - Repository name: `velzone-tracker`
   - Keep it **Public** (needed for free Vercel)
   - Do NOT add README (we already have one)
   - Click **"Create repository"**

3. You'll see a page with instructions. Now upload the files:

   **Option A — Upload via browser (easiest):**
   - On the repo page, click **"uploading an existing file"** link
   - Drag ALL files from the unzipped folder into the upload area:
     ```
     velzone-tracker/
     ├── public/
     │   ├── index.html
     │   ├── manifest.json
     │   ├── sw.js
     │   ├── icon-192.png
     │   └── icon-512.png
     ├── vercel.json
     ├── supabase-schema.sql
     ├── .gitignore
     └── README.md
     ```
   - IMPORTANT: Upload the **folder structure** — the `public` folder must stay as a folder
   - Click **"Commit changes"**

   **Option B — Upload via command line (if you know Git):**
   ```bash
   cd velzone-tracker
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/velzone-tracker.git
   git push -u origin main
   ```

---

### STEP 3: Deploy on Vercel (3 minutes)

1. Go to **https://vercel.com** → Sign up with **GitHub**

2. Click **"Add New..."** → **"Project"**

3. Find **velzone-tracker** in your repository list → Click **"Import"**

4. Settings (keep defaults, just verify):
   - Framework Preset: **Other**
   - Root Directory: `./` (leave empty)
   - Build Command: (leave empty)
   - Output Directory: `public`
   - Click **"Deploy"**

5. Wait 30-60 seconds — your site is LIVE!
   - You'll get a URL like: `https://velzone-tracker.vercel.app`
   - Click it to open your app

---

### STEP 4: First Time App Setup (1 minute)

1. Open your Vercel URL in Chrome (mobile or desktop)

2. You'll see the **"Connect to Supabase"** screen

3. Enter:
   - **Supabase Project URL**: paste from Step 1
   - **Supabase Anon Key**: paste from Step 1
   - Click **"Connect"**

4. You're in! Start uploading POs.

---

### Install as Mobile App

1. Open the URL on your phone in **Chrome**
2. Tap the **menu (⋮)** → **"Add to Home screen"** or **"Install app"**
3. The app icon appears on your home screen
4. It opens fullscreen like a native app

### Install on Desktop

1. Open the URL in **Chrome** on your computer
2. Click the **install icon** (⊕) in the address bar
3. App opens as a standalone window

---

## Features

- Upload Excel PO files → auto-extract all data + tile images
- Track: Design Matching → QC → Production Boxes → Pallet Packing
- Dashboard with factory grouping and finishing filters
- PO Timeline with age tracking and delay warnings
- Nicknames for POs (customer/project names)
- Delete individual designs from POs
- Box count comparison (PO vs Production with +/- diff)
- Works on mobile, tablet, and desktop
- Data syncs across all devices via Supabase
- Works offline after first load

---

## Custom Domain (Optional)

To use your own domain like `tracker.velzonegranito.com`:

1. In **Vercel** → Your project → **Settings** → **Domains**
2. Add your domain
3. Update DNS at your domain provider as shown

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| "Connect to Supabase" keeps showing | Check URL and Key are correct in Supabase → Settings → API |
| Images not loading | Some Excel files use EMF format — the app handles these automatically |
| PO not parsing | Check that the Excel has the standard Velzone PO format |
| Offline not working | Open the app once while online, then it works offline |
