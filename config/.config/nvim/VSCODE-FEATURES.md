# 🚀 Neovim in VSCode: The Ultimate Keybindings & Command Bridge

> **Companion Guide for `asvetliakov.vscode-neovim` & LazyVim**  
> Generated for: `dzgeek` · Machine OS: Linux  
> Source Configs: `~/.config/Code/User/` & `~/.config/nvim/`

---

## 📑 Table of Contents
1. [Architecture & How VSCode Neovim Works](#1-architecture--how-vscode-neovim-works)
2. [Master Reference Table: Neovim vs VSCode Shortcuts](#2-master-reference-table-neovim-vs-vscode-shortcuts)
   - [Navigation & Viewport](#navigation--viewport)
   - [Splits & Window Management](#splits--window-management)
   - [Buffers & Editor Tabs](#buffers--editor-tabs)
   - [File Explorer & Tree](#file-explorer--tree)
   - [Search, Grep & Fuzzy Finding](#search-grep--fuzzy-finding)
   - [Code Intelligence & LSP](#code-intelligence--lsp)
   - [Code Editing, Formatting & Comments](#code-editing-formatting--comments)
   - [Multi-Cursor & Selection](#multi-cursor--selection)
   - [Git & Version Control](#git--version-control)
   - [Terminal Integration](#terminal-integration)
   - [Code Folding](#code-folding)
3. [Native Neovim Commands That Work 100% in VSCode](#3-native-neovim-commands-that-work-100-in-vscode)
4. [Neovim Ex Commands (`:`) Intercepted & Translated](#4-neovim-ex-commands--intercepted--translated)
5. [What Does NOT Work in VSCode & The Solution](#5-what-does-not-work-in-vscode--the-solution)
6. [Your Active System Config & Custom Keybindings](#6-your-active-system-config--custom-keybindings)
7. [How to Create Custom Mappings (Lua & VSCode JSON)](#7-how-to-create-custom-mappings-lua--vscode-json)
8. [Neovim Plugins in VSCode: Compatibility & Configuration](#8-neovim-plugins-in-vscode-compatibility--configuration)
9. [Quick Summary Cheatsheet](#-quick-summary-cheatsheet)

---

## 1. Architecture & How VSCode Neovim Works

Unlike traditional Vim emulators (e.g. `VSCodeVim`), the **VSCode Neovim extension (`asvetliakov.vscode-neovim`) embeds a real headless Neovim instance (`nvim --embed`)** behind the scenes.

```
┌────────────────────────────────────────────────────────────┐
│                    VSCode Frontend (GUI)                   │
│   • Buffer Display & Syntax Highlighting                   │
│   • File Explorer & Sidebars                               │
│   • Integrated Terminal & Debugger (DAP)                   │
│   • Language Server Protocols (LSP) & CodeLens             │
└───────────────────────────┬────────────────────────────────┘
                            │ RPC Communication
                            │ (Commands & Cursor Sync)
┌───────────────────────────▼────────────────────────────────┐
│               Headless Neovim Engine (Backend)             │
│   • Normal, Insert, Visual, Select, Cmdline Modes          │
│   • Registers, Marks, Macros, Dot-Repeat (.)               │
│   • Text Objects, Motions, Operators                       │
│   • Ex commands (:%s/pattern/replace/g, :g/re/d)          │
│   • Lua plugins (mini.surround, mini.ai, yanky, etc.)     │
└────────────────────────────────────────────────────────────┘
```

### The Division of Responsibilities
* **Handled by Neovim Engine**: Text mutations, cursor movements, modal logic (Normal, Visual, Block, Insert, Command), registers (`"0`, `"+`), marks, recording macros (`q`), text objects (`iw`, `a(`, `i"`), operators (`c`, `d`, `y`, `gu`), dot-repeat (`.`).
* **Handled by VSCode GUI**: File trees, open tabs, window splits, floating popups, quick open picker, terminal, syntax token rendering, linters, hover widgets.

---

## 2. Master Reference Table: Neovim vs VSCode Shortcuts

### Navigation & Viewport

| Feature | Neovim Keybinding | VSCode Shortcut (Default) | VSCode Neovim Built-in Action |
| :--- | :--- | :--- | :--- |
| **Basic Motion** | `h`, `j`, `k`, `l` | Arrow Keys | Native Neovim movement |
| **Wrapped Line Motion** | `gj`, `gk` | `Down`, `Up` | Intercepted -> `cursorMove` (by wrapped line) |
| **Start / End of Wrapped Line** | `g0`, `g$` | `Home`, `End` | Intercepted -> `wrappedLineFirst/LastNonWhitespace` |
| **Scroll Half Page Down** | `<C-d>` | `PageDown` | Smooth scroll half page |
| **Scroll Half Page Up** | `<C-u>` | `PageUp` | Smooth scroll half page |
| **Scroll Full Page Down** | `<C-f>` | `PageDown` | Intercepted -> VSCode page scroll |
| **Scroll Full Page Up** | `<C-b>` | `PageUp` | Intercepted -> VSCode page scroll |
| **Center Viewport** | `zz` or `z.` | *(None)* | Intercepted -> VSCode reveal cursor center |
| **Top Viewport** | `zt` or `z<CR>` | *(None)* | Intercepted -> VSCode reveal cursor top |
| **Bottom Viewport** | `zb` or `z-` | *(None)* | Intercepted -> VSCode reveal cursor bottom |
| **Jump Cursor to Top/Mid/Bot**| `H`, `M`, `L` | *(None)* | Moves cursor relative to visible screen |
| **Navigate Back (Jumplist)** | `<C-o>` or `<C-t>` | `Alt+Left` / `Ctrl+Alt+-` | Intercepted -> `workbench.action.navigateBack` |
| **Navigate Forward (Jumplist)**| `<C-i>` or `<Tab>` | `Alt+Right` / `Ctrl+Shift+-` | Intercepted -> `workbench.action.navigateForward` |
| **Go to Line Number** | `{line}G` or `:{line}`| `Ctrl+G` | Both work directly |
| **Match Next / Prev Search** | `n` / `N` | `F3` / `Shift+F3` | Real Neovim search jump |

---

### Splits & Window Management

In VSCode, Neovim window splits map directly to **VSCode Editor Groups**.

| Action | Neovim Keybinding | VSCode Shortcut | VSCode Neovim Command / Action |
| :--- | :--- | :--- | :--- |
| **Split Vertically** | `<C-w>v` or `:vsp` | `Ctrl+\` or `Ctrl+K \` | `workbench.action.splitEditorRight` |
| **Split Horizontally** | `<C-w>s` or `:sp` | `Ctrl+K Ctrl+\` | `workbench.action.splitEditorDown` |
| **Close Active Split** | `<C-w>c`, `<C-w>q`, `:q`| `Ctrl+W` (or `Alt+W`) | `workbench.action.closeActiveEditor` |
| **Close Other Splits** | `<C-w>o` or `:only` | `Ctrl+K Ctrl+Shift+W` | `workbench.action.joinAllGroups` |
| **Focus Left Split** | `<C-w>h` | `Ctrl+K Left` | `workbench.action.navigateLeft` |
| **Focus Right Split** | `<C-w>l` | `Ctrl+K Right` | `workbench.action.navigateRight` |
| **Focus Up Split** | `<C-w>k` | `Ctrl+K Up` | `workbench.action.navigateUp` |
| **Focus Down Split** | `<C-w>j` | `Ctrl+K Down` | `workbench.action.navigateDown` |
| **Cycle Next Split Group** | `<C-w>w` | `Ctrl+1`, `Ctrl+2`... | `workbench.action.focusNextGroup` |
| **Cycle Previous Split Group**| `<C-w>W` or `<C-w>p` | `Ctrl+K Ctrl+Left` | `workbench.action.focusPreviousGroup` |
| **Move Editor to Left Group** | `<C-w><C-h>` | `Ctrl+Alt+Left` | `workbench.action.moveEditorToLeftGroup` |
| **Move Editor to Right Group**| `<C-w><C-l>` | `Ctrl+Alt+Right` | `workbench.action.moveEditorToRightGroup` |
| **Move Editor Group Left** | `<C-w><S-h>` | *(Command Palette)* | `workbench.action.moveActiveEditorGroupLeft` |
| **Move Editor Group Right**| `<C-w><S-l>` | *(Command Palette)* | `workbench.action.moveActiveEditorGroupRight` |
| **Equalize Split Sizes** | `<C-w>=` | *(None)* | `workbench.action.evenEditorWidths` |
| **Maximize Split Toggle** | `<C-w>_` | *(None)* | `workbench.action.toggleEditorWidths` |
| **Increase Width / Height** | `<C-w>>` / `<C-w>+` | *(None)* | `workbench.action.increaseViewWidth/Height` |
| **Decrease Width / Height** | `<C-w><` / `<C-w>-` | *(None)* | `workbench.action.decreaseViewWidth/Height` |

---

### Buffers & Editor Tabs

| Action | Neovim / LazyVim Key | VSCode Native Shortcut | VSCode Neovim Equivalent |
| :--- | :--- | :--- | :--- |
| **Next Tab / Buffer** | `<S-l>` or `gt` or `]b` | `Ctrl+PageDown` | `workbench.action.nextEditorInGroup` |
| **Previous Tab / Buffer** | `<S-h>` or `gT` or `[b` | `Ctrl+PageUp` | `workbench.action.previousEditorInGroup` |
| **Jump to N-th Tab** | `{n}gt` | `Alt+1` .. `Alt+9` | `workbench.action.openEditorAtIndex{n}` |
| **Close Tab** | `<leader>bd` or `:bd` | `Ctrl+W` (or `Alt+W`) | `workbench.action.closeActiveEditor` |
| **Close All Tabs** | `:qa` or `:qall` | `Ctrl+K Ctrl+W` | `workbench.action.closeAllEditors` |
| **Close Other Tabs** | `:tabonly` | `Ctrl+K Ctrl+T` | `workbench.action.closeOtherEditors` |
| **Reopen Closed Tab** | *(None)* | `Ctrl+Shift+T` | `workbench.action.reopenClosedEditor` |
| **Switch Buffer (Picker)** | `<leader>bb` or `<leader>,`| `Ctrl+Tab` | `workbench.action.quickOpenPreviousRecentlyUsedEditor` |
| **New Empty File** | `:enew` or `:new` | `Ctrl+N` | `workbench.action.files.newUntitledFile` |
| **Save File** | `:w` or `<C-s>` | `Ctrl+S` | `workbench.action.files.save` |
| **Save and Close** | `:wq` or `ZZ` | *(None)* | Saves file then closes active editor |
| **Force Close Without Save** | `:q!` or `ZQ` | *(None)* | `workbench.action.revertAndCloseActiveEditor` |

---

### File Explorer & Tree

> In Neovim, this is handled by `neo-tree` or `nvim-tree`. In VSCode, it is handled by the **VSCode Explorer Viewlet**.  
> When focus is inside the VSCode Explorer pane, **the extension gives you Vim keybindings directly inside the tree!**

| Action | Neovim (Neo-tree) | VSCode Default | Inside VSCode Explorer Focus |
| :--- | :--- | :--- | :--- |
| **Toggle File Explorer** | `<leader>e` | `Ctrl+Shift+E` / `Ctrl+B` | `workbench.action.toggleSidebarVisibility` |
| **Navigate Up / Down** | `k` / `j` | `Up` / `Down` | `k` / `j` |
| **Open File / Folder** | `<CR>` or `l` | `Enter` | `<CR>` or `l` |
| **Collapse Folder / Up** | `h` | `Left` | `h` |
| **New File** | `a` | *(Mouse Click)* | `a` (`explorer.newFile`) |
| **New Folder** | `A` or `a` with `/` | *(Mouse Click)* | `Shift+A` (`explorer.newFolder`) |
| **Rename File** | `r` | `F2` | `r` (`renameFile`) |
| **Delete File** | `d` | `Delete` | `d` (`deleteFile`) |
| **Copy File** | `y` | `Ctrl+C` | `y` (`filesExplorer.copy`) |
| **Cut File** | `x` | `Ctrl+X` | `x` (`filesExplorer.cut`) |
| **Paste File** | `p` | `Ctrl+V` | `p` (`filesExplorer.paste`) |
| **Open to Side (Split)** | `v` | `Ctrl+Enter` | `v` (`explorer.openToSide`) |
| **Refresh Tree** | `R` | *(Mouse Click)* | `Shift+R` / `R` (`refreshFilesExplorer`) |
| **Expand / Collapse All** | `zR` / `zM` | *(None)* | `zo`, `zc`, `zm`, `za` |
| **Focus Editor back** | `<Esc>` | *(None)* | `Ctrl+W p` or click editor |

---

### Search, Grep & Fuzzy Finding

> In Neovim, fuzzy search is powered by `Telescope` or `Fzf-lua`. In VSCode, use **Quick Open** and **Find in Files**.

| Feature | Neovim (Telescope) | VSCode Native Shortcut | VSCode Neovim Bridge |
| :--- | :--- | :--- | :--- |
| **Find Files (Fuzzy)** | `<leader><space>` or `<leader>ff` | `Ctrl+P` | `:Find` or `workbench.action.quickOpen` |
| **Live Grep (Project Search)**| `<leader>/` or `<leader>fg` | `Ctrl+Shift+F` | `workbench.action.findInFiles` |
| **Search Word Under Cursor** | `<leader>fw` or `*` | `Ctrl+Shift+F` (pre-filled)| `workbench.action.findInFiles` |
| **Find in Current Buffer** | `/pattern` | `Ctrl+F` | Real Vim `/` or VSCode `Ctrl+F` |
| **Replace in Current Buffer** | `:%s/old/new/g` | `Ctrl+H` | Both work directly |
| **Document Symbols** | `<leader>ss` or `<leader>fs` | `Ctrl+Shift+O` | `gO` or `workbench.action.gotoSymbol` |
| **Workspace Symbols** | `<leader>fS` | `Ctrl+T` | `workbench.action.quickOpen` (with `#`) |
| **Command Palette** | `<leader>fc` or `:` | `Ctrl+Shift+P` / `F1` | `workbench.action.showCommands` |
| **View Diagnostics / Errors** | `<leader>xx` or `<leader>fd` | `Ctrl+Shift+M` | `workbench.actions.view.problems` |
| **Recent Files (MRU)** | `<leader>fr` | `Ctrl+R` | `workbench.action.openRecent` |
| **Clear Search Highlights** | `:noh` or `<leader>nh` | `Escape` | Clears Vim search highlights |

---

### Code Intelligence & LSP

> In Neovim, this is handled by `nvim-lspconfig` and `Lspsaga`. VSCode handles this natively via language servers and extensions.

| Feature | Neovim Key | VSCode Shortcut | VSCode Neovim Keymap |
| :--- | :--- | :--- | :--- |
| **Go to Definition** | `gd` | `F12` | `gd` or `<C-]>` (`revealDefinition`) |
| **Peek Definition** | `gD` or `<leader>cd` | `Alt+F12` | `gD` (`peekDefinition`) |
| **Go to Declaration** | `gf` | *(None)* | `gf` (`revealDeclaration`) |
| **Peek Declaration** | `gF` | *(None)* | `gF` (`peekDeclaration`) |
| **Open Definition on Side** | `<C-w>gd` or `<C-w>gf` | `Ctrl+K F12` | `<C-w>gd` (`revealDefinitionAside`) |
| **Find References** | `gr` or `gH` | `Shift+F12` | `gH` or `gr` (`referenceSearch.trigger`) |
| **Show Hover / Docs** | `K` or `gh` | `Ctrl+K Ctrl+I` | `K` or `gh` (`editor.action.showHover`) |
| **Signature Help (Hints)** | `gK` or `<C-k>` | `Ctrl+Shift+Space` | `editor.action.triggerParameterHints` |
| **Rename Symbol** | `<leader>cr` or `F2` | `F2` | `editor.action.rename` |
| **Code Action / Quick Fix** | `<leader>ca` | `Ctrl+.` or `Alt+Enter` | `z=` (`editor.action.quickFix`) |
| **Next Diagnostic (Error)** | `]d` or `F8` | `F8` | `]d` (`editor.action.marker.next`) |
| **Prev Diagnostic (Error)** | `[d` or `Shift+F8` | `Shift+F8` | `[d` (`editor.action.marker.prev`) |
| **Trigger Auto-Complete** | `<C-Space>` | `Ctrl+Space` | `editor.action.triggerSuggest` |
| **Scroll Hover Widget** | *(Neovim scroll)* | `PageUp/Down` | In Hover: `j`, `k`, `<C-d>`, `<C-u>`, `gg`, `G` |

---

### Code Editing, Formatting & Comments

| Feature | Neovim Key | VSCode Shortcut | Built-in VSCode Neovim Support |
| :--- | :--- | :--- | :--- |
| **Toggle Line Comment** | `gcc` | `Ctrl+/` | `gcc` (Normal) or `<C-/>` |
| **Comment Selection** | `gc` | `Ctrl+/` | `gc` (Visual motion) |
| **Block Comment** | `gbc` | `Shift+Alt+A` | Works via visual block comment |
| **Format Document** | `<leader>cf` | `Shift+Alt+F` | `gqq` or `==` or `Shift+Alt+F` |
| **Format Selection** | `=` or `gq` | `Ctrl+K Ctrl+F` | `=` or `gq` with text object / visual |
| **Surround Text (mini.surround)**| `saiw"` (add surround) | *(Extension dependent)* | `sa{motion}{char}` or `ys{motion}{char}` |
| **Delete Surround** | `sd"` (delete surround) | *(Extension dependent)* | `sd{char}` or `ds{char}` |
| **Change Surround** | `sr"'` (change " to ') | *(Extension dependent)* | `sr{old}{new}` or `cs{old}{new}` |
| **Move Line Up** | `<A-k>` or `[e` | `Alt+Up` | `Alt+Up` (both work) |
| **Move Line Down** | `<A-j>` or `]e` | `Alt+Down` | `Alt+Down` (both work) |
| **Duplicate Line Down** | `yyp` | `Shift+Alt+Down` | Both work directly |
| **Undo / Redo** | `u` / `<C-r>` | `Ctrl+Z` / `Ctrl+Y` | Synchronized with VSCode Undo Tree! |
| **Dot-Repeat** | `.` | *(None)* | Real Neovim dot-repeat! |

---

### Multi-Cursor & Selection

> VSCode Neovim provides native multi-cursor interoperability!

| Action | Neovim (vim-visual-multi) | VSCode Native Shortcut | VSCode Neovim Method |
| :--- | :--- | :--- | :--- |
| **Add Next Occurrence** | `<C-n>` | `Ctrl+D` | Press `Ctrl+D` directly |
| **Skip Current Occurrence** | `q` | `Ctrl+K Ctrl+D` | `Ctrl+K Ctrl+D` (configured in your keybindings) |
| **Undo Last Occurrence** | `Q` | `Ctrl+U` | `Ctrl+U` in VSCode |
| **Select All Occurrences** | `<leader>m` / `\\A` | `Ctrl+Shift+L` | `Ctrl+Shift+L` |
| **Multi-Cursor Insert (Lines)**| *(Visual Multi)* | *(None)* | In Visual Line: `mi` (at start) or `ma` (at end) |
| **Multi-Cursor Insert (Block)**| *(Visual Block)* | `Shift+Alt+Up/Down` | In Visual Block: `mi` (before block) or `ma` (after) |
| **Account for Empty Lines** | *(None)* | *(None)* | `mI` / `mA` in Visual Line mode |
| **Add Cursor with Mouse** | *(None)* | `Alt+Click` | `Alt+Click` |

---

### Git & Version Control

> In Neovim, Git is managed via `LazyGit` and `gitsigns.nvim`. In VSCode, Git is managed natively in the **Source Control Viewlet** and gutter diff indicators.

| Feature | Neovim Key (LazyGit / Gitsigns) | VSCode Shortcut | VSCode Neovim Equivalent |
| :--- | :--- | :--- | :--- |
| **Toggle Git / LazyGit** | `<leader>gg` | `Ctrl+Shift+G` | `workbench.view.scm` (Source Control panel) |
| **Next Git Hunk / Change** | `]h` or `]c` | `Alt+F5` | `workbench.action.editor.nextChange` |
| **Previous Git Hunk** | `[h` or `[c` | `Shift+Alt+F5` | `workbench.action.editor.previousChange` |
| **Stage Hunk** | `<leader>ghs` | *(Source Control Click)* | Stage via Source Control UI |
| **Undo / Revert Hunk** | `<leader>ghr` | *(Diff inline revert)* | Revert via Inline Diff |
| **Preview Hunk Diff** | `<leader>ghp` | *(Click gutter indicator)*| Click line number gutter change indicator |
| **Git Blame Line** | `<leader>gb` | *(GitLens shortcut)* | GitLens inline blame |
| **Git Diff View** | `<leader>gd` | *(Source Control Diff)*| Open file diff from Source Control |

---

### Terminal Integration

| Feature | Neovim (ToggleTerm) | VSCode Native Shortcut | VSCode Neovim Equivalent |
| :--- | :--- | :--- | :--- |
| **Toggle Terminal** | `<C-/>` or `<leader>ft` | `Ctrl+\`` or `Ctrl+Shift+'` | `workbench.action.terminal.toggleTerminal` |
| **New Terminal Editor** | *(None)* | `Ctrl+Shift+'` | Configured in your `keybindings.json` |
| **Split Terminal** | *(None)* | `Ctrl+/` | Configured in your `keybindings.json` |
| **Focus Next Terminal Pane**| *(None)* | `Ctrl+L` | Configured in your `keybindings.json` |
| **Focus Prev Terminal Pane**| *(None)* | `Ctrl+H` | Configured in your `keybindings.json` |
| **Kill Terminal** | *(None)* | `Ctrl+W` | Configured in your `keybindings.json` |
| **Return to Editor from Term**| `<Esc>` / `<C-\><C-n>` | `Ctrl+Esc` | `workbench.action.focusActiveEditorGroup` |

---

### Code Folding

| Feature | Neovim Key | VSCode Shortcut | VSCode Neovim Action |
| :--- | :--- | :--- | :--- |
| **Toggle Fold** | `za` | `Ctrl+Shift+[` / `]` | `editor.toggleFold` |
| **Open / Unfold** | `zo` | `Ctrl+Shift+]` | `editor.unfold` |
| **Close / Fold** | `zc` | `Ctrl+Shift+[` | `editor.fold` |
| **Open All Folds** | `zR` | `Ctrl+K Ctrl+J` | `editor.unfoldAll` |
| **Close All Folds** | `zM` | `Ctrl+K Ctrl+0` | `editor.foldAll` |
| **Fold Level N** | `zm` / `z{n}` | `Ctrl+K Ctrl+{n}` | `editor.foldLevel{n}` |

---

## 3. Native Neovim Commands That Work 100% in VSCode

Because VSCode Neovim runs a **real embedded Neovim engine**, virtually all core editing mechanics work without needing VSCode mappings:

### 1. Motions & Text Objects
* All text motions: `w`, `W`, `b`, `B`, `e`, `E`, `ge`, `0`, `^`, `$`, `f{char}`, `t{char}`, `;`, `,`, `%`.
* Inner & Around text objects: `iw`, `aw`, `i"`, `a"`, `i'`, `a'`, `i(`, `a(`, `i[`, `a[`, `i{`, `a{`, `it`, `at`, `ip`, `ap`.
* Treesitter text objects (if treesitter textobjects plugin is active): `if` (inner function), `af` (around function), `ic` (inner class), `ac` (around class).

### 2. Operators & Modifiers
* Operators: `d` (delete), `c` (change), `y` (yank), `v` (char visual), `V` (line visual), `<C-v>` (block visual).
* Transformations: `gu` (lowercase), `gU` (uppercase), `g~` (toggle case), `>` (indent), `<` (unindent).
* Dot repeat (`.`): Repeats the last text manipulation command across the buffer.

### 3. Registers, Marks & Macros
* **Registers**:
  * `""` (unnamed register)
  * `"0` (yank register — survives delete/change!)
  * `"+` and `"*` (system clipboard registers)
  * `"a` through `"z` (named registers)
  * `"_` (black hole register: `"_d` deletes without modifying clipboard)
* **Marks**:
  * Set local mark: `m{a-z}` -> Jump to line: `'{a-z}` -> Jump to exact column: `` `{a-z} ``
  * Set global mark: `m{A-Z}` -> Jumps across open files in VSCode!
* **Macros**:
  * Start recording: `q{register}` (e.g. `qa`)
  * Stop recording: `q`
  * Play macro: `@{register}` (e.g. `@a`)
  * Re-play last macro: `@@`
  * Count repeat: `10@a` (runs macro 10 times in Neovim!)

### 4. Advanced Ex Commands
* Buffer regex search & replace:
  ```vim
  :%s/target/replacement/g      " Replace target with replacement throughout buffer
  :%s/target/replacement/gc     " Interactive prompt for each replacement
  :10,25s/old/new/g             " Replace only between lines 10 and 25
  ```
* Global filtering:
  ```vim
  :g/pattern/d                  " Delete all lines matching pattern
  :v/pattern/d                  " Delete all lines NOT matching pattern
  :g/console.log/norm dd        " Execute normal command on matching lines
  ```
* Incremental search: `/search_term`, `?search_term`, `*` (search word forward), `#` (search word backward).

---

## 4. Neovim Ex Commands (`:`) Intercepted & Translated

The extension intercepts several standard Ex commands and routes them through VSCode’s GUI APIs:

| Ex Command | What VSCode Neovim Actually Does |
| :--- | :--- |
| `:w` / `:write` | Triggers VSCode file save (`workbench.action.files.save`) |
| `:wa` / `:wall` | Saves all dirty editors in workspace (`workbench.action.files.saveAll`) |
| `:q` / `:quit` | Closes the active VSCode editor tab (`workbench.action.closeActiveEditor`) |
| `:q!` | Reverts unsaved changes and closes tab (`workbench.action.revertAndCloseActiveEditor`) |
| `:wq` / `:x` | Saves active file and closes editor |
| `:qa` / `:qall` | Closes all open editors (`workbench.action.closeAllEditors`) |
| `:wqa` / `:xa` | Saves all files and closes all editors |
| `:e {path}` | Opens `{path}` in VSCode editor |
| `:e!` | Reverts current buffer to disk version |
| `:enew` / `:new` | Opens a new blank editor (`workbench.action.files.newUntitledFile`) |
| `:find {file}` | Triggers VSCode Quick Open (`Ctrl+P`) with pre-search |
| `:sp` / `:split` | Splits current editor down (`workbench.action.splitEditorDown`) |
| `:vsp` / `:vsplit`| Splits current editor right (`workbench.action.splitEditorRight`) |
| `:on` / `:only` | Merges / joins all editor groups (`workbench.action.joinAllGroups`) |
| `:tabnew` | Opens new editor tab (`workbench.action.files.newUntitledFile`) |
| `:tabnext` / `:tabprev` | Cycles next/prev editor in group |
| `:tabclose` | Closes active editor tab |
| `:tabonly` | Closes other editor tabs in group |
| `:noh` | Clears Neovim search highlighting |

> ⚠️ **Important Caveat**: In custom Neovim scripts or mappings, **do not call `:e` or `:sp` directly using Vimscript strings** (`vim.cmd("edit foo.txt")`). Instead, use the Lua API: `require('vscode').action('workbench.action.quickOpen')`.

---

## 5. What Does NOT Work in VSCode & The Solution

Because VSCode Neovim runs headlessly inside VSCode, **terminal-based TUI plugins cannot render their interactive windows inside VSCode**. Here is the replacement breakdown:

| Neovim Plugin / TUI Feature | Why It Doesn't Work | VSCode Native Equivalent |
| :--- | :--- | :--- |
| **Telescope / Fzf-lua** | Floating terminal windows cannot draw over VSCode editor canvas | Use VSCode Quick Open (`Ctrl+P`), Symbol Picker (`Ctrl+Shift+O` / `Ctrl+T`), Find in Files (`Ctrl+Shift+F`) |
| **Neo-tree / Nvim-tree** | Terminal buffer sidebars conflict with VSCode DOM | Use VSCode File Explorer (`Ctrl+Shift+E` / `Ctrl+B`). Supports Vim keys (`j`, `k`, `a`, `r`, `d`, `y`, `p`) when focused! |
| **Lspsaga Popups / Trouble.nvim**| Custom Neovim floating UI buffers | Use VSCode Native Hover (`K`), Definition Peek (`Alt+F12`), Problems View (`Ctrl+Shift+M`) |
| **ToggleTerm / Floaterm**| Embedded terminal inside Neovim split | Use VSCode Integrated Terminal (`Ctrl+\`` or `Ctrl+Shift+'`) |
| **LazyGit Float** | Interactive ncurses terminal inside Neovim | Use VSCode Source Control (`Ctrl+Shift+G`) or run `lazygit` in the VSCode integrated terminal |
| **Bufferline Tabs** | Neovim tabline UI rendered on top row | Handled by VSCode Editor Tabs (`Ctrl+PageUp` / `Ctrl+PageDown` or `gt` / `gT`) |
| **nvim-dap UI** | Terminal debug widgets | Use VSCode Native Debugger (`Ctrl+Shift+D`, `F5`, `F9`, `F10`, `F11`) |
| **Lualine / Heirline Statusbar**| Neovim statusline rendered at bottom | Handled by VSCode Native Status Bar (`Ctrl+S Ctrl+B` to toggle) |

---

## 6. Your Active System Config & Custom Keybindings

Here are the custom configurations currently active on your system:

### 1. Your Custom Composite Keys (`~/.config/Code/User/settings.json`)
```json
"vscode-neovim.compositeKeys": {
  "jj": {
    "command": "vscode-neovim.escape"
  },
  "jk": {
    "command": "vscode-neovim.lua",
    "args": [
      [
        "local code = require('vscode')",
        "code.action('vscode-neovim.escape')",
        "code.action('workbench.action.files.save')",
        "code.action('workbench.action.formatDocument')"
      ]
    ]
  },
  "gf": {
    "command": "editor.action.goToDefinition",
    "when": "editorTextFocus"
  }
}
```
* **`jj`**: Instant exit from Insert Mode to Normal Mode.
* **`jk`**: Exit Insert Mode + Save File (`Ctrl+S`) + Auto-format with Prettier in one keystroke!
* **`gf`**: Jump directly to Definition (LSP).

### 2. Your VSCode Custom Shortcuts (`~/.config/Code/User/keybindings.json`)
* **`Ctrl+Enter`**: Insert new line below current line (`editor.action.insertLineAfter`).
* **`Alt+W`**: Close active editor window (`workbench.action.closeActiveEditor`).
* **`Ctrl+D`**: Add next selection match (multi-cursor).
* **`Ctrl+K Ctrl+D`**: Skip current match and select next match.
* **`Ctrl+Backspace`**: Move selection to previous match.
* **`Ctrl+B`**: Toggle sidebar visibility.
* **`Ctrl+S Ctrl+B`**: Toggle status bar visibility.
* **`Ctrl+Shift+'`**: Create new terminal in editor tab.
* **`Ctrl+/` (in Terminal)**: Split terminal pane.
* **`Ctrl+L` / `Ctrl+H` (in Terminal)**: Focus Next / Previous terminal pane.
* **`Ctrl+W` (in Terminal)**: Kill terminal pane / editor.

### 3. Your LazyVim VSCode Integration (`~/.config/nvim/lua/lazyvim/plugins/extras/vscode.lua`)
Because you have `"lazyvim.plugins.extras.vscode"` active, LazyVim sets these shortcuts automatically in VSCode:
* **`<leader><space>`**: Opens VSCode Quick Open file search.
* **`<leader>/`**: Opens VSCode Find in Files (`workbench.action.findInFiles`).
* **`<leader>ss`**: Opens Document Symbol search (`workbench.action.gotoSymbol`).
* **`<leader>ft` or `<C-/>`**: Toggles VSCode integrated terminal.
* **`<S-h>`**: Cycles to previous VSCode tab.
* **`<S-l>`**: Cycles to next VSCode tab.

---

## 7. How to Create Custom Mappings (Lua & VSCode JSON)

### Method A: Map in Neovim (`~/.config/nvim/lua/config/keymaps.lua`)
Use `vim.g.vscode` to check if running inside VSCode, and call VSCode commands via Lua:

```lua
if vim.g.vscode then
  local vscode = require("vscode")

  -- Map <leader>ff to VSCode File Search
  vim.keymap.set("n", "<leader>ff", function()
    vscode.action("workbench.action.quickOpen")
  end, { desc = "Find Files in VSCode" })

  -- Map <leader>fg to VSCode Project Grep
  vim.keymap.set("n", "<leader>fg", function()
    vscode.action("workbench.action.findInFiles")
  end, { desc = "Live Grep in VSCode" })

  -- Map <leader>ca to VSCode Quick Fix
  vim.keymap.set("n", "<leader>ca", function()
    vscode.action("editor.action.quickFix")
  end, { desc = "Code Actions" })

  -- Map <leader>cr to Rename Symbol
  vim.keymap.set("n", "<leader>cr", function()
    vscode.action("editor.action.rename")
  end, { desc = "Rename Symbol" })

  -- Map <leader>xx to Problems View
  vim.keymap.set("n", "<leader>xx", function()
    vscode.action("workbench.actions.view.problems")
  end, { desc = "Show Diagnostics" })
end
```

### Method B: Map in VSCode (`~/.config/Code/User/keybindings.json`)
You can define bindings conditioned on Neovim's mode (`normal`, `insert`, `visual`):

```jsonc
[
  // In Normal mode, make Space-f-f trigger Quick Open
  {
    "key": "space f f",
    "command": "workbench.action.quickOpen",
    "when": "editorTextFocus && neovim.mode == 'normal'"
  },
  // In Normal mode, make Space-/ trigger Project Grep
  {
    "key": "space /",
    "command": "workbench.action.findInFiles",
    "when": "editorTextFocus && neovim.mode == 'normal'"
  }
]
```

---

## 8. Neovim Plugins in VSCode: Compatibility & Configuration

### The Golden Rule of Plugin Compatibility

Because VSCode Neovim runs a headless Neovim instance:

* ✅ **Pico / Buffer / Text Plugins WORK GREAT**: Any plugin whose job is to calculate text positions, modify buffer characters, manage register history, jump to coordinates, or manipulate text objects operates entirely inside the embedded Neovim engine.
* ❌ **UI / Popups / Floating Windows BREAK**: Any plugin that tries to render terminal windows, custom status lines, ncurses file trees, floating hover menus, or virtual notification toasts cannot render properly over VSCode’s DOM canvas.
* ⚠️ **LSP & Completion Plugins MUST BE DISABLED**: Running `nvim-cmp`, `nvim-lspconfig`, or `mason.nvim` inside Neovim while VSCode runs its own language servers creates duplicate CPU load, out-of-sync edits, and severe cursor lag.

---

### Comprehensive Plugin Compatibility Matrix

| Category | Plugin Name | Works in VSCode? | Behavior & Notes |
| :--- | :--- | :---: | :--- |
| **Motions & Navigation** | `flash.nvim` | ⚠️ Partial / Yes | Jump labels work on visible buffer lines; configure with care. |
| | `leap.nvim` / `flit.nvim` | ✅ **Yes** | Fully supported in LazyVim VSCode extra! |
| | `vim-sneak` / `hop.nvim` | ✅ **Yes** | Operates on buffer coordinates. |
| **Text Objects** | `mini.ai` | ✅ **Yes** | Enhanced text objects (`a(`, `i"`, custom tags) work natively. |
| | `nvim-treesitter-textobjects` | ✅ **Yes** | Functions (`af`/`if`), classes (`ac`/`ic`), parameters (`aa`/`ia`). |
| | `targets.vim` | ✅ **Yes** | Vimscript text objects work 100%. |
| **Surround & Delimiters**| `mini.surround` | ✅ **Yes** | Surround adding/deleting (`sa`, `sd`, `sr`) works smoothly. |
| | `nvim-surround` / `vim-surround`| ✅ **Yes** | `ys{motion}`, `ds{char}`, `cs{old}{new}` work flawlessly. |
| | `mini.pairs` / `autopairs` | ✅ **Yes** | Auto-insert closing pairs (or delegate to VSCode auto-closing). |
| **Text Manipulation** | `dial.nvim` | ✅ **Yes** | Enhanced increment/decrement (`<C-a>` / `<C-x>`) for booleans, dates. |
| | `mini.move` | ✅ **Yes** | Move lines and visual selections with `<Alt+h/j/k/l>`. |
| | `yanky.nvim` | ✅ **Yes** | Yank history ring and cycle paste (`[p`, `]p`). |
| | `vim-repeat` | ✅ **Yes** | Enables dot-repeat (`.`) across plugin actions! |
| | `mini.comment` / `ts-comments`| ✅ **Yes** | Comments handled seamlessly (`gcc`, `gc`). |
| **Fuzzy Finders** | `telescope.nvim` | ❌ **No** | Floating terminal cannot render; use VSCode `Ctrl+P`. |
| | `fzf-lua` / `snacks.picker`| ❌ **No** | Use VSCode Quick Open and Find in Files (`Ctrl+Shift+F`). |
| **File Explorers** | `neo-tree.nvim` / `nvim-tree`| ❌ **No** | Terminal tree buffer; use VSCode File Explorer (`Ctrl+Shift+E`). |
| | `oil.nvim` | ❌ **No** | Use VSCode native explorer or terminal. |
| **Autocompletion** | `nvim-cmp` / `blink.cmp` | ❌ **No (Disable)**| Conflicts with VSCode IntelliSense. Must be disabled. |
| | `LuaSnip` | ⚠️ **Redundant** | VSCode handles snippets and Tab expansion natively. |
| **LSP & Diagnostics** | `nvim-lspconfig` / `mason` | ❌ **No (Disable)**| Running dual LSP crashes performance. VSCode provides LSP. |
| | `lspsaga.nvim` / `trouble.nvim` | ❌ **No** | Replaced by VSCode hover (`K`), peek (`gD`), and problems (`Ctrl+Shift+M`). |
| **UI, Status & Tabs** | `lualine.nvim` / `heirline`| ❌ **No** | Redundant; VSCode status bar handles this. |
| | `bufferline.nvim` | ❌ **No** | Redundant; VSCode editor tabs handle this. |
| | `noice.nvim` / `nvim-notify`| ❌ **No** | Floating UI popups cause graphical glitches. |
| | `which-key.nvim` | ❌ **No** | Floating popup doesn't display cleanly in VSCode. |
| **Syntax & Decorators** | `treesitter` (highlighting) | ❌ **Disable Highlighting** | VSCode TextMate/Semantic tokens highlight code. Dual highlighting causes lag. |
| | `indent-blankline.nvim` | ❌ **Disable** | VSCode has built-in indent guides; causes cursor jitter. |
| | `tokyonight` / Themes | ❌ **No Effect** | Neovim colorschemes do not style the VSCode editor. |

---

### How Your LazyVim Setup Automatically Handles Plugins

In your system's configuration (`lazyvim.json`), you have `"lazyvim.plugins.extras.vscode"` enabled.

LazyVim automatically configures an **allowlist** in `lua/lazyvim/plugins/extras/vscode.lua`. When Neovim detects it is running inside VSCode (`vim.g.vscode == true`), it:

1. **Loads ONLY vetted, compatible plugins**:
   * `dial.nvim`, `flit.nvim`, `leap.nvim`, `mini.ai`, `mini.comment`, `mini.move`, `mini.pairs`, `mini.surround`, `nvim-treesitter` (parser only), `nvim-treesitter-textobjects`, `ts-comments.nvim`, `vim-repeat`, `yanky.nvim`.
2. **Disables heavy UI modules in snacks.nvim**:
   * Disables `dashboard`, `indent`, `input`, `notifier`, `picker`, `scroll`, and `statuscolumn`.
3. **Disables Neovim syntax highlighting and themes**:
   * Prevents dual highlighting conflicts and eliminates cursor jitter.

---

### How to Conditionally Load Plugins in Your Own Config

If you write custom plugin files in `~/.config/nvim/lua/plugins/`:

#### 1. Disable a Plugin in VSCode (Lazy.nvim `cond`)
```lua
-- lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  cond = not vim.g.vscode, -- Plugin will NOT load when running in VSCode
}
```

#### 2. Enable a Custom Plugin Specifically for VSCode
```lua
-- lua/plugins/my-motions.lua
return {
  "kylechui/nvim-surround",
  vscode = true, -- LazyVim will allow this plugin inside VSCode
  config = function()
    require("nvim-surround").setup()
  end,
}
```

#### 3. Conditional Code Inside a Plugin Config
```lua
return {
  "folke/flash.nvim",
  config = function()
    if vim.g.vscode then
      -- VSCode-specific settings or lighter configuration
      require("flash").setup({ search = { multi_window = false } })
    else
      -- Full Neovim CLI configuration
      require("flash").setup()
    end
  end,
}
```

---

## 💡 Quick Summary Cheatsheet

| If You Want To... | In Neovim (CLI) | In VSCode with Neovim Plugin |
| :--- | :--- | :--- |
| **Search Files** | `<leader>ff` or `<leader><space>` | `Ctrl+P` or `<leader><space>` |
| **Find Text in Project** | `<leader>fg` or `<leader>/` | `Ctrl+Shift+F` or `<leader>/` |
| **Jump to Definition** | `gd` | `gd` or `F12` or `gf` (in your setup) |
| **Peek Definition** | `gD` or `<leader>cd` | `gD` or `Alt+F12` |
| **Show Hover Documentation** | `K` or `gh` | `K` or `gh` or `Ctrl+K Ctrl+I` |
| **Code Actions & Fixes** | `<leader>ca` | `z=` or `Ctrl+.` / `Alt+Enter` |
| **Rename Symbol** | `<leader>cr` or `<F2>` | `F2` |
| **Comment Line / Block** | `gcc` / `gc` | `gcc` / `gc` or `Ctrl+/` |
| **Format Document** | `<leader>cf` | `Shift+Alt+F` or `gqq` or `==` or `jk` (in your setup) |
| **Next / Prev Error** | `]d` / `[d` | `]d` / `[d` or `F8` / `Shift+F8` |
| **Toggle File Explorer** | `<leader>e` | `Ctrl+B` or `Ctrl+Shift+E` |
| **Next / Prev Tab** | `<S-l>` / `<S-h>` | `<S-l>` / `<S-h>` or `gt` / `gT` or `Ctrl+PageDn/Up` |
| **Multi-Cursor Add Next** | `<C-n>` (vim-visual-multi) | `Ctrl+D` |
| **Toggle Terminal** | `<leader>ft` or `<C-/>` | `Ctrl+\`` or `Ctrl+Shift+'` or `<C-/>` |
| **Exit Insert Mode Fast** | `<Esc>` or `<C-[>` | `jj` or `jk` (save+format) or `<Esc>` |
