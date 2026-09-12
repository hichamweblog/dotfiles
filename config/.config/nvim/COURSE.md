# 🎓 Neovim Masterclass: Day-to-Day Developer Workflow Course

> **Your Setup**: Custom LazyVim Environment by **dzgeek**  
> **Tech Stack**: TypeScript · React / Next.js / Astro · React Native & Expo · Python / FastAPI · Tailwind CSS · SQL · Docker  
> **Reference Docs**: [CHEATSHEET.md](file:///home/dzgeek/dotfiles/config/.config/nvim/CHEATSHEET.md) · [KEYBINDINGS.md](file:///home/dzgeek/dotfiles/config/.config/nvim/KEYBINDINGS.md)

---

## 📖 Welcome to Your IDE
You have turned Neovim into a modern, blazing-fast, AI-accelerated IDE that outperforms VSCode in speed, ergonomics, and productivity.

This course is designed to take you from basic typing to **fluid, subconscious development**. It is organized into 10 practical modules that follow a real software engineer's workday.

---

## 📚 Course Curriculum

- [Module 1: Mental Model & The Vim Philosophy](#module-1-mental-model--the-vim-philosophy)
- [Module 2: The Morning Routine — Opening, Sessions & Projects](#module-2-the-morning-routine--opening-sessions--projects)
- [Module 3: File Navigation & The 4-File Mental Model](#module-3-file-navigation--the-4-file-mental-model)
- [Module 4: Writing Code at Speed — Copilot, Autocomplete & Snippets](#module-4-writing-code-at-speed--copilot-autocomplete--snippets)
- [Module 5: Precision Editing — Text Objects, Multi-Cursor & Surround](#module-5-precision-editing--text-objects-multi-cursor--surround)
- [Module 6: IDE Intelligence — LSP, Lspsaga & Refactoring](#module-6-ide-intelligence--lsp-lspsaga--refactoring)
- [Module 7: Formatting, Linting & Error Triage](#module-7-formatting-linting--error-triage)
- [Module 8: The Git Flow — Hunks, LazyGit & Resolving Conflicts](#module-8-the-git-flow--hunks-lazygit--resolving-conflicts)
- [Module 9: Full-Stack Toolkit — APIs (Kulala), Databases (Dadbod) & Terminals](#module-9-full-stack-toolkit--apis-kulala-databases-dadbod--terminals)
- [Module 10: Deep Work, UI Customization & Troubleshooting](#module-10-deep-work-ui-customization--troubleshooting)
- [Bonus: The 7-Day Muscle Memory Roadmap](#bonus-the-7-day-muscle-memory-roadmap)

---

## Module 1: Mental Model & The Vim Philosophy

### 1. The Core Insight: Reading > Typing
In modern software engineering, you spend **80% of your time reading and navigating code**, and only **20% typing new characters**. 

Standard editors treat you like you are always in "typewriter" mode:
- Moving around requires lifting your hands to use the arrow keys or mouse.
- Selecting text requires dragging a cursor.
- Renaming requires multiple clicks and dialogs.

Neovim is **modal**:
- **Normal Mode (`Esc`)**: Your default state. Every single key on your keyboard is a precision laser tool for jumping, deleting, copying, and manipulating structure.
- **Insert Mode (`i`)**: You enter this mode exclusively when typing code, then immediately hit `Esc` or `<C-s>` to return home.
- **Visual Mode (`v` / `V` / `<C-v>`)**: For highlighting text blocks or columnar editing.

### 2. The Grammar of Vim: Speak in Sentences
Never think in keystrokes. Think in **verbs + counts + nouns**:

$$\text{Action} = \text{Verb (Operator)} + [\text{Count}] + \text{Noun (Text Object / Motion)}$$

- **Verb (Operator)**:
  - `d` = delete (cut)
  - `c` = change (delete and enter Insert mode)
  - `y` = yank (copy)
  - `v` = visually select
- **Noun (Text Object)**:
  - `iw` = inner word
  - `i"` = inside quotes
  - `i(` = inside parentheses
  - `it` = inside HTML/JSX tag
  - `ap` = around paragraph

**Examples**:
- `di"` $\rightarrow$ "Delete inside quotes"
- `ciw` $\rightarrow$ "Change inner word"
- `yat` $\rightarrow$ "Yank around JSX tag"
- `c3w` $\rightarrow$ "Change next 3 words"

Once this clicks, you never memorize random shortcuts again. You construct sentences.

---

## Module 2: The Morning Routine — Opening, Sessions & Projects

### 1. Launching Neovim
From your terminal:
```bash
# Open in current repository
nvim .

# Or open directly to a specific file
nvim src/app/page.tsx
```

You are greeted by the **Doom Dashboard** showing fast launch metrics and quick action buttons.

### 2. Restoring Yesterday's Workspace in 1 Second
Never waste time reopening the 6 files you were working on yesterday:
- Press `<leader>qs` (**Quit/Session $\rightarrow$ Restore Session**).
- All your window splits, open buffer tabs, and cursor positions are restored instantly via `persistence.nvim`!
- Need the session from a previous directory? Press `<leader>ql` (**Restore Last Session**).

### 3. Finding What You Need
- **Open any file**: Press `<leader><space>`. Start typing characters from the path (e.g. `patsx` for `page.tsx` or `usco` for `user.controller.ts`). Hit `<CR>` to open.
- **Recent files**: Press `<leader>fr` (**File $\rightarrow$ Recent**).
- **Search by code content**: Press `<leader>fg` (**File $\rightarrow$ Live Grep**). Type any string or function name.

---

## Module 3: File Navigation & The 4-File Mental Model

### 1. The Neo-tree Sidebar (Docked on the Right)
In this setup, Neo-tree is positioned on the **right side** with a clean width of **25 columns**.

**Why the right side?**
When editing code on wide monitors, your active code buffer stays firmly centered. Opening and closing the file tree on the right doesn't shove your main split back and forth!

- **Toggle Tree**: Press `<leader>e`
- **Focus Tree**: Press `<leader>o`
- **Inside the Tree**:
  - `l` or `<CR>`: Open file or expand folder.
  - `h`: Collapse folder or jump up to parent directory.
  - `v`: Open file in **vertical split**.
  - `s`: Open file in **horizontal split**.
  - `a`: Create new file. **Pro-tip**: You can create nested folders on the fly! Type `components/ui/Badge.tsx` and hit Enter; all subfolders are created automatically.
  - `d`: Delete file (with safety confirmation).
  - `r`: Rename file inline.
  - `P`: Toggle floating preview window.

### 2. The Harpoon 2 Mental Model (Zero-Lag Workflow)
Tabs are an anti-pattern when you have 40 files open. You end up hunting through a crowded bar.

Instead, use **The Rule of 4**: In any feature, you typically cycle between only 3 or 4 files:
1. The View (`page.tsx`)
2. The Hook or API (`useUser.ts` or `route.ts`)
3. The Database Schema or Model (`schema.prisma` or `models.py`)
4. The Configuration or Environment (`.env` or `types.ts`)

**How to use Harpoon**:
1. Open `page.tsx` $\rightarrow$ press `<leader>ha` (Harpoon: Add).
2. Open `route.ts` $\rightarrow$ press `<leader>ha`.
3. Open `schema.prisma` $\rightarrow$ press `<leader>ha`.
4. Now, forget file trees and tabs!
   - Tap `<leader>h1` to jump to `page.tsx`
   - Tap `<leader>h2` to jump to `route.ts`
   - Tap `<leader>h3` to jump to `schema.prisma`
   - Press `<leader>hh` to see your dashboard or reorder files.

### 3. Buffer Tabs Management
If you prefer tabs, `bufferline.nvim` is already running at the top:
- Switch tabs: `<S-l>` (next) / `<S-h>` (previous) or `]b` / `[b`
- Pin important tab: `<leader>bp`
- Clean clutter: `<leader>bP` (close all non-pinned tabs) or `<leader>bo` (close all other tabs)
- Close active tab safely: `<leader>bd` (uses `mini.bufremove` so your split windows don't collapse!)

---

## Module 4: Writing Code at Speed — Copilot, Autocomplete & Snippets

### 1. GitHub Copilot: The Smart `<Tab>` Workflow
Your setup has GitHub Copilot integrated into `blink.cmp` with an intelligent `<Tab>` resolver:

```text
You press <Tab> in Insert mode:
  ├─> 1. Does Copilot have ghost text on screen?
  │      └─ Yes ──> Accepts Copilot suggestion!
  ├─> 2. Are you inside an active snippet placeholder?
  │      └─ Yes ──> Jumps to next snippet parameter stop!
  └─> 3. Neither?
         └─ Inserts a regular indent tab.
```

#### Copilot Micro-Controls:
- **Don't want the whole multi-line block?**
  - Press `<C-Right>`: Accepts only the **next word**.
  - Press `<C-Down>`: Accepts only the **next line**.
- **Alternative accept**: `<C-j>`
- **Cycle alternatives**: `<M-]>` (next suggestion), `<M-[>` (previous suggestion)
- **Dismiss suggestion**: `<M-\>`

### 2. Autocomplete with `blink.cmp`
As you type, `blink.cmp` generates instant suggestions from:
- Active Language Server (TypeScript, Python, Astro, etc.)
- Buffer words
- File paths
- Snippets
- Copilot completions (boosted with high priority score offset)

Navigate with `<C-n>` / `<C-p>` or `<Down>` / `<Up>`, and press `<CR>` or `<Tab>` to accept.

### 3. Expanding Snippets
Your config has pre-loaded snippets for React, TSX, Next.js, Python, and Astro:
- In a `.tsx` file, type `rfc` or `rafce` + `<Tab>` to generate a full functional component.
- In a Python file, type `def` or `class` + `<Tab>`.
- Use `<Tab>` and `<S-Tab>` to hop forward and backward through parameters.

---

## Module 5: Precision Editing — Text Objects, Multi-Cursor & Surround

### 1. Surgical Text Objects
Stop using the backspace key! Use structural replacements:

| Scenario | Keystrokes | What Happens |
| :--- | :--- | :--- |
| Inside `const title = "Welcome to our shop";` | `ci"` | Wipes the text inside quotes and puts you in Insert mode ready to type |
| Inside `<button className="btn-primary">Click</button>` | `cit` | Deletes `Click` so you can type new JSX children |
| Want to change entire JSX element | `dat` | Deletes `<button ...>Click</button>` entirely |
| Inside `function calculate(a: number, b: number)` | `ci(` | Wipes all parameters |
| Inside `if (valid) { doSomething(); return true; }` | `ci{` | Wipes the entire body between `{ }` |

### 2. Multi-Cursor Editing (`vim-visual-multi`)
Like VSCode `Ctrl+D`, but much more capable:
1. Place cursor on any variable or class name (e.g. `item`).
2. Press `<C-n>` $\rightarrow$ First match highlighted.
3. Press `<C-n>` again $\rightarrow$ Next match highlighted.
4. Press `<C-n>` again $\rightarrow$ Third match highlighted.
5. Want to skip one? Press `<C-x>` to jump over it without selecting!
6. Press `c` to change all of them at once, type the new name, and hit `<Esc>`.
7. Done! All cursors synchronize automatically. Press `q` to exit.

### 3. Surround Operations (`mini.surround`)
Manipulating enclosing characters is effortless:

```text
Original:    user_id
Press:       gsaiw"
Result:      "user_id"

Original:    "user_id"
Press:       gsr"'
Result:      'user_id'

Original:    'user_id'
Press:       gsd'
Result:      user_id

Original:    <h1>Hello World</h1>
Press:       gsdt
Result:      Hello World

Original:    title
Press:       gsaiwt  (enter tag: span)
Result:      <span>title</span>
```

### 4. Tailwind CSS Quality of Life
Long Tailwind strings clutter your screen. Your setup provides:
- **Toggle Tailwind Conceal**: Press `<leader>uT`. Lengthy utility classes collapse into a clean icon (`󱏿`). Put your cursor over them to expand!
- **Colorizer**: Hex colors like `#38bdf8` or `rgb(...)` automatically display with their true background color highlighted directly in your editor.

---

## Module 6: IDE Intelligence — LSP, Lspsaga & Refactoring

### 1. Code Navigation & Discovery
- **Hover documentation**: Press `K` (Lspsaga hover popup). Shows full TypeScript types, function signatures, docstrings, and parameter types.
- **Go to Definition**: Press `gd` (Lspsaga). Directly opens the symbol declaration.
- **Peek Definition**: Press `gp`. Opens a floating preview window so you can read the implementation **without leaving your current file**!
- **Find all References**: Press `gr`. Telescope opens a floating list of everywhere that function, variable, or type is used.
- **LSP Finder**: Press `<leader>cf`. Opens a combined view of all definitions and references.
- **Symbol Outline**: Press `<leader>co`. Opens a floating breadcrumb outline of all functions, hooks, and types in the current file.

### 2. Live Incremental Rename (VSCode F2 Replacement)
1. Position cursor on any function or variable name.
2. Press `<leader>cr`.
3. An inline input prompt appears with the current name pre-filled.
4. Type your new name. As you type, every reference in the file updates in real time!
5. Hit `<CR>` to apply across all files in the project.

### 3. Code Actions with Preview
1. Place cursor on a line with an error, warning, or refactoring opportunity.
2. Press `<leader>ca`.
3. A visual picker opens with a **live diff preview** of what each action will do (e.g. "Add missing import", "Convert to async function", "Extract component").
4. Select with `<CR>`.

### 4. Auto-Importing Missing Symbols
- In TypeScript or React, type a hook or component name (e.g. `useEffect`).
- Press `<leader>ci` (**Code $\rightarrow$ Import**).
- Neovim detects the missing symbol and generates the correct `import` statement at the top of the file automatically!

### 5. Automated Refactoring (`refactoring.nvim`)
- **Extract Function**: Select a block of JSX or logic in Visual mode (`v`), then press `<leader>re`. Neovim extracts it into a standalone function!
- **Extract Function to File**: Select in Visual mode, press `<leader>rf`.
- **Extract Variable**: Select expression, press `<leader>rv`.
- **Inline Variable**: Cursor on variable, press `<leader>ri`.

---

## Module 7: Formatting, Linting & Error Triage

### 1. Zero-Friction Formatting with Conform
Your editor is configured with official project formatters:
- **JS / TS / React / Next / Astro / CSS / HTML**: Prettier (`--single-quote`, `--tab-width 2`, `--print-width 100`)
- **Python / FastAPI**: Black (`--line-length 100`, `--fast`)
- **Lua**: Stylua
- **Shell**: shfmt (`-i 2 -ci`)
- **SQL**: sql-formatter

**Usage**:
- **Manual format**: Press `<leader>cf`.
- **Format on save**: Enabled by default! Toggle it on/off with `<leader>uf`.

### 2. Linting Engine (`nvim-lint`)
Runs automatically in the background:
- `eslint_d` for JavaScript/TypeScript (runs as a daemon, 10x faster than standard eslint).
- `actionlint` for GitHub Actions workflows (`.github/workflows/*.yml`).
- `hadolint` for Dockerfiles.
- `shellcheck` for Bash scripts.
- `markdownlint` for markdown documentation.

### 3. Navigating Errors & Diagnostics
- **Next Error/Warning**: Press `]d`
- **Previous Error/Warning**: Press `[d`
- **Inspect Line Error**: Press `<leader>cd` (Lspsaga popup) or `<leader>do` (standard float)
- **Trouble Diagnostics Workspace**: Press `<leader>xx`
  - A bottom tray opens grouping all project errors by file.
  - Navigate with `j`/`k`, press `<CR>` to jump directly to the line.
  - Press `<leader>xX` to filter only to the current buffer.
- **Find TODO / FIXME comments**: Press `<leader>ft` to search all `TODO:`, `FIXME:`, `HACK:` tags across your repository.

---

## Module 8: The Git Flow — Hunks, LazyGit & Resolving Conflicts

### 1. In-Editor Hunk Staging (`gitsigns.nvim`)
You don't need to leave Neovim to manage git changes:
- Look at the left gutter: colored bars (`▎`) show added, modified, or deleted lines.
- **Jump to next change**: Press `]h`
- **Jump to previous change**: Press `[h`
- **Preview what changed**: Press `<leader>hp` (inline diff popup)
- **Stage just this hunk**: Press `<leader>hs` (in Normal mode or highlight in Visual mode)
- **Revert / Reset this hunk**: Press `<leader>hr`
- **Who wrote this line?**: Press `<leader>hb` for full blame, or toggle virtual text blame with `<leader>gB`.

### 2. LazyGit: The Terminal Git Beast
For commits, branch switching, rebasing, and pushing:
- Press `<leader>gg` (**Git $\rightarrow$ LazyGit**).
- A full-screen TUI appears inside Neovim:
  - Press `1` for Status, `2` for Files, `3` for Branches, `4` for Commits, `5` for Stash.
  - Press `space` on files to stage/unstage.
  - Press `c` to write a commit message.
  - Press `P` (Shift+P) to push to remote.
  - Press `p` to pull from remote.
  - Press `q` to return to your code instantly!

### 3. Side-by-Side Diffing (`diffview.nvim`)
- Press `<leader>gd`: Opens a rich two-way or three-way diff between your working tree and git index.
- Press `<leader>gh`: Opens the file history log for the current file with commit-by-commit diffs.

### 4. Git Conflict Resolution (`git-conflict.nvim`)
When a merge or rebase conflict occurs:
- Jump between conflicts using `]x` (next conflict) and `[x` (previous conflict).
- Press `co` $\rightarrow$ **Choose Ours** (keep current branch version).
- Press `ct` $\rightarrow$ **Choose Theirs** (accept incoming branch version).
- Press `cb` $\rightarrow$ **Choose Both** (keep both changes).
- Press `c0` $\rightarrow$ **Choose None** (delete both blocks).

---

## Module 9: Full-Stack Toolkit — APIs (Kulala), Databases (Dadbod) & Terminals

### 1. Testing APIs without Postman (`kulala.nvim`)
Create an `api.http` file in your project:
```http
### Get All Users
GET https://api.example.com/users
Authorization: Bearer my-test-token
Content-Type: application/json

### Create User
POST https://api.example.com/users
Content-Type: application/json

{
  "name": "Alex",
  "email": "alex@example.com"
}
```

- Place cursor anywhere inside a request block.
- Press `<leader>rs` (**Run Send**).
- A response window opens showing status code, response headers, and formatted JSON!
- Press `<leader>rt` to toggle response view.
- Press `<leader>rc` to copy the request as an exact `curl` command.

### 2. Database Explorer (`vim-dadbod-ui`)
- Press `<leader>db` (**Toggle DBUI**).
- Press `A` to add a database connection string:
  - `postgresql://postgres:password@localhost:5432/mydb`
  - `mysql://root@localhost:3306/mydb`
  - `sqlite:///path/to/dev.db`
- Browse tables, view schema columns, and run queries with `S` or `<CR>`.

### 3. Integrated Terminal (`toggleterm.nvim`)
- Press `<C-\>` to toggle a bottom horizontal terminal drawer.
- Need a floating shell for a quick command? Press `<leader>tf`.
- Need a split? Press `<leader>th` (horizontal) or `<leader>tv` (vertical).
- To switch back to Normal mode from inside the terminal, press `<Esc><Esc>` or `<C-\><C-n>`.
- Seamlessly navigate out of the terminal into editor splits using `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`.

---

## Module 10: Deep Work, UI Customization & Troubleshooting

### 1. Zen Mode & Distraction-Free Coding
When building complex algorithms or writing documentation:
- Press `<leader>z` (**Zen Mode**): Centers your buffer, hides line numbers, file explorers, and status bars.
- Press `<leader>ut` (**Toggle Twilight**): Dims all code except the function or block your cursor is currently inside.

### 2. Project Search and Replace (`nvim-spectre`)
When you need to refactor a term across 50 files:
- Press `<leader>sr` (**Search Replace**).
- Type search query and replacement text.
- Inspect the live diff in the bottom preview pane.
- Press `<leader>R` to replace all occurrences.

### 3. Health Checks & Maintenance
If something ever feels off or a language server is quiet:
- `:checkhealth` $\rightarrow$ Complete system diagnosis of Neovim, Python, Node, and plugins.
- `:Lazy` $\rightarrow$ Open plugin manager. Press `U` to update plugins, `S` to sync.
- `:Mason` $\rightarrow$ Tool installer for LSPs, formatters, and linters. Press `i` to install, `u` to update.
- `:LspInfo` $\rightarrow$ Check which language servers are attached to the current file.
- `:ConformInfo` $\rightarrow$ Check which formatters are active for the current file.

---

## Bonus: The 7-Day Muscle Memory Roadmap

Do not try to memorize everything on Day 1. Follow this 7-day deliberate practice routine:

```mermaid
flowchart TD
    D1["Day 1: Motions & Files<br>(h j k l, w b e, leader-space, leader-e)"] --> D2["Day 2: The Grammar<br>(ciw, ci quotes, yap, dat)"]
    D2 --> D3["Day 3: AI & Harpoon<br>(Tab smart accept, leader-ha, leader-h1-4)"]
    D3 --> D4["Day 4: LSP Power<br>(K, gd, gp, leader-cr, leader-ca)"]
    D4 --> D5["Day 5: Multi-Cursor & Surround<br>(Ctrl-n, gsa, gsd, gsr)"]
    D5 --> D6["Day 6: Git & Splits<br>(]h, leader-hs, leader-gg, Ctrl-h/j/k/l)"]
    D6 --> D7["Day 7: Full-Stack Flow<br>(Kulala, Dadbod, ToggleTerm, Zen)"]
```

### 🗓️ Daily Focus Breakdown:
- **Day 1**: Forbid mouse usage. Navigate with `w`, `b`, `e`. Open files with `<leader><space>` and `<leader>e`.
- **Day 2**: Practice `ci"`, `ciw`, and `vat`. When changing words, never press `x` repeatedly—use `ciw`.
- **Day 3**: Use Harpoon (`<leader>ha`, `<leader>h1`-`h4`) exclusively instead of tabs. Rely on `<Tab>` for Copilot suggestions.
- **Day 4**: Rename variables with `<leader>cr`. Peek definitions with `gp`. Hover docs with `K`.
- **Day 5**: Use `<C-n>` for multi-cursor changes across repeating JSX elements. Wrap items using `gsaiw"`.
- **Day 6**: Move between splits using `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`. Stage hunks with `]h` and `<leader>hs`. Commit via `<leader>gg`.
- **Day 7**: Run API calls with `<leader>rs` and test SQL with `<leader>db`. Open Zen mode `<leader>z` for deep work.

---
_Congratulations! You now have full command over your Neovim environment._  
_Keep [CHEATSHEET.md](file:///home/dzgeek/dotfiles/config/.config/nvim/CHEATSHEET.md) handy on a secondary screen or terminal pane for instant lookups._
