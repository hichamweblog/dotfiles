# ⚡ Neovim Developer Cheat Sheet

> **Framework**: LazyVim · **Leader Key**: `<Space>` · **Local Leader**: `\`  
> **Primary Stack**: TypeScript · React / Next.js / Astro · React Native & Expo · Python / FastAPI · SQL · Docker · Tailwind CSS  
> **Course Guide**: [COURSE.md](file:///home/dzgeek/dotfiles/config/.config/nvim/COURSE.md) · **Full Keybindings**: [KEYBINDINGS.md](file:///home/dzgeek/dotfiles/config/.config/nvim/KEYBINDINGS.md)

---

## 🚀 Daily Top 15 Shortcuts (Start Here)

| Shortcut | Action | Description |
| :--- | :--- | :--- |
| `<leader><space>` | **Find Files** | Fuzzy find any file in project (Telescope) |
| `<leader>fg` | **Live Grep** | Search text across the entire codebase |
| `<leader>e` | **File Explorer** | Toggle Neo-tree sidebar (docked on right, width 25) |
| `<leader>o` | **Focus Explorer** | Jump cursor into Neo-tree |
| `<Tab>` | **Smart Accept** | Accepts Copilot ghost text or jumps to next snippet stop |
| `gd` | **Go to Definition** | Jump to symbol definition via Lspsaga |
| `gp` | **Peek Definition** | Preview definition in floating window without leaving cursor |
| `K` | **Hover Docs** | View type definition & docstrings |
| `<leader>ca` | **Code Actions** | Code action popup with live diff preview |
| `<leader>cr` | **Rename Symbol** | Incremental live rename across all references |
| `<leader>cf` | **Format Code** | Format document via Conform (Prettier / Black / Stylua) |
| `<C-s>` | **Save File** | Save changes (works in Normal, Insert, and Visual mode) |
| `<leader>gg` | **LazyGit** | Full-screen Git TUI for staging, commits, branches |
| `<C-\>` | **Toggle Terminal** | Open/close floating/horizontal shell |
| `<C-n>` | **Multi-Cursor** | Select next occurrence of word (`vim-visual-multi`) |

---

## 🧭 Core Vim Motions & Jumps

### Moving the Cursor
| Key | Action |
| :--- | :--- |
| `h` `j` `k` `l` | Left, Down, Up, Right |
| `w` / `W` | Jump to start of next word / WORD (WORD includes symbols) |
| `b` / `B` | Jump backward to start of word / WORD |
| `e` / `E` | Jump forward to end of word / WORD |
| `0` / `^` | Beginning of line (col 0) / First non-whitespace character |
| `$` | End of line |
| `gg` / `G` | Top of file / Bottom of file (`{n}G` jumps to line `{n}`) |
| `{` / `}` | Previous / next empty line (paragraph jump) |
| `%` | Jump between matching bracket `()`, `{}`, `[]`, `<>` |
| `H` / `M` / `L` | Jump to screen Top, Middle, Bottom |
| `<C-d>` / `<C-u>` | Scroll half-page down / up (automatically centered) |
| `<C-f>` / `<C-b>` | Scroll full page down / up |
| `zz` / `zt` / `zb` | Center viewport on cursor / Cursor to top / Cursor to bottom |

### Precision Jumping & Flash
| Key | Action | Description |
| :--- | :--- | :--- |
| `s{char}{char}` | **Flash Jump** | Type `s` then 2 letters to jump to any visible text instantly |
| `S` | **Flash Treesitter** | Jump to code nodes (functions, blocks, JSX tags) |
| `f{char}` / `F{char}` | **Find Char** | Jump forward / backward to `{char}` on current line |
| `t{char}` / `T{char}` | **Till Char** | Jump till character forward / backward |
| `;` / `,` | **Repeat Find** | Repeat last f/t forward / backward |
| `*` / `#` | **Search Cursor Word** | Search current word forward / backward |
| `n` / `N` | **Next / Prev Match** | Next / previous search result (auto-centered) |
| `<leader>nh` | **Clear Highlights** | Clear active search highlights |
| `<C-o>` / `<C-i>` | **Jump List** | Navigate jump history backward / forward |
| `g;` / `g,` | **Change List** | Navigate edit history backward / forward |
| `''` or ` `` ` | **Previous Position** | Jump to location before previous jump |

---

## ✂️ The Vim Grammar: Operators & Text Objects

> Pattern: **`<Operator>` + `<Count>` + `<Text-Object or Motion>`**  
> Example: `ci"` = Change Inside Quotes · `dap` = Delete Around Paragraph · `gUiw` = Uppercase Inner Word

### Core Operators
| Operator | Action |
| :--- | :--- |
| `d` | Delete (cuts to register) |
| `c` | Change (deletes and enters Insert mode) |
| `y` | Yank (copies into register) |
| `v` / `V` / `<C-v>` | Visual (character) / Visual Line / Visual Block |
| `>` / `<` | Indent / Dedent selection or motion |
| `=` | Auto-indent code block |
| `gu` / `gU` / `g~` | Lowercase / Uppercase / Toggle case |

### Text Objects (`i` = inner, `a` = around)
| Target | Inner (`i`) | Around (`a`) | Real-World Use Case |
| :--- | :--- | :--- | :--- |
| **Word** | `iw` | `aw` (incl. whitespace) | `ciw` → rename variable under cursor |
| **Quotes** | `i"` / `i'` / `i\`` | `a"` / `a'` / `a\`` | `ci"` → change string content inside quotes |
| **Parentheses** | `i(` or `ib` | `a(` or `ab` | `di(` → wipe parameters inside function call |
| **Braces** | `i{` or `iB` | `a{` or `aB` | `ci{` → replace body of function/object |
| **Brackets** | `i[` | `a[` | `ya[` → copy array contents |
| **HTML / JSX Tag** | `it` | `at` | `cit` → change inner JSX, `dat` → delete whole tag |
| **Paragraph** | `ip` | `ap` | `yap` → yank whole code block or paragraph |

### Everyday Real-World Combos
```text
ciw        → Replace the current word
ci"        → Change string inside quotes: "old text" -> ""
ca(        → Delete parameter list and surrounding ( )
vat        → Select full JSX component including <tags>
gUiw       → Turn current word to UPPERCASE
=ap        → Auto-reindent current block/paragraph
```

---

## 🤖 GitHub Copilot & AI Pairing

| Shortcut | Mode | Action | Notes |
| :--- | :---: | :--- | :--- |
| `<Tab>` | `i` | **Smart Accept** | 1. Accepts Copilot ghost text if visible<br>2. Jumps snippet stop if active<br>3. Indents if normal |
| `<C-j>` | `i` | **Accept Suggestion** | Explicit alternative to accept full suggestion |
| `<C-Right>` | `i` | **Accept Word** | Accept only the next word from suggestion |
| `<C-Down>` | `i` | **Accept Line** | Accept only the next line from suggestion |
| `<M-]>` | `i` | **Next Suggestion** | Cycle to next alternative suggestion |
| `<M-[>` | `i` | **Previous Suggestion**| Cycle to previous alternative suggestion |
| `<M-\>` | `i` | **Dismiss Suggestion** | Hide currently displayed suggestion |

> **Blink.cmp Integration**: Copilot also injects completion items directly into the `blink.cmp` popup menu, boosted to the top with a score offset of 100.

---

## 🤹 Multi-Cursor (`vim-visual-multi`)

| Shortcut | Mode | Action |
| :--- | :---: | :--- |
| `<C-n>` | `n` / `v` | Select word under cursor and start multi-cursor mode |
| `<C-n>` | `VM` | Select next matching occurrence |
| `<C-x>` | `VM` | Skip current occurrence and move to next |
| `<C-p>` | `VM` | Deselect current match and step backward |
| `n` / `N` | `VM` | Find next / previous match |
| `i` / `a` | `VM` | Insert before / Append after all cursors |
| `c` / `s` | `VM` | Change / Substitute at all cursors |
| `q` or `<Esc>` | `VM` | Exit multi-cursor mode |

---

## 📁 File Explorer (Neo-tree — Docked on Right, Width 25)

| Shortcut | Action | Description |
| :--- | :--- | :--- |
| `<leader>e` | **Toggle Explorer** | Open / close sidebar on right screen |
| `<leader>o` | **Focus Explorer** | Shift keyboard focus to tree window |
| `<leader>ge` | **Git Explorer** | Open floating tree filtered to modified git files |
| `<leader>be` | **Buffer Explorer** | View currently loaded buffers in tree |

### Inside Neo-tree
| Key | Action |
| :--- | :--- |
| `<CR>` or `l` | Open file / expand folder |
| `h` | Collapse folder or go to parent directory |
| `v` | Open file in **vertical split** |
| `s` | Open file in **horizontal split** |
| `t` | Open file in **new tab** |
| `P` | Toggle floating file preview |
| `a` | Create new file or folder (e.g. type `components/Card.tsx` to create nested) |
| `d` | Delete file / folder (with confirmation) |
| `r` | Rename file / folder |
| `y` / `x` / `p` | Copy / Cut / Paste file |
| `R` | Refresh file tree |
| `?` | Show interactive help overlay |

---

## 🔭 Telescope — Fuzzy Finding Everything

| Shortcut | Action | Search Target |
| :--- | :--- | :--- |
| `<leader><space>` | **Find Files** | Project files (`rg --hidden`, skips `.git`) |
| `<leader>ff` | **Find Files** | Same as `<leader><space>` |
| `<leader>fg` | **Live Grep** | Code search across all project files |
| `<leader>fw` | **Grep Word** | Search for word under cursor in project |
| `<leader>fr` | **Recent Files** | Previously opened files (MRU) |
| `<leader>fb` | **Buffers** | Open buffers (press `<C-d>` or `dd` to delete) |
| `<leader>fs` | **Document Symbols** | Functions, classes, variables in current buffer |
| `<leader>fS` | **Workspace Symbols**| Symbols across the entire workspace |
| `<leader>fd` | **Diagnostics** | Project warnings and errors |
| `<leader>gc` | **Git Commits** | Browse commit log with diff preview |
| `<leader>gs` | **Git Status** | Modified files list |
| `<leader>gb` | **Git Branches** | Switch or inspect branches |
| `<leader>fk` | **Keymaps** | Search all active keybindings |
| `<leader>fh` | **Help Tags** | Search Neovim documentation |
| `<leader>fc` | **Commands** | Search Vim commands |
| `<leader>fF` | **File Browser** | Telescope file system browser |

### Inside Telescope Picker
| Key | Action |
| :--- | :--- |
| `<C-j>` / `<C-k>` or `<Down>` / `<Up>` | Move selection down / up |
| `<CR>` | Open selected item |
| `<C-v>` / `<C-x>` | Open in vertical split / horizontal split |
| `<C-t>` | Open in new tab |
| `<C-u>` / `<C-d>` | Scroll preview window up / down |
| `<Tab>` / `<S-Tab>` | Toggle multi-selection mark |
| `<C-q>` | Send all results to Quickfix list |
| `<M-q>` | Send selected results to Quickfix list |
| `<Esc>` or `q` (Normal) | Close picker |

---

## 🗂️ Harpoon 2 — Instant File Bookmarking

| Shortcut | Action | Description |
| :--- | :--- | :--- |
| `<leader>ha` | **Add File** | Pin current file to Harpoon list |
| `<leader>hh` | **Toggle Menu** | Open Harpoon UI to reorder or view slots |
| `<leader>h1` | **Jump File 1** | Instantly switch to pinned file #1 |
| `<leader>h2` | **Jump File 2** | Instantly switch to pinned file #2 |
| `<leader>h3` | **Jump File 3** | Instantly switch to pinned file #3 |
| `<leader>h4` | **Jump File 4** | Instantly switch to pinned file #4 |

> **Pro-Tip**: Pin your active workflow files: `#1: page.tsx`, `#2: route.ts`, `#3: schema.prisma`, `#4: .env`. You can switch between them with zero lag!

---

## 🧠 LSP & Code Intelligence

| Shortcut | Action | What it does |
| :--- | :--- | :--- |
| `K` | **Hover Documentation** | Opens Lspsaga hover window with type signatures & markdown |
| `gd` | **Go to Definition** | Jumps directly to definition with Lspsaga |
| `gp` | **Peek Definition** | Opens floating inline preview of definition |
| `gD` | **Go to Declaration** | Jump to declaration |
| `gr` | **References** | Telescope picker listing all usages across project |
| `gi` | **Implementations** | Telescope picker listing interface implementations |
| `<leader>cf` | **LSP Finder** | Lspsaga finder showing definitions & references |
| `<leader>co` | **Symbol Outline** | Floating document outline (classes, methods, hooks) |
| `<leader>cr` | **Rename Symbol** | Live incremental rename with `inc-rename.nvim` |
| `<leader>ca` | **Code Actions** | Visual code actions menu with live diff preview |
| `<leader>ci` | **Auto-Import** | Automatically imports missing TS/JS symbol under cursor |
| `[d` / `]d` | **Prev / Next Diagnostic** | Jump to previous / next error or warning |
| `<leader>cd` | **Line Diagnostics** | Open Lspsaga diagnostic popup for current line |
| `<leader>do` | **Diagnostic Float** | Open Neovim standard diagnostic float |
| `<leader>dl` | **Diagnostic List** | Open Telescope list of diagnostics |

---

## 🔨 Refactoring (`refactoring.nvim`)

| Shortcut | Mode | Action |
| :--- | :---: | :--- |
| `<leader>re` | `v` | **Extract Function** to local scope |
| `<leader>rf` | `v` | **Extract Function to File** |
| `<leader>rv` | `v` | **Extract Variable** from selected expression |
| `<leader>ri` | `n` / `v` | **Inline Variable** at cursor |

---

## 🎨 Formatting & Linting

| Shortcut | Action | Description |
| :--- | :--- | :--- |
| `<leader>cf` | **Format Code** | Format document or visual selection via Conform |
| `<leader>uf` | **Toggle Auto-Format** | Enable / disable format-on-save globally |

### Configured Formatters & Linters
- **TypeScript / JavaScript / React / Next / Astro**: Prettier (`--single-quote`, `--tab-width 2`, `--print-width 100`) + `eslint_d`
- **Python / FastAPI**: Black (`--line-length 100`, `--fast`) + Pyright diagnostics
- **React Native & Expo**: `vtsls` + `eslint-lsp` + Prettier + Treesitter JSX/TSX
- **Lua**: Stylua
- **Shell / Bash**: shfmt (`-i 2 -ci`) + ShellCheck
- **Docker**: Prettier + Hadolint
- **GitHub Actions (`.github/workflows/*.yml`)**: Actionlint
- **SQL**: sql-formatter + SQLFluff
- **Markdown / YAML / JSON**: Prettier + Markdownlint + Yamllint + SchemaStore

---

## 🔤 Surround Operations (`mini.surround`)

| Combo | Result | Description |
| :--- | :--- | :--- |
| `gsaiw"` | `word` → `"word"` | Add quotes around inner word |
| `gsaiw'` | `word` → `'word'` | Add single quotes around word |
| `gsaiw)` | `word` → `(word)` | Add parentheses (no space padding) |
| `gsaiw(` | `word` → `( word )` | Add parentheses (with space padding) |
| `gsaiw}` | `word` → `{word}` | Add braces (no space padding) |
| `gsaiwt` | `word` → `<div>word</div>` | Surround word with tag (prompts for tag) |
| `gsd"` | `"word"` → `word` | Delete surrounding double quotes |
| `gsdt` | `<div>text</div>` → `text` | Delete surrounding HTML / JSX tag |
| `gsr"'` | `"word"` → `'word'` | Replace surrounding `"` with `'` |
| `gsr({` | `(word)` → `{word}` | Replace surrounding `()` with `{}` |
| `gsa"` | (Visual) `"selected"` | Surround visually selected text with `"` |

---

## 🌿 Git Suite

### Hunk Management (`gitsigns.nvim`)
| Shortcut | Action | Description |
| :--- | :--- | :--- |
| `]h` / `[h` | **Next / Prev Hunk** | Jump to next / previous git change |
| `<leader>hs` | **Stage Hunk** | Stage current hunk (works in Normal & Visual) |
| `<leader>hr` | **Reset Hunk** | Revert current hunk (works in Normal & Visual) |
| `<leader>hS` | **Stage Buffer** | Stage entire file |
| `<leader>hR` | **Reset Buffer** | Discard all changes in file |
| `<leader>hu` | **Undo Stage** | Unstage last staged hunk |
| `<leader>hp` | **Preview Hunk** | Show inline diff popup of current hunk |
| `<leader>hb` | **Blame Line** | Show full git commit blame for current line |
| `<leader>gB` | **Toggle Inline Blame** | Show/hide virtual text commit author |
| `<leader>hd` | **Diff This** | Split view diffing against index |
| `<leader>hD` | **Diff This ~** | Split view diffing against HEAD |
| `ih` | **Hunk Text Object** | Operator target (e.g. `dih` to delete hunk, `yih` to copy) |

### LazyGit TUI (`lazygit.nvim`)
| Shortcut | Action |
| :--- | :--- |
| `<leader>gg` | Open LazyGit full-screen overlay |
| `<leader>gf` | Open LazyGit filtered to current file |
| `<leader>gc` | Open LazyGit commit history |

### DiffView & Conflict Resolution
| Shortcut | Tool | Action |
| :--- | :--- | :--- |
| `<leader>gd` | Diffview | Open interactive side-by-side git diff view |
| `<leader>gh` | Diffview | Show git history for current file |
| `<leader>gH` | Diffview | Show full repository history |
| `co` | GitConflict | Choose **Ours** (current branch) |
| `ct` | GitConflict | Choose **Theirs** (incoming branch) |
| `cb` | GitConflict | Choose **Both** |
| `c0` | GitConflict | Choose **None** |
| `]x` / `[x` | GitConflict | Jump to next / previous merge conflict |

---

## 🪟 Windows, Tmux Navigation & Buffers

### Seamless Neovim + Tmux Navigation (`vim-tmux-navigator`)
| Shortcut | Action |
| :--- | :--- |
| `<C-h>` | Move to window / tmux pane on the **Left** |
| `<C-j>` | Move to window / tmux pane **Down** |
| `<C-k>` | Move to window / tmux pane **Up** |
| `<C-l>` | Move to window / tmux pane on the **Right** |
| `<C-\>` | Move to previous pane / window |

### Window Splits
| Shortcut | Action |
| :--- | :--- |
| `<leader>wv` or `<leader>\|` | Split window **vertically** |
| `<leader>ws` or `<leader>-` | Split window **horizontally** |
| `<leader>we` | Equalize size of all splits |
| `<leader>wx` or `<leader>wd` | Close current split |

### Buffer Tabs (`bufferline.nvim` + `mini.bufremove`)
| Shortcut | Action |
| :--- | :--- |
| `<S-l>` or `]b` | Switch to **Next Buffer** |
| `<S-h>` or `[b` | Switch to **Previous Buffer** |
| `<leader>bd` | **Delete Buffer** (safely keeps window layout intact) |
| `<leader>bD` | Force delete buffer (discards unsaved) |
| `<leader>bp` | Toggle pin on current buffer tab |
| `<leader>bP` | Close all unpinned buffers |
| `<leader>bo` | Close all other buffers |
| `<leader>br` / `<leader>bl` | Close buffers to the right / left |

---

## 📟 Integrated Terminal (`toggleterm.nvim`)

| Shortcut | Action |
| :--- | :--- |
| `<C-\>` | Toggle terminal (horizontal drawer) |
| `<leader>tf` | Open floating terminal window |
| `<leader>th` | Open horizontal terminal (height 10) |
| `<leader>tv` | Open vertical terminal (width 80) |
| `<Esc><Esc>` or `<C-\><C-n>` | Exit terminal insert mode back to Normal mode |

---

## 🌐 Full-Stack Tooling: APIs & Databases

### REST & HTTP Client (`kulala.nvim` for `.http` / `.rest` files)
| Shortcut | Action |
| :--- | :--- |
| `<leader>rs` | **Send HTTP Request** under cursor |
| `<leader>rt` | **Toggle Response View** (headers, JSON body, metrics) |
| `<leader>rn` / `<leader>rp` | Jump to **Next / Previous Request** in file |
| `<leader>rc` | **Copy Request as cURL** command |
| `<leader>ri` | **Inspect Request** details |

### Database UI (`vim-dadbod-ui`)
| Shortcut | Action |
| :--- | :--- |
| `<leader>db` | **Toggle DBUI** explorer sidebar |
| `<CR>` (in DBUI) | Expand database / table / execute query |
| `S` (in DBUI) | Execute SQL file against active database |
| `A` (in DBUI) | Add new database connection |

---

## 🔎 Project-Wide Search & Replace (`nvim-spectre`)

| Shortcut | Action |
| :--- | :--- |
| `<leader>sr` | Open Spectre search & replace panel |
| `<leader>sw` | Search & replace word under cursor project-wide |
| `<leader>sf` | Search & replace inside current file only |

---

## 🔴 Diagnostics & Trouble (`trouble.nvim`)

| Shortcut | Action |
| :--- | :--- |
| `<leader>xx` | Toggle Trouble project diagnostics panel |
| `<leader>xX` | Toggle Trouble buffer diagnostics panel |
| `<leader>cs` | Document symbols outline (Trouble) |
| `<leader>xQ` | Quickfix list in Trouble UI |
| `<leader>xL` | Location list in Trouble UI |
| `<leader>ft` | Find all `TODO:`, `FIXME:`, `HACK:` comments |
| `]t` / `[t` | Jump to next / previous TODO comment |

---

## 🎨 UI Toggles & Distraction-Free Coding

| Shortcut | Action |
| :--- | :--- |
| `<leader>uT` | **Toggle Tailwind Class Conceal** (hides long class clutter) |
| `<leader>z` | **Zen Mode** (centers buffer, hides clutter for deep focus) |
| `<leader>ut` | **Toggle Twilight** (dims inactive code blocks) |
| `<leader>uf` | **Toggle Auto-Format** on save |
| `<leader>sn` / `<leader>sl` | View Noice notification history / last message |
| `<leader>sd` | Dismiss all notifications |
| `<leader>qs` | **Restore Session** for current directory |
| `<leader>ql` | **Restore Last Session** |
| `<leader>qd` | Exit without saving session |

---

## 🔁 Code Folding (`nvim-ufo`)

| Shortcut | Action |
| :--- | :--- |
| `zR` | **Open all folds** in file |
| `zM` | **Close all folds** in file |
| `za` | **Toggle fold** under cursor |
| `zo` / `zc` | Open / close current fold |

---

## ⚡ Real-World Developer Workflows

### 1. Rename Component Everywhere
1. Put cursor on component name.
2. Press `<leader>cr` (Lspsaga incremental rename).
3. Type the new name and press `<CR>`. All imports and definitions update simultaneously!

### 2. Auto-Fix Missing React / Node Import
1. Put cursor on unresolved identifier (e.g. `useState`).
2. Press `<leader>ci` (auto-import).
3. Neovim automatically adds `import { useState } from 'react'` at the top.

### 3. Rapid Multi-Occurrence Edit
1. Put cursor on repeating class or prop name.
2. Press `<C-n>` to grab first match.
3. Press `<C-n>` again for next matches (or `<C-x>` to skip one).
4. Press `c` to edit all instances simultaneously, then `<Esc>`.

### 4. Harpoon Rapid Context Switching
1. Pin files: `<leader>ha` on `page.tsx`, `<leader>ha` on `api/route.ts`.
2. Jump back and forth using `<leader>h1` and `<leader>h2`.

### 5. Review & Stage Changes
1. Press `]h` to jump through modified hunks.
2. Press `<leader>hp` to inspect changes.
3. Press `<leader>hs` to stage just that hunk.
4. Press `<leader>gg` to open LazyGit, hit `c` to commit, `P` to push!

---
_Documentation maintained for dzgeek dotfiles Neovim setup._  
_For full details and day-to-day tutorials, see [COURSE.md](file:///home/dzgeek/dotfiles/config/.config/nvim/COURSE.md)._
