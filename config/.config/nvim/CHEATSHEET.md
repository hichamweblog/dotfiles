# Neovim Developer Cheat Sheet

> **Config**: LazyVim · **Leader**: `<Space>` · **Stack**: TS / React / Next / Astro / Python / FastAPI / RN / Docker

---

## 🧭 Vim Motions — Core Navigation

> These work everywhere. Master these first.

### Moving the Cursor

| Key               | Action                                             |
| ----------------- | -------------------------------------------------- |
| `h` `j` `k` `l`   | ← ↓ ↑ →                                            |
| `w` / `W`         | Next word start (w=word, W=WORD incl. punctuation) |
| `b` / `B`         | Previous word start                                |
| `e` / `E`         | Next word end                                      |
| `0`               | Start of line (column 0)                           |
| `^`               | First non-blank character of line                  |
| `$`               | End of line                                        |
| `gg`              | Top of file                                        |
| `G`               | Bottom of file                                     |
| `{` / `}`         | Jump paragraph up / down                           |
| `%`               | Jump to matching bracket `()` `{}` `[]`            |
| `H` / `M` / `L`   | Screen top / middle / bottom                       |
| `<C-d>` / `<C-u>` | Scroll down / up half screen (centered)            |
| `<C-f>` / `<C-b>` | Scroll down / up full screen                       |
| `zz`              | Center cursor on screen                            |
| `zt` / `zb`       | Cursor to top / bottom of screen                   |

### Jumping (Fast Navigation)

| Key               | Action                                      |
| ----------------- | ------------------------------------------- |
| `f{char}`         | Jump to next `{char}` on line               |
| `F{char}`         | Jump to prev `{char}` on line               |
| `t{char}`         | Jump before next `{char}`                   |
| `T{char}`         | Jump before prev `{char}`                   |
| `;` / `,`         | Repeat f/F/t/T forward / backward           |
| `*` / `#`         | Search word under cursor forward / backward |
| `n` / `N`         | Next / prev search match (centered)         |
| `s{2chars}`       | **Flash.nvim** — jump anywhere in file      |
| `S`               | **Flash** treesitter-aware selection jump   |
| `<C-o>` / `<C-i>` | Jump list: go back / go forward             |
| `g;` / `g,`       | Change list: go back / go forward           |
| `''` or ` `` `    | Jump to last cursor position                |
| `m{a-z}`          | Set mark (e.g. `ma`)                        |
| `'{a-z}`          | Jump to mark                                |

---

## ✂️ Operators + Text Objects (The Vim Grammar)

> Pattern: **Operator + Motion or Text Object**
> Example: `d2w` = delete 2 words, `ci"` = change inside quotes

### Operators

| Key         | Action                              |
| ----------- | ----------------------------------- |
| `d`         | Delete (cut)                        |
| `c`         | Change (delete + enter insert mode) |
| `y`         | Yank (copy)                         |
| `v`         | Visual select                       |
| `>` / `<`   | Indent right / left                 |
| `=`         | Auto-indent                         |
| `gu` / `gU` | Lowercase / Uppercase               |
| `g~`        | Toggle case                         |

### Text Objects

| Key         | Selects...                            |
| ----------- | ------------------------------------- |
| `iw` / `aw` | inner word / a word (with space)      |
| `is` / `as` | inner sentence / a sentence           |
| `ip` / `ap` | inner paragraph / a paragraph         |
| `i"` / `a"` | inside / around double quotes         |
| `i'` / `a'` | inside / around single quotes         |
| `i(` / `a(` | inside / around parentheses `()`      |
| `i{` / `a{` | inside / around braces `{}`           |
| `i[` / `a[` | inside / around brackets `[]`         |
| `i<` / `a<` | inside / around angle brackets `<>`   |
| `it` / `at` | inside / around HTML/JSX tag          |
| `if` / `af` | inside / around function (treesitter) |
| `ic` / `ac` | inside / around class (treesitter)    |

### Real-World Examples

```
diw     → delete word under cursor
ciw     → change word under cursor (great for renaming)
ci"     → change content inside "quotes"
ca{     → change everything including { braces }
yi(     → copy content inside parentheses
vat     → visually select entire JSX tag including tag
=ap     → auto-indent current paragraph
gUiw    → UPPERCASE current word
```

---

## ✏️ Insert Mode

| Key               | Action                                  |
| ----------------- | --------------------------------------- |
| `i`               | Insert before cursor                    |
| `I`               | Insert at beginning of line             |
| `a`               | Append after cursor                     |
| `A`               | Append at end of line                   |
| `o`               | New line below + insert                 |
| `O`               | New line above + insert                 |
| `s`               | Delete char + insert                    |
| `S`               | Delete line + insert                    |
| `C`               | Change from cursor to end of line       |
| `r{char}`         | Replace single char (stays normal mode) |
| `R`               | Replace mode (overtype)                 |
| `<Esc>` / `<C-[>` | Back to Normal mode                     |
| `<C-s>`           | Save file (works in Insert mode too)    |

---

## 📋 Copy / Paste / Delete

| Key         | Action                                       |
| ----------- | -------------------------------------------- |
| `yy`        | Yank (copy) entire line                      |
| `Y`         | Yank to end of line                          |
| `dd`        | Delete (cut) line                            |
| `D`         | Delete to end of line                        |
| `p`         | Paste after cursor                           |
| `P`         | Paste before cursor                          |
| `<leader>p` | Paste in visual without overwriting register |
| `"+y`       | Copy to system clipboard explicitly          |
| `"+p`       | Paste from system clipboard                  |
| `u`         | Undo                                         |
| `<C-r>`     | Redo                                         |
| `x`         | Delete char under cursor                     |
| `xp`        | Swap two chars (delete + paste after)        |

---

## 🔍 Search & Replace

| Key              | Action                                          |
| ---------------- | ----------------------------------------------- |
| `/pattern`       | Search forward                                  |
| `?pattern`       | Search backward                                 |
| `n` / `N`        | Next / prev match (centered)                    |
| `*` / `#`        | Search word under cursor                        |
| `<leader>nh`     | Clear search highlight                          |
| `:%s/old/new/g`  | Replace all in file                             |
| `:%s/old/new/gc` | Replace all with confirmation                   |
| `:s/old/new/g`   | Replace in current line                         |
| `<leader>sr`     | **Spectre** — project-wide search & replace     |
| `<leader>sw`     | **Spectre** — replace current word project-wide |
| `<leader>sf`     | **Spectre** — replace in current file           |

---

## 🪟 Windows / Splits

| Key                    | Action                            |
| ---------------------- | --------------------------------- |
| `<leader>wv`           | Split vertical                    |
| `<leader>ws`           | Split horizontal                  |
| `<leader>we`           | Make splits equal size            |
| `<leader>wx`           | Close current split               |
| `<C-h/j/k/l>`          | Move between splits               |
| `<leader>wh/j/k/l`     | Move between splits (alternative) |
| `:resize +5`           | Increase split height             |
| `:vertical resize +10` | Increase split width              |

---

## 📁 File & Buffer Management

| Key               | Action                      |
| ----------------- | --------------------------- |
| `<Shift-l>`       | Next buffer                 |
| `<Shift-h>`       | Previous buffer             |
| `<leader>bd`      | Delete buffer (keep layout) |
| `<leader>bD`      | Force delete buffer         |
| `<leader>e`       | File explorer (Neo-tree)    |
| `<leader>fe`      | File explorer (focus)       |
| `<leader><space>` | Find files (Telescope)      |
| `<C-a>`           | Select all                  |
| `<C-s>`           | Save                        |
| `:wa`             | Save all                    |
| `:qa!`            | Force quit all              |

---

## 🔭 Telescope — Fuzzy Finder

> Think: **VSCode Ctrl+P** but much more powerful

| Key               | Action                          |
| ----------------- | ------------------------------- |
| `<leader><space>` | Find files                      |
| `<leader>ff`      | Find files (explicit)           |
| `<leader>fg`      | Live grep (search in all files) |
| `<leader>fw`      | Find word under cursor          |
| `<leader>fb`      | Find open buffers               |
| `<leader>fs`      | Document symbols                |
| `<leader>fS`      | Workspace symbols               |
| `<leader>fd`      | Diagnostics                     |
| `<leader>fh`      | Help tags                       |
| `<leader>fk`      | Keymaps                         |
| `<leader>fc`      | Commands                        |
| `<leader>fF`      | File browser                    |
| `<leader>f:`      | Command history                 |
| `<leader>f/`      | Search history                  |

**Inside Telescope:**

| Key               | Action                   |
| ----------------- | ------------------------ |
| `<C-j>` / `<C-k>` | Move up/down             |
| `<CR>`            | Open file                |
| `<C-v>`           | Open in vertical split   |
| `<C-x>`           | Open in horizontal split |
| `<C-t>`           | Open in new tab          |
| `<C-q>`           | Send all to quickfix     |
| `<Tab>`           | Multi-select             |
| `<Esc>` / `q`     | Close                    |

---

## 🤖 LSP — Language Server (IDE Features)

> Works for TS, TSX, React, Next, Astro, Python, FastAPI, Prisma, React Native...

| Key                   | Action                               |
| --------------------- | ------------------------------------ |
| `K`                   | Hover documentation                  |
| `gd`                  | Go to definition                     |
| `gD`                  | Go to declaration                    |
| `gr`                  | Find all references                  |
| `gi`                  | Go to implementation                 |
| `gp`                  | **Peek** definition (inline preview) |
| `<leader>cf`          | LSP Finder (all occurrences)         |
| `<leader>co`          | Symbol outline                       |
| `<leader>ca`          | Code actions (with preview)          |
| `<leader>cr`          | **Rename** symbol (live rename)      |
| `<F2>`                | Rename symbol (VSCode style)         |
| `<F12>`               | Go to definition (VSCode style)      |
| `<Alt-F12>`           | Peek definition                      |
| `<Shift-F12>`         | Find references                      |
| `[d` / `]d`           | Prev / next diagnostic               |
| `<F8>` / `<Shift-F8>` | Next / prev diagnostic               |
| `<leader>cd`          | Show line diagnostics                |
| `<leader>do`          | Open diagnostic float                |
| `<leader>dl`          | List all diagnostics                 |
| `<leader>ci`          | Import missing symbol (TS/JS)        |
| `<Shift-Alt-f>`       | Format document                      |

---

## 🔧 Code Actions & Refactoring

| Key          | Action                            |
| ------------ | --------------------------------- |
| `<leader>ca` | Code actions menu                 |
| `<leader>cr` | Rename symbol                     |
| `<leader>re` | Extract function (visual mode)    |
| `<leader>rf` | Extract function to file (visual) |
| `<leader>rv` | Extract variable (visual)         |
| `<leader>ri` | Inline variable                   |

---

## 💬 Comments

| Key            | Action                                                |
| -------------- | ----------------------------------------------------- |
| `gcc`          | Toggle line comment                                   |
| `gbc`          | Toggle block comment                                  |
| `gc` + motion  | Comment with motion (e.g. `gcip` = comment paragraph) |
| `gc` in visual | Comment selected lines                                |

> Context-aware: uses `{/* */}` inside JSX, `//` in JS/TS

---

## 🔤 Surround (`nvim-surround`)

| Key         | Action                             |
| ----------- | ---------------------------------- |
| `ysiw"`     | Surround word with `"`             |
| `ysiw(`     | Surround word with `( )`           |
| `ysip<div>` | Surround paragraph with `<div>`    |
| `cs"'`      | Change surrounding `"` to `'`      |
| `cs({`      | Change surrounding `(` to `{`      |
| `dst`       | Delete surrounding HTML/JSX tag    |
| `ds"`       | Delete surrounding `"`             |
| `S"`        | Surround visual selection with `"` |

---

## 🗂️ Harpoon — Bookmark Files

> Your most-used files, instantly accessible. Essential for Next.js projects.

| Key          | Action                      |
| ------------ | --------------------------- |
| `<leader>ha` | Add current file to Harpoon |
| `<leader>hh` | Toggle Harpoon menu         |
| `<leader>h1` | Jump to Harpoon file 1      |
| `<leader>h2` | Jump to Harpoon file 2      |
| `<leader>h3` | Jump to Harpoon file 3      |
| `<leader>h4` | Jump to Harpoon file 4      |

> **Workflow tip**: Harpoon `page.tsx` → `api/route.ts` → `schema.prisma` → `.env`

---

## 🌿 Git

### Gitsigns (inline diff)

| Key          | Action                   |
| ------------ | ------------------------ |
| `]h` / `[h`  | Next / prev hunk         |
| `<leader>hs` | Stage hunk               |
| `<leader>hr` | Reset hunk               |
| `<leader>hS` | Stage entire file        |
| `<leader>hu` | Undo stage hunk          |
| `<leader>hp` | Preview hunk diff        |
| `<leader>hb` | Full blame for line      |
| `<leader>gB` | Toggle inline blame      |
| `<leader>hd` | Diff this file           |
| `ih`         | Text object: select hunk |

### Lazygit (full TUI)

| Key          | Action        |
| ------------ | ------------- |
| `<leader>gg` | Open Lazygit  |
| `<leader>gG` | Lazygit (cwd) |
| `<leader>gl` | Lazygit log   |

### Telescope Git

| Key          | Action         |
| ------------ | -------------- |
| `<leader>gc` | Browse commits |
| `<leader>gs` | Git status     |
| `<leader>gb` | Git branches   |

### Diffview

| Key          | Action         |
| ------------ | -------------- |
| `<leader>gd` | Open diff view |
| `<leader>gh` | File history   |
| `<leader>gH` | Repo history   |

### Git Conflict Resolution

| Key         | Action               |
| ----------- | -------------------- |
| `co`        | Accept ours          |
| `ct`        | Accept theirs        |
| `cb`        | Accept both          |
| `c0`        | Accept none          |
| `]x` / `[x` | Next / prev conflict |

---

## 📟 Terminal

| Key          | Action                       |
| ------------ | ---------------------------- |
| `<C-\>`      | Toggle terminal (horizontal) |
| `<leader>tf` | Float terminal               |
| `<leader>th` | Horizontal terminal          |
| `<leader>tv` | Vertical terminal            |

---

## 🔴 Diagnostics & Trouble

| Key          | Action                        |
| ------------ | ----------------------------- |
| `<leader>xx` | Project diagnostics (Trouble) |
| `<leader>xX` | Buffer diagnostics (Trouble)  |
| `<leader>cs` | Document symbols (Trouble)    |
| `<leader>xQ` | Quickfix list (Trouble)       |
| `<leader>ft` | Find TODO/FIXME comments      |

---

## 💾 Sessions & Focus

| Key          | Action                              |
| ------------ | ----------------------------------- |
| `<leader>qs` | Restore session for current dir     |
| `<leader>ql` | Restore last session                |
| `<leader>z`  | Zen mode (distraction-free)         |
| `<leader>ut` | Toggle Twilight (dim inactive code) |

---

## 🔁 Code Folding

| Key         | Action                   |
| ----------- | ------------------------ |
| `zR`        | Open ALL folds           |
| `zM`        | Close ALL folds          |
| `za`        | Toggle fold under cursor |
| `zo` / `zc` | Open / close fold        |

---

## 📊 Line Operations

| Key                | Action                   |
| ------------------ | ------------------------ |
| `<Alt-Down>`       | Move line/selection down |
| `<Alt-Up>`         | Move line/selection up   |
| `<Alt-Shift-Down>` | Duplicate line down      |
| `<Alt-Shift-Up>`   | Duplicate line up        |
| `J`                | Join line below          |
| `>>` / `<<`        | Indent / unindent line   |

---

## 🌐 HTTP / API Testing (Kulala)

> Works with `.http` files — great for FastAPI testing

| Key                         | Action               |
| --------------------------- | -------------------- |
| `<leader>rs`                | Send HTTP request    |
| `<leader>rt`                | Toggle response view |
| `<leader>rp` / `<leader>rn` | Prev / next request  |
| `<leader>rc`                | Copy as cURL         |

---

## 🔧 Mason / LSP Management

| Command         | Action                  |
| --------------- | ----------------------- |
| `:Mason`        | Open Mason installer UI |
| `:LspInfo`      | Show active LSP servers |
| `:LspRestart`   | Restart LSP             |
| `:checkhealth`  | Full health check       |
| `:Lazy`         | Plugin manager          |
| `:Lazy sync`    | Update all plugins      |
| `:Lazy profile` | Show startup time       |

---

## ⚡ Real-World Power Combos

### Rename a component/variable across project

```
cursor on name → <leader>cr  (or <F2>)
```

### Find all usages of a hook / function

```
gr              → telescope with all references
<Shift-F12>     → same
```

### Fix a missing TS import

```
<leader>ci      → auto-import missing symbol
<leader>ca      → code actions → add import
```

### Project-wide search & replace

```
<leader>fw      → grep current word
<leader>sr      → Spectre for replace
```

### Work on 4 files simultaneously (Next.js)

```
<leader>ha each file → <leader>h1-4 to jump between them
```

> E.g.: `page.tsx` → `route.ts` → `schema.prisma` → `.env`

### Stage only some changes (not entire file)

```
]h / [h         → navigate hunks
<leader>hs      → stage just that hunk
<leader>gg      → lazygit to commit
```

### Collapse all to see file structure

```
zM              → close all folds
<leader>co      → LSP symbol outline
```

### Change JSX prop value

```
cursor on "value" → ci"  → type new value
```

### Wrap JSX element in a div

```
cursor inside → ysit → type div → Enter
```

### Extract repeated JSX into component

```
visually select → <leader>re  → Extract Function
```

---

## 🎨 UI Toggles

| Key          | Action                     |
| ------------ | -------------------------- |
| `<leader>uh` | Toggle inlay hints         |
| `<leader>ud` | Toggle diagnostics         |
| `<leader>ul` | Toggle line numbers        |
| `<leader>uw` | Toggle word wrap           |
| `<leader>us` | Toggle spell check         |
| `<leader>uf` | Toggle auto-format on save |
| `<leader>sd` | Dismiss notifications      |

---

## 📝 Handy `:` Commands

```vim
:nohl               " clear search highlight
:retab              " convert tabs to spaces
:%s/old/new/gc      " replace all with confirmation
:sort               " sort selected lines
:g/pattern/d        " delete all lines matching pattern
:v/pattern/d        " delete all lines NOT matching
:norm A;            " append ; to end of each selected line
```

---

_Config: LazyVim | Location: `~/.config/nvim` → `~/dotfiles/config/.config/nvim`_
_LSPs: vtsls (TS/JS/RN), pyright (Python), tailwindcss, astro, prismals, dockerls, html, cssls, jsonls, yamlls_
_Formatters: prettier (JS/TS/CSS/HTML), black (Python), stylua (Lua), shfmt (Shell)_
_Linters: eslint_d (JS/TS), markdownlint, hadolint (Docker), shellcheck, yamllint_
