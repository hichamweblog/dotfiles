# 🎯 Complete Neovim Keybindings Reference Manual

> **Config Base**: LazyVim · **Leader Key**: `<Space>` · **Local Leader**: `\`  
> **Documentation Suite**: [CHEATSHEET.md](file:///home/dzgeek/dotfiles/config/.config/nvim/CHEATSHEET.md) · [COURSE.md](file:///home/dzgeek/dotfiles/config/.config/nvim/COURSE.md)  
> **Verified**: All keybindings in this document are tested and directly mapped in your active configuration.

---

## 📑 Table of Contents
1. [Core Navigation & Tmux Integration](#1-core-navigation--tmux-integration)
2. [Window & Split Management](#2-window--split-management)
3. [Buffer Tabs & Bufferline](#3-buffer-tabs--bufferline)
4. [File Explorer (Neo-tree — Right Side)](#4-file-explorer-neo-tree--right-side)
5. [Fuzzy Finding (Telescope)](#5-fuzzy-finding-telescope)
6. [Harpoon 2 Quick Marks](#6-harpoon-2-quick-marks)
7. [GitHub Copilot & AI Code Generation](#7-github-copilot--ai-code-generation)
8. [Multi-Cursor (vim-visual-multi)](#8-multi-cursor-vim-visual-multi)
9. [LSP & Code Intelligence (Lspsaga & Diagnostics)](#9-lsp--code-intelligence-lspsaga--diagnostics)
10. [Code Actions & Refactoring](#10-code-actions--refactoring)
11. [Formatting & Linters](#11-formatting--linters)
12. [Commenting & Surround (mini.surround)](#12-commenting--surround-minisurround)
13. [Search & Replace (Spectre & Vim Search)](#13-search--replace-spectre--vim-search)
14. [Git Suite (LazyGit, Gitsigns, Diffview, Conflicts)](#14-git-suite-lazygit-gitsigns-diffview-conflicts)
15. [Integrated Terminal (ToggleTerm)](#15-integrated-terminal-toggleterm)
16. [Full-Stack Tooling (REST API & Dadbod Database)](#16-full-stack-tooling-rest-api--dadbod-database)
17. [Testing & Debugging (Neotest & DAP)](#17-testing--debugging-neotest--dap)
18. [UI Toggles, Focus & Session Management](#18-ui-toggles-focus--session-management)
19. [Code Folding (nvim-ufo)](#19-code-folding-nvim-ufo)
20. [Quickfix & Location Lists](#20-quickfix--location-lists)
21. [Vim Operators, Text Objects & Yanky](#21-vim-operators-text-objects--yanky)
22. [Complete Master `<leader>` Keymap Index](#22-complete-master-leader-keymap-index)

---

## 1. Core Navigation & Tmux Integration

Navigation between Neovim splits and Tmux panes is seamless via `vim-tmux-navigator`.

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<C-h>` | `n` | **Navigate Left** | Move to left window split or Tmux pane |
| `<C-j>` | `n` | **Navigate Down** | Move to lower window split or Tmux pane |
| `<C-k>` | `n` | **Navigate Up** | Move to upper window split or Tmux pane |
| `<C-l>` | `n` | **Navigate Right** | Move to right window split or Tmux pane |
| `<C-\>` | `n` | **Previous Pane** | Jump to previously active window/pane |
| `<leader>wh` | `n` | **Go Left** | Alternative window navigation left |
| `<leader>wj` | `n` | **Go Down** | Alternative window navigation down |
| `<leader>wk` | `n` | **Go Up** | Alternative window navigation up |
| `<leader>wl` | `n` | **Go Right** | Alternative window navigation right |

### Viewport Scrolling
| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<C-d>` | `n` | **Scroll Down Half-Page** | Smooth scroll down, centered (`zz`) |
| `<C-u>` | `n` | **Scroll Up Half-Page** | Smooth scroll up, centered (`zz`) |
| `<C-f>` | `n` | **Page Down** | Full screen scroll forward |
| `<C-b>` | `n` | **Page Up** | Full screen scroll backward |
| `zz` | `n` | **Center Viewport** | Center current line in window |
| `zt` | `n` | **Top Viewport** | Scroll cursor line to top |
| `zb` | `n` | **Bottom Viewport** | Scroll cursor line to bottom |

---

## 2. Window & Split Management

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>wv` or `<leader>\|` | `n` | **Split Vertical** | Open a new vertical split to the right |
| `<leader>ws` or `<leader>-` | `n` | **Split Horizontal** | Open a new horizontal split below |
| `<leader>we` or `<C-w>=` | `n` | **Equalize Splits** | Reset all split widths and heights to equal |
| `<leader>wx` or `<leader>wd` | `n` | **Close Split** | Close current split window |
| `<C-Up>` | `n` | **Resize Up** | Increase split height by 2 |
| `<C-Down>` | `n` | **Resize Down** | Decrease split height by 2 |
| `<C-Left>` | `n` | **Resize Left** | Decrease split width by 2 |
| `<C-Right>` | `n` | **Resize Right** | Increase split width by 2 |

---

## 3. Buffer Tabs & Bufferline

Managed by `bufferline.nvim` and `mini.bufremove`.

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<Tab>` | `n` | **Next Buffer (Tab)** | Jump to next buffer (works in GNOME Terminal & all terminals) |
| `<S-Tab>` | `n` | **Previous Buffer (Tab)** | Jump to previous buffer (works in GNOME Terminal & all terminals) |
| `<C-Tab>` | `n` / `i` | **Next Buffer (Tab)** | Jump to next tab (terminals with Kitty/CSI-u protocol like WezTerm) |
| `<C-S-Tab>` | `n` / `i` | **Previous Buffer (Tab)** | Jump to previous tab (terminals with Kitty/CSI-u protocol like WezTerm) |
| `<A-Right>` / `<A-Left>` | `n` / `i` | **Next / Prev Tab** | Jump tabs with Alt+Arrows (works everywhere in Normal & Insert) |
| `<S-l>` / `<S-h>` | `n` | **Next / Prev Tab** | Vim style (Capital `L` / `H`) |
| `<leader>bd` | `n` | **Delete Buffer** | Safely close buffer (keeps splits open) |
| `<leader>bD` | `n` | **Force Delete Buffer** | Close buffer ignoring unsaved changes |
| `<leader>bp` | `n` | **Toggle Pin** | Pin buffer to left of tab bar |
| `<leader>bP` | `n` | **Close Non-Pinned** | Delete all unpinned buffer tabs |
| `<leader>bo` | `n` | **Close Other Buffers** | Close all buffers except the active one |
| `<leader>br` | `n` | **Close Right** | Close all buffers to the right |
| `<leader>bl` | `n` | **Close Left** | Close all buffers to the left |
| `<leader>bb` or `<leader>,` | `n` | **Switch Buffer** | Select buffer via Telescope picker |

---

## 4. File Explorer (Neo-tree — Right Side)

Neo-tree is docked on the **right side** with a fixed width of **25 columns**.

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>e` | `n` | **Toggle File Explorer** | Open or close sidebar tree |
| `<leader>o` | `n` | **Focus File Explorer** | Move cursor focus directly into Neo-tree |
| `<leader>ge` | `n` | **Git Explorer** | Floating Neo-tree filtered to modified git files |
| `<leader>be` | `n` | **Buffer Explorer** | View loaded buffers inside sidebar |

### Keybindings Inside Neo-tree
| Key | Action | Description |
| :--- | :--- | :--- |
| `<CR>` or `l` | **Open** | Open file or expand directory |
| `h` | **Collapse / Up** | Collapse directory or go to parent folder |
| `v` | **Open Vertical Split** | Open selected file in vertical split |
| `s` | **Open Horizontal Split**| Open selected file in horizontal split |
| `t` | **Open Tab** | Open selected file in new Neovim tab |
| `P` | **Toggle Preview** | Open floating preview of file under cursor |
| `a` | **Add Node** | Create file or folder (e.g. `src/utils/api.ts`) |
| `d` | **Delete Node** | Delete file or directory (confirms before deletion) |
| `r` | **Rename Node** | Rename file or folder inline |
| `y` | **Copy to Clipboard** | Copy file path or file node |
| `x` | **Cut to Clipboard** | Cut file node for moving |
| `p` | **Paste from Clipboard** | Paste copied/cut file into target directory |
| `R` | **Refresh** | Reload file tree from disk |
| `?` | **Help** | Display interactive keybinding popup |

---

## 5. Fuzzy Finding (Telescope)

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader><space>` | `n` | **Find Files** | Fast fuzzy search (`rg --hidden`, no `.git`) |
| `<leader>ff` | `n` | **Find Files** | Explicit find files shortcut |
| `<leader>fg` | `n` | **Live Grep** | Search regex across all files in workspace |
| `<leader>fw` | `n` | **Grep Current Word** | Search current word under cursor in project |
| `<leader>fr` | `n` | **Recent Files** | Search recently opened files (MRU) |
| `<leader>fb` | `n` | **Find Buffers** | Search active buffers |
| `<leader>fs` | `n` | **Document Symbols** | Search functions, variables, classes in file |
| `<leader>fS` | `n` | **Workspace Symbols**| Search symbols across the entire project |
| `<leader>fd` | `n` | **Diagnostics** | Search project diagnostics (errors/warnings) |
| `<leader>gc` | `n` | **Git Commits** | Search commit history with live diff preview |
| `<leader>gs` | `n` | **Git Status** | Search modified git files |
| `<leader>gb` | `n` | **Git Branches** | Search and checkout git branches |
| `<leader>fh` | `n` | **Help Tags** | Search Neovim `:help` documentation |
| `<leader>fk` | `n` | **Keymaps** | Search all registered keybindings |
| `<leader>fc` | `n` | **Commands** | Search Vim commands |
| `<leader>fC` | `n` | **Colorschemes** | Live preview and switch themes |
| `<leader>f:` | `n` | **Command History** | Search command-line history |
| `<leader>f/` | `n` | **Search History** | Search previous search query history |
| `<leader>fF` | `n` | **File Browser** | Telescope file system browser (Ivy theme) |

### Telescope Picker Navigation
| Key | Mode | Action |
| :--- | :---: | :--- |
| `<C-j>` / `<C-k>` | `i` / `n` | Select next / previous item |
| `<Down>` / `<Up>` | `i` / `n` | Select next / previous item |
| `<CR>` | `i` / `n` | Open selected item |
| `<C-v>` | `i` / `n` | Open item in vertical split |
| `<C-x>` | `i` / `n` | Open item in horizontal split |
| `<C-t>` | `i` / `n` | Open item in new tab |
| `<C-u>` / `<C-d>` | `i` / `n` | Scroll preview up / down |
| `<Tab>` / `<S-Tab>` | `i` / `n` | Toggle multi-select item |
| `<C-q>` | `i` / `n` | Send all results to Quickfix list |
| `<M-q>` | `i` / `n` | Send marked results to Quickfix list |
| `<C-d>` (in buffers) | `i` | Close buffer directly from picker |
| `dd` (in buffers) | `n` | Close buffer directly from picker |
| `<Esc>` or `q` | `n` | Close Telescope |

---

## 6. Harpoon 2 Quick Marks

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>ha` | `n` | **Add to Harpoon** | Pin current file to persistent Harpoon list |
| `<leader>hh` | `n` | **Toggle Menu** | Open Harpoon menu to reorder or view list |
| `<leader>h1` | `n` | **Jump File 1** | Instantly open pinned file #1 |
| `<leader>h2` | `n` | **Jump File 2** | Instantly open pinned file #2 |
| `<leader>h3` | `n` | **Jump File 3** | Instantly open pinned file #3 |
| `<leader>h4` | `n` | **Jump File 4** | Instantly open pinned file #4 |

---

## 7. GitHub Copilot & AI Code Generation

Integrated seamlessly with `saghen/blink.cmp`.

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<Tab>` | `i` | **Smart Accept** | Accepts Copilot ghost text suggestion. If none, jumps to next snippet placeholder; if none, inserts standard indent |
| `<C-j>` | `i` | **Accept Suggestion** | Alternative explicit shortcut to accept Copilot suggestion |
| `<C-Right>` | `i` | **Accept Word** | Accept only the next word from suggestion |
| `<C-Down>` | `i` | **Accept Line** | Accept only the next line from suggestion |
| `<M-]>` | `i` | **Next Suggestion** | Cycle to next alternative suggestion |
| `<M-[>` | `i` | **Previous Suggestion** | Cycle to previous alternative suggestion |
| `<M-\>` | `i` | **Dismiss** | Dismiss active suggestion |
| `<S-Tab>` | `i` | **Snippet Prev** | Jump backward to previous snippet placeholder |

### Copilot Chat & Cursor-like AI (`CopilotChat.nvim`)

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>aa` | `n` / `v` | **Toggle Chat** | Open / close Copilot Chat sidebar (VS Code / Cursor style) |
| `<leader>ai` | `n` / `v` | **Inline Floating Chat** | Open centered floating chat window (Cursor style) |
| `<leader>aq` | `n` / `v` | **Quick Chat** | Prompt AI inline with selection / buffer context |
| `<leader>ap` | `n` / `v` | **Prompt Actions** | Open interactive picker for all preset AI actions |
| `<leader>ae` | `n` / `v` | **Explain Code** | Ask AI to explain the selected code |
| `<leader>af` | `n` / `v` | **Fix Bug / Error** | Ask AI to fix diagnostics or errors in selection |
| `<leader>ao` | `n` / `v` | **Optimize** | Optimize performance and clean up code |
| `<leader>at` | `n` / `v` | **Generate Tests** | Automatically create unit tests for selected code |
| `<leader>ad` | `n` / `v` | **Generate Docs** | Generate comprehensive docstrings / JSDoc |
| `<leader>ar` | `n` / `v` | **Review Code** | Code review for bugs, security & style |
| `<leader>am` | `n` / `v` | **Commit Message** | Generate a Conventional Commit message |
| `<leader>ax` | `n` / `v` | **Reset Chat** | Clear conversation history |

### Auto Template Strings (`template-string.nvim`)
* Typing `${` inside `'...'` or `"..."` automatically converts quotes to template backticks `` `...${}...` `` in JavaScript, TypeScript, JSX, TSX, and Python.
* Deleting `${}` automatically reverts back to regular quotes.


---

## 8. Multi-Cursor (`vim-visual-multi`)

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<C-n>` | `n` / `v` | **Find Under** | Select word under cursor and start multi-cursor |
| `<C-n>` | `VM` | **Next Occurrence** | Add next matching occurrence to selection |
| `<C-x>` | `VM` | **Skip Occurrence** | Skip current match and proceed to next |
| `<C-p>` | `VM` | **Prev Occurrence** | Remove last selected match and step back |
| `n` / `N` | `VM` | **Next / Prev** | Navigate between active cursors |
| `i` / `a` | `VM` | **Insert / Append** | Enter Insert mode at all cursors simultaneously |
| `c` / `s` | `VM` | **Change / Substitute**| Replace text at all cursors |
| `q` or `<Esc>` | `VM` | **Exit Multi-Cursor** | Return to standard Neovim Normal mode |

---

## 9. LSP & Code Intelligence (Lspsaga & Diagnostics)

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `K` | `n` | **Hover Doc** | Show rich documentation & type signature via Lspsaga |
| `gd` | `n` | **Goto Definition** | Jump to symbol definition via Lspsaga |
| `gp` | `n` | **Peek Definition** | Preview definition in a floating window (Lspsaga) |
| `gD` | `n` | **Goto Declaration** | Jump to declaration |
| `gr` | `n` | **Find References** | Open Telescope references picker (cursor theme) |
| `gi` | `n` | **Implementations** | Open Telescope implementations picker |
| `<leader>cf` | `n` | **LSP Finder** | Lspsaga finder showing definitions & references |
| `<leader>co` | `n` | **Symbol Outline** | Floating outline of symbols in current file |
| `<leader>cr` | `n` | **Rename Symbol** | Live incremental rename with `inc-rename.nvim` |
| `<leader>ci` | `n` | **Auto-Import** | Automatically imports missing TS/JS identifier |
| `<leader>cc` | `n` / `x` | **Run CodeLens** | Execute the CodeLens action under the cursor (view references/implementations) |
| `<leader>cC` | `n` | **Refresh CodeLens** | Refresh & re-display inline reference counts ("X references") |
| `<leader>cp` | `n` | **Visual Color Picker** | Open graphical color picker (2D palette + eyedropper) |
| `Ctrl+Click` / `Double-Click` | `n` / `i` | **Click Color** | Click on any color code to open visual color picker |
| `[d` | `n` | **Prev Diagnostic** | Jump to previous error/warning (Lspsaga) |
| `]d` | `n` | **Next Diagnostic** | Jump to next error/warning (Lspsaga) |
| `<leader>cd` | `n` | **Line Diagnostics** | Show floating diagnostics for current line (Lspsaga) |
| `<leader>do` | `n` | **Diagnostic Float** | Open standard Neovim diagnostic float |
| `<leader>dl` | `n` | **List Diagnostics** | Open Telescope diagnostics search |

---

## 10. Code Actions & Refactoring

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>ca` | `n` / `v` | **Code Actions Preview** | Menu with live diff preview (`actions-preview.nvim`) |
| `<leader>re` | `v` | **Extract Function** | Extract highlighted block into new function |
| `<leader>rf` | `v` | **Extract to File** | Extract highlighted function into separate file |
| `<leader>rv` | `v` | **Extract Variable** | Extract expression into variable |
| `<leader>ri` | `n` / `v` | **Inline Variable** | Inline selected variable declaration |

---

## 11. Formatting & Linters

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>cf` | `n` / `v` | **Format Document** | Format buffer or selection via `conform.nvim` |
| `<leader>uf` | `n` | **Toggle Auto-Format** | Enable / disable format-on-save globally |
| `:ConformInfo` | `cmd` | **Conform Status** | Inspect active formatters for buffer |

---

## 12. Commenting & Surround (`mini.surround`)

### Commenting (`Comment.nvim` + `ts-context-commentstring`)
| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `gcc` | `n` | **Toggle Line Comment** | Comment / uncomment current line |
| `gbc` | `n` | **Toggle Block Comment** | Block comment current line |
| `gc{motion}` | `n` | **Comment Motion** | e.g. `gcip` comments paragraph |
| `gc` | `v` | **Comment Selection** | Comment selected lines (JSX aware `{/* */}`) |

### Surround (`mini.surround`)
| Key | Mode | Action | Example |
| :--- | :---: | :--- | :--- |
| `gsa{motion}{char}` | `n` | **Add Surround** | `gsaiw"` → `"word"` |
| `gsaiw)` | `n` | **Surround Parens** | `gsaiw)` → `(word)` |
| `gsaiw(` | `n` | **Surround Parens (Spaced)** | `gsaiw(` → `( word )` |
| `gsaiwt` | `n` | **Surround Tag** | `gsaiwt` → `<tag>word</tag>` |
| `gsd{char}` | `n` | **Delete Surround** | `gsd"` removes surrounding `"` |
| `gsdt` | `n` | **Delete Tag** | `gsdt` removes surrounding HTML/JSX tag |
| `gsr{old}{new}` | `n` | **Replace Surround** | `gsr"'` replaces `"` with `'` |
| `gsa{char}` | `v` | **Surround Selection** | Select text, press `gsa"` to wrap in `"` |

---

## 13. Search & Replace (Spectre & Vim Search)

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>sr` | `n` / `v` | **Spectre Replace** | Project-wide search and replace interface |
| `<leader>sw` | `n` / `v` | **Spectre Word** | Replace current word project-wide |
| `<leader>sf` | `n` | **Spectre File** | Replace within current file |
| `s{char}{char}` | `n` / `v` | **Flash Jump** | Jump to any 2-character location on screen |
| `S` | `n` / `v` | **Flash Treesitter** | Select syntax tree nodes visually |
| `<leader>nh` | `n` | **Clear Highlight** | Clear current search highlight (`:nohl`) |
| `n` / `N` | `n` | **Next / Prev Result** | Next / previous match (auto-centered) |

---

## 14. Git Suite (LazyGit, Gitsigns, Diffview, Conflicts)

### LazyGit TUI
| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>gg` | `n` | **LazyGit** | Full-featured interactive Git TUI |
| `<leader>gf` | `n` | **LazyGit Current File** | Filter LazyGit log to current file |
| `<leader>gc` | `n` | **LazyGit Commits** | Browse repository commit history |

### Inline Hunks (`gitsigns.nvim`)
| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `]h` / `[h` | `n` | **Next / Prev Hunk** | Jump to next / previous git diff hunk |
| `<leader>hs` | `n` / `v` | **Stage Hunk** | Stage current hunk or visual selection |
| `<leader>hr` | `n` / `v` | **Reset Hunk** | Revert current hunk or visual selection |
| `<leader>hS` | `n` | **Stage Buffer** | Stage all changes in file |
| `<leader>hR` | `n` | **Reset Buffer** | Discard all changes in file |
| `<leader>hu` | `n` | **Undo Stage Hunk** | Undo last hunk staging |
| `<leader>hp` | `n` | **Preview Hunk** | Open floating diff preview of hunk |
| `<leader>hb` | `n` | **Blame Line** | Open complete git blame for line |
| `<leader>gB` | `n` | **Toggle Inline Blame** | Toggle virtual text commit author |
| `<leader>hd` | `n` | **Diff This** | Diff file against git index |
| `<leader>hD` | `n` | **Diff This ~** | Diff file against HEAD |
| `ih` | `o` / `v` | **Hunk Text Object** | Target hunk for operations (e.g. `dih`, `yih`) |

### DiffView & Git Conflicts
| Key | Tool | Action |
| :--- | :--- | :--- |
| `<leader>gd` | Diffview | Open interactive two-way / three-way diff view |
| `<leader>gh` | Diffview | Open git history for current buffer |
| `<leader>gH` | Diffview | Open full git repository history |
| `co` | GitConflict | Choose **Ours** (current branch) |
| `ct` | GitConflict | Choose **Theirs** (incoming branch) |
| `cb` | GitConflict | Choose **Both** |
| `c0` | GitConflict | Choose **None** |
| `]x` / `[x` | GitConflict | Jump to next / previous conflict marker |

---

## 15. Integrated Terminal (ToggleTerm)

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<C-\>` | `n` / `t` | **Toggle Terminal** | Open / close bottom horizontal terminal drawer |
| `<leader>tf` | `n` | **Terminal Float** | Open floating terminal window |
| `<leader>th` | `n` | **Terminal Horizontal** | Open horizontal terminal (height 10) |
| `<leader>tv` | `n` | **Terminal Vertical** | Open vertical terminal (width 80) |
| `<Esc><Esc>` | `t` | **Normal Mode** | Exit terminal insert mode back to Normal mode |
| `<C-\><C-n>` | `t` | **Normal Mode (alt)** | Standard Vim escape from terminal mode |

---

## 16. Full-Stack Tooling (REST API & Dadbod Database)

### REST & HTTP Testing (`kulala.nvim`)
| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>rs` | `n` | **Send Request** | Execute HTTP request under cursor (`.http` files) |
| `<leader>rt` | `n` | **Toggle Response** | Toggle floating / split HTTP response view |
| `<leader>rp` | `n` | **Previous Request** | Jump to previous request block |
| `<leader>rn` | `n` | **Next Request** | Jump to next request block |
| `<leader>rc` | `n` | **Copy as cURL** | Convert request under cursor to cURL command |
| `<leader>ri` | `n` | **Inspect Request** | Inspect headers and request metadata |

### Database Management (`vim-dadbod-ui`)
| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>db` | `n` | **Toggle DBUI** | Open / close database UI drawer |
| `<CR>` | `n` | **Execute / Expand** | Expand tree item or execute query |
| `S` | `n` | **Execute SQL File** | Run whole SQL buffer against active DB |
| `A` | `n` | **Add Connection** | Add new database connection string |
| `R` | `n` | **Rename Buffer** | Rename SQL scratch buffer |
| `D` | `n` | **Delete Buffer** | Delete SQL scratch buffer |

---

## 17. Testing & Debugging (Neotest & DAP)

### Neotest (`lazyvim.plugins.extras.test.core`)
| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>tr` | `n` | **Run Nearest** | Run test nearest to cursor |
| `<leader>tt` | `n` | **Run File** | Run all tests in current file |
| `<leader>tT` | `n` | **Run All Files** | Run all test suites across project |
| `<leader>tl` | `n` | **Run Last Test** | Rerun previous test execution |
| `<leader>ts` | `n` | **Toggle Summary** | Open / close interactive test runner summary |
| `<leader>to` | `n` | **Show Output** | View output of current test |
| `<leader>tO` | `n` | **Toggle Output Panel** | Open persistent bottom test output panel |
| `<leader>tS` | `n` | **Stop Test** | Cancel running test execution |
| `<leader>tw` | `n` | **Toggle Watch** | Watch current test and rerun on save |
| `<leader>td` | `n` | **Debug Nearest** | Run nearest test with debugger attached |

### Debugger (`nvim-dap`)
| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>dB` | `n` | **Breakpoint Condition**| Add conditional breakpoint |
| `<leader>dc` | `n` | **Continue / Start** | Continue execution to next breakpoint |
| `<leader>di` | `n` | **Step Into** | Step into function call |
| `<leader>dO` | `n` | **Step Over** | Step over current statement |
| `<leader>do` | `n` | **Step Out** | Step out of current scope |
| `<leader>du` | `n` | **Toggle DAP UI** | Open / close graphical debug panels |
| `<leader>dt` | `n` | **Terminate** | Stop debug session |

---

## 18. UI Toggles, Focus & Session Management

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>uT` | `n` | **Tailwind Conceal** | Hide lengthy Tailwind CSS classes into clean icons |
| `<leader>z` | `n` | **Zen Mode** | Distraction-free editing (centered buffer, no clutter) |
| `<leader>ut` | `n` | **Toggle Twilight** | Dim inactive code blocks to highlight active scope |
| `<leader>uf` | `n` | **Toggle Auto-Format** | Toggle automatic format-on-save |
| `<leader>ud` | `n` | **Toggle Diagnostics** | Show / hide inline diagnostic indicators |
| `<leader>uD` | `n` | **Toggle Inline Diagnostic Details** | Toggle tiny-inline-diagnostic multi-line overlay |
| `<leader>ul` | `n` | **Toggle Line Numbers** | Show / hide line numbers |
| `<leader>sn` | `n` | **Noice History** | View notifications history |
| `<leader>sl` | `n` | **Noice Last Message**| Display last notification popup |
| `<leader>sd` | `n` | **Dismiss Notifications**| Clear all active popups from screen |
| `<leader>qs` | `n` | **Restore Session** | Restore open tabs/windows for current project |
| `<leader>ql` | `n` | **Restore Last Session**| Restore previous session |
| `<leader>qd` | `n` | **Don't Save Session** | Close editor without saving current session |

---

## 19. Code Folding (`nvim-ufo`)

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `zR` | `n` | **Open All Folds** | Expand all folds in buffer |
| `zM` | `n` | **Close All Folds** | Collapse all folds in buffer |
| `za` | `n` | **Toggle Fold** | Toggle fold under cursor |
| `zo` | `n` | **Open Fold** | Open fold under cursor |
| `zc` | `n` | **Close Fold** | Close fold under cursor |

---

## 20. Quickfix & Location Lists

| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>qo` | `n` | **Open Quickfix** | Open Quickfix list window |
| `<leader>qc` | `n` | **Close Quickfix** | Close Quickfix list window |
| `<leader>qn` or `]q` | `n` | **Next Quickfix** | Jump to next error or result |
| `<leader>qp` or `[q` | `n` | **Prev Quickfix** | Jump to previous error or result |
| `<leader>tc` | `n` | **TypeScript Type-Check** | Run asynchronous project-wide `tsc --noEmit` check |
| `<leader>xx` | `n` | **Trouble Diagnostics**| Open Trouble diagnostic panel |
| `<leader>xX` | `n` | **Trouble Buffer** | Open Trouble buffer-only diagnostics |
| `<leader>xQ` | `n` | **Trouble Quickfix** | View Quickfix items in Trouble UI |
| `<leader>xL` | `n` | **Trouble LocList** | View Location List items in Trouble UI |

---

## 21. Vim Operators, Text Objects & Yanky

### Yanky Clipboard History (`lazyvim.plugins.extras.coding.yanky`)
| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `p` / `P` | `n` | **Paste** | Paste after / before cursor |
| `[y` | `n` | **Cycle Yank History Prev** | Cycle to older copied item after paste |
| `]y` | `n` | **Cycle Yank History Next** | Cycle to newer copied item after paste |
| `[p` / `]p` | `n` | **Put Indented** | Paste matching indentation of target line |
| `<leader>p` | `n` / `x` | **Yank History Picker** | Open searchable list of clipboard items |

### Essential Text Objects
| Key | Selection Scope |
| :--- | :--- |
| `iw` / `aw` | Inner word / A word (includes surrounding whitespace) |
| `i"` / `a"` | Inside / around double quotes |
| `i'` / `a'` | Inside / around single quotes |
| `i\`` / `a\`` | Inside / around backtick template literals |
| `i(` / `a(` | Inside / around parentheses `()` |
| `i{` / `a{` | Inside / around curly braces `{}` |
| `i[` / `a[` | Inside / around square brackets `[]` |
| `it` / `at` | Inside / around HTML/JSX tags |
| `ip` / `ap` | Inside / around paragraph / code block |
---

## 22. Task Runner (`overseer.nvim`) & Package Lens (`package-info.nvim`)

### Overseer Task Runner (NPM scripts, dev servers, builds)
| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>or` | `n` | **Run Task** | Select and launch npm scripts, build commands |
| `<leader>ot` | `n` | **Toggle Task Panel** | Open / close background tasks sidebar |
| `<leader>oa` | `n` | **Task Action** | Restart, stop, or inspect current task |
| `<leader>oi` | `n` | **Overseer Info** | View task runner diagnostics & status |

### Package Info (package.json version lens)
| Key | Mode | Action | Description |
| :--- | :---: | :--- | :--- |
| `<leader>np` | `n` | **Toggle Package Versions** | Show / hide outdated version badges in `package.json` |
| `<leader>nu` | `n` | **Update Package** | Upgrade dependency to latest version |
| `<leader>nd` | `n` | **Delete Package** | Remove dependency and uninstall |
| `<leader>ni` | `n` | **Install Package** | Add a new npm dependency |
| `<leader>nv` | `n` | **Change Version** | Select specific version to install |

---

## 23. Complete Master `<leader>` Keymap Index

Quick alphabetical reference for all mapped `<leader>` commands:

```text
<leader><space> → Find Files (Telescope)
<leader>,       → Switch Buffers
<leader>/       → Live Grep project-wide
<leader>:       → Command History
<leader>?       → Buffer Keymaps (which-key)
<leader>b...    → Buffer operations (bd: delete, bD: force delete, bp: pin, bo: close others)
<leader>c...    → Code & LSP (ca: actions, cr: rename, cf: finder/format, ci: auto-import, co: outline)
<leader>d...    → Debug (DAP) & Database (db: Dadbod UI)
<leader>e       → Toggle Neo-tree File Explorer (Right side)
<leader>f...    → Find (ff: files, fg: grep, fw: word, fr: recent, fb: buffers, fs: symbols)
<leader>g...    → Git (gg: lazygit, gs: status, gc: commits, gd: diffview, gb: branches)
<leader>h...    → Harpoon (ha: add, hh: menu, h1-h4: jump files) & Hunks (hs: stage, hr: reset, hp: preview)
<leader>n...    → NPM Packages (np: toggle versions, nu: update, ni: install, nd: delete) & nh: clear highlight
<leader>o...    → Focus Neo-tree (<leader>o) & Task Runner (or: run, ot: toggle panel, oa: action)
<leader>p       → Yank History (Yanky picker)
<leader>q...    → Session (qs: restore, ql: restore last, qd: don't save) & Quickfix (qo: open, qc: close)
<leader>r...    → Refactor (re: extract func, rv: extract var) & REST API (rs: send, rt: response)
<leader>s...    → Search & Replace (sr: spectre, sw: word) & Notifications (sn: history, sd: dismiss)
<leader>t...    → Terminal (tf: float, th: horiz, tv: vert) & Test (tr: run, tt: file, ts: summary)
<leader>u...    → UI Toggles (uT: tailwind conceal, ut: twilight, uf: format on save)
<leader>w...    → Window splits (wv: vertical, ws: horizontal, we: equal, wx: close)
<leader>x...    → Diagnostics & Trouble (xx: diagnostics, xX: buffer, xQ: quickfix, xL: loclist)
<leader>z       → Zen Mode (Distraction-free)
```

---
_Document generated for dzgeek dotfiles configuration._  
_For hands-on tutorials and day-to-day workflow mastery, proceed to [COURSE.md](file:///home/dzgeek/dotfiles/config/.config/nvim/COURSE.md)._
