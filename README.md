# 🌱 EcoTrack — AI Sustainability Companion

> Built for **Virtual PromptWars**, hosted by **Hack2Skill** 🏆

EcoTrack is a single-file, front-end prototype of an AI-powered sustainability tracking app. It helps users monitor their carbon footprint, build eco-friendly habits, and get AI-driven recommendations — all in a clean, accessible interface inspired by a botanical field journal aesthetic (earthy tones, ledger-style tabs, warm typography).

## ✨ Features

- **Dashboard** — animated Eco Score ring, key metrics (carbon footprint, streak, challenges completed, trees-saved equivalent), and a feed of AI-generated tips
- **Activity Logger** — log transportation mode & distance, home energy/AC usage, diet type, and clothing choices, with a live estimated daily CO₂ total
- **Receipt Scanner** — mock OCR upload flow that itemizes purchases by category and carbon impact
- **Shopping Assistant** — side-by-side sustainability comparison between two products
- **Digital Wardrobe** — tracks clothing reuse and surfaces AI-suggested outfit combinations to encourage repeat-wear over fast fashion
- **EcoBot Chatbot** — simulated conversational assistant for sustainability Q&A
- **ML Forecast** — predicted next-month emissions with a source breakdown and reduction plan
- **Streaks & Badges** — gamified daily habit tracking
- **Leaderboard** — compare your Eco Score against friends, college, or city
- **Profile** — goals and progress bars

## 🛠️ Tech Stack

- Vanilla **HTML / CSS / JavaScript** — no frameworks, no build step
- Fonts: [DM Sans](https://fonts.google.com/specimen/DM+Sans) & [Syne](https://fonts.google.com/specimen/Syne) (Google Fonts, CDN)
- Icons: [Tabler Icons](https://tabler.io/icons) (CDN)

## 🚀 Usage

No install, no dependencies, no server required.

```bash
git clone https://github.com/<your-username>/ecotrack.git
cd ecotrack
open ecotrack_app_flow.html   # or just double-click the file
```

## ♿ Accessibility

- ARIA roles for tabs, tabpanels, progress bars, and live regions
- Full keyboard navigation (arrow keys, Home/End) across the nav tablist
- Skip-to-content link, visible focus states, screen-reader announcements
- Respects `prefers-reduced-motion` and `prefers-color-scheme` (light/dark)

## 🔒 Security

- Content-Security-Policy set via `<meta>` tag
- No `innerHTML` with dynamic/untrusted data — all text inserted via `textContent`
- Client-side file type/size validation on the receipt upload (note: this is a UX safeguard, not a substitute for server-side validation in a real deployment)

## ✅ Testing

- Lightweight self-test suite runs in the browser console on load, covering input clamping, safe-escaping, and core UI state transitions
- Not a substitute for a real test framework (Jest/Playwright) — see Known Limitations

## 📊 Honest Quality Assessment

This is a polished static prototype, not a production app. Self-graded "100%" claims would be misleading, so here's a realistic breakdown:

| Category | Score | Notes |
|---|---|---|
| Accessibility | ~90/100 | Strong ARIA/keyboard support; color contrast not verified with an automated tool |
| Security | ~80/100 | Solid frontend hygiene; CSP via meta tag is weaker than HTTP headers, no real backend to secure |
| Code Quality | ~85/100 | Clean and commented, but a single large file rather than modular components |
| Efficiency | ~75/100 | Lightweight CSS-driven animation, but loads external font/icon CDNs and ships dev-only test code |
| Testing | ~55/100 | Console-based sanity checks only — no real automated test suite or CI |

## 📋 Known Limitations

- No backend — all data is static/mocked (receipts, leaderboard, forecasts, chatbot replies)
- Single HTML file (~900+ lines) rather than a modular component structure
- No build pipeline — fonts/icons loaded unminified from CDN
- Self-test suite should be removed or gated behind a flag before any production use

## 🏆 Acknowledgments

This project was built as a submission for **Virtual PromptWars**, organized by **[Hack2Skill](https://hack2skill.com/)**.

## 📄 License

MIT — feel free to use, modify, and build on this prototype.

---

*Built as a UI/UX prototype exploring sustainability tracking, gamification, and accessible front-end engineering.*
