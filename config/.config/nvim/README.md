# 🚀 dzgeek's Neovim IDE Configuration

> Blazing-fast, modern Neovim IDE powered by **LazyVim**, tailored for full-stack engineering with **TypeScript / React / Next.js / Astro / React Native / Python / FastAPI / Docker / SQL**.

---

## 📚 Documentation & Guides

| Document | Description |
| :--- | :--- |
| 📖 **[COURSE.md](file:///home/dzgeek/dotfiles/config/.config/nvim/COURSE.md)** | **Full Developer Workflow Course** — 10 modular chapters covering day-to-day coding, AI pairing, Git, APIs, databases, and a 7-day practice roadmap. |
| ⚡ **[CHEATSHEET.md](file:///home/dzgeek/dotfiles/config/.config/nvim/CHEATSHEET.md)** | **Fast Reference Cheat Sheet** — Desk reference with top 15 shortcuts, vim grammar, copilot micro-controls, and real-world power combos. |
| 🎯 **[KEYBINDINGS.md](file:///home/dzgeek/dotfiles/config/.config/nvim/KEYBINDINGS.md)** | **Master Keybindings Manual** — Exhaustive, verified catalog of every active shortcut organized by category. |

---

## 🛠️ Tech Stack & Key Features

- **AI Pair Programming**: GitHub Copilot with smart `<Tab>` resolution and popup completion in `blink.cmp`.
- **Modern Explorer**: Neo-tree docked on the **right side** (width 25) for stable multi-split layouts.
- **Precision Navigation**: Harpoon 2 file pinning, Flash 2-character jumps, and seamless `tmux` navigation (`<C-h/j/k/l>`).
- **LSP & Code Intelligence**: `vtsls` (TypeScript & React Native), `pyright` (Python), `tailwindcss`, `astro`, `prismals`, `dockerls` + Lspsaga hover docs, live incremental rename (`<leader>cr`), and code action previews (`<leader>ca`).
- **Formatting & Linting**: Auto-format on save with Prettier, Black, Stylua, and shfmt via Conform; fast linting with `eslint_d`, `actionlint` (GitHub Actions CI/CD), `hadolint`, and `shellcheck`.
- **Git Suite**: In-editor hunk staging (`gitsigns`), full-screen interactive Git TUI (`lazygit`), side-by-side diffs (`diffview`), and visual merge conflict resolution (`git-conflict`).
- **Full-Stack Tooling**: Kulala REST API client for `.http` files, Dadbod UI for SQL databases, and ToggleTerm.
