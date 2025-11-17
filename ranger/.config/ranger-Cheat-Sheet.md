# Ranger Cheat Sheet

> **Ranger** is a Vim-inspired file manager for the console with VI key bindings.

---

## 📋 Table of Contents

- [Starting Ranger](#starting-ranger)
- [Basic Movement](#basic-movement)
- [File Operations](#file-operations)
- [Copy, Cut, and Paste](#copy-cut-and-paste)
- [Selection & Marking](#selection--marking)
- [Searching & Finding](#searching--finding)
- [Tabs Management](#tabs-management)
- [Sorting](#sorting)
- [Quick Navigation (Go Commands)](#quick-navigation-go-commands)
- [Settings Toggle](#settings-toggle)
- [Filter Stack](#filter-stack)
- [Bookmarks](#bookmarks)
- [Console Commands](#console-commands)
- [Pager Mode](#pager-mode)
- [Task View](#task-view)
- [Line Modes](#line-modes)
- [External Programs](#external-programs)
- [Custom Keybindings](#custom-keybindings)

---

## 🚀 Starting Ranger

```bash
ranger                    # Start ranger in current directory
ranger /path/to/dir      # Start in specific directory
ranger --choosedir=/tmp/lastdir  # Save last directory on exit
```

---

## 🎯 Basic Movement

### Vim-style Navigation

| Keybinding               | Description                          |
| ------------------------ | ------------------------------------ |
| `h` / `←`                | Go to parent directory (left column) |
| `j` / `↓`                | Move down one file                   |
| `k` / `↑`                | Move up one file                     |
| `l` / `→` / `Enter`      | Open file or enter directory (right) |
| `gg` / `Home`            | Jump to top of list                  |
| `G` / `End`              | Jump to bottom of list               |
| `J` / `Ctrl + D`         | Move down half page                  |
| `K` / `Ctrl + U`         | Move up half page                    |
| `Ctrl + F` / `Page Down` | Move down full page                  |
| `Ctrl + B` / `Page Up`   | Move up full page                    |

### Advanced Navigation

| Keybinding | Description                       |
| ---------- | --------------------------------- |
| `H`        | Go back in history                |
| `L`        | Go forward in history             |
| `]`        | Move to next parent directory     |
| `[`        | Move to previous parent directory |
| `}`        | Traverse forward (depth-first)    |
| `{`        | Traverse backward                 |
| `)`        | Jump to next non-empty directory  |

---

## 📁 File Operations

### Creating & Renaming

| Keybinding   | Description                        |
| ------------ | ---------------------------------- |
| `Insert`     | Create new file (prompts for name) |
| `F7` / `mkd` | Create new directory               |
| `cw`         | Rename file (clear name)           |
| `a`          | Rename (append mode)               |
| `A`          | Rename (full path edit mode)       |
| `I`          | Rename (cursor at beginning)       |
| `F2`         | Rename (append mode)               |

### Deleting

| Keybinding | Description                               |
| ---------- | ----------------------------------------- |
| `dD`       | Delete file(s) - prompts for confirmation |
| `dT`       | Move to trash (safer)                     |
| `DD`       | **Custom:** Move to trash using trash-put |
| `F8`       | Delete file(s)                            |

### Other Operations

| Keybinding | Description                              |
| ---------- | ---------------------------------------- |
| `=`        | Change permissions (chmod)               |
| `du`       | Show disk usage (current directory)      |
| `dU`       | Show disk usage sorted by size           |
| `dc`       | Calculate cumulative size of directories |

---

## 📋 Copy, Cut, and Paste

### Cut (Move)

| Keybinding | Description                |
| ---------- | -------------------------- |
| `dd`       | Cut selected file(s)       |
| `ud`       | Uncut (cancel cut)         |
| `da`       | Add to cut list            |
| `dr`       | Remove from cut list       |
| `dt`       | Toggle in cut list         |
| `dgg`      | Cut from current to top    |
| `dG`       | Cut from current to bottom |
| `dj`       | Cut current and one below  |
| `dk`       | Cut current and one above  |

### Copy (Yank)

| Keybinding | Description                      |
| ---------- | -------------------------------- |
| `yy`       | Copy selected file(s)            |
| `uy`       | Uncut/uncopy                     |
| `ya`       | Add to copy list                 |
| `yr`       | Remove from copy list            |
| `yt`       | Toggle in copy list              |
| `ygg`      | Copy from current to top         |
| `yG`       | Copy from current to bottom      |
| `yj`       | Copy current and one below       |
| `yk`       | Copy current and one above       |
| `yp`       | Copy path to clipboard           |
| `yd`       | Copy directory path to clipboard |
| `yn`       | Copy filename to clipboard       |
| `y.`       | Copy filename without extension  |

### Paste

| Keybinding | Description                           |
| ---------- | ------------------------------------- |
| `pp`       | Paste files                           |
| `po`       | Paste and overwrite existing files    |
| `pP`       | Paste and append to files             |
| `pO`       | Paste, overwrite, and append          |
| `pl`       | Create symlinks (absolute)            |
| `pL`       | Create symlinks (relative)            |
| `phl`      | Create hard links                     |
| `pht`      | Create hard linked subtree            |
| `pd`       | Paste to custom destination (prompts) |

---

## ✅ Selection & Marking

| Keybinding | Description                                 |
| ---------- | ------------------------------------------- |
| `Space`    | Toggle selection of current file            |
| `v`        | Toggle selection of all files               |
| `uv`       | Unselect all files                          |
| `V`        | Enter visual mode                           |
| `uV`       | Visual mode (reverse)                       |
| `t`        | Tag/toggle tag on file                      |
| `ut`       | Remove tag from file                        |
| `"<any>`   | Toggle tag with specific label (e.g., `"a`) |

---

## 🔍 Searching & Finding

### Basic Search

| Keybinding | Description                    |
| ---------- | ------------------------------ |
| `/`        | Search forward                 |
| `n`        | Jump to next search result     |
| `N`        | Jump to previous search result |
| `f`        | Find (prompts for filename)    |

### Advanced Search

| Keybinding | Description                         |
| ---------- | ----------------------------------- |
| `ct`       | Search next by tag                  |
| `cs`       | Search next by size                 |
| `ci`       | Search next by mimetype             |
| `cc`       | Search next by ctime (creation)     |
| `cm`       | Search next by mtime (modification) |
| `ca`       | Search next by atime (access)       |

### Console Aliases

```
:find <pattern>       # Find files (shows all matches)
:search <pattern>     # Search files (incremental)
:filter <pattern>     # Filter current view
:travel <pattern>     # Navigate to matching file
```

---

## 🗂️ Tabs Management

| Keybinding           | Description              |
| -------------------- | ------------------------ |
| `Ctrl + n` / `gn`    | Create new tab           |
| `Ctrl + w` / `gc`    | Close current tab        |
| `Tab` / `gt`         | Next tab                 |
| `Shift + Tab` / `gT` | Previous tab             |
| `Alt + →`            | Move to next tab         |
| `Alt + ←`            | Move to previous tab     |
| `Alt + 1-9`          | Jump to tab number (1-9) |
| `Alt + r`            | Shift tab right          |
| `Alt + l`            | Shift tab left           |
| `uq`                 | Restore closed tab       |

---

## 🔢 Sorting

### Sort By (Ascending)

| Keybinding | Description                 |
| ---------- | --------------------------- |
| `on`       | Sort by natural order       |
| `ob`       | Sort by basename (filename) |
| `os`       | Sort by size                |
| `om`       | Sort by modification time   |
| `oc`       | Sort by creation time       |
| `oa`       | Sort by access time         |
| `ot`       | Sort by type                |
| `oe`       | Sort by extension           |
| `oz`       | Sort randomly               |

### Sort By (Descending)

| Keybinding | Description                 |
| ---------- | --------------------------- |
| `oN`       | Sort by natural (reverse)   |
| `oB`       | Sort by basename (reverse)  |
| `oS`       | Sort by size (reverse)      |
| `oM`       | Sort by mtime (reverse)     |
| `oC`       | Sort by ctime (reverse)     |
| `oA`       | Sort by atime (reverse)     |
| `oT`       | Sort by type (reverse)      |
| `oE`       | Sort by extension (reverse) |
| `or`       | Toggle reverse sort         |

---

## 🗺️ Quick Navigation (Go Commands)

### System Directories

| Keybinding  | Description                         |
| ----------- | ----------------------------------- |
| `gh`        | Go to home (`~`)                    |
| `ge`        | Go to `/etc`                        |
| `gu`        | Go to `/usr`                        |
| `gd`        | Go to `/dev`                        |
| `go`        | Go to `/opt`                        |
| `gv`        | Go to `/var`                        |
| `gm`        | Go to `/media`                      |
| `gi`        | Go to `/run/media/$USER`            |
| `gM`        | Go to `/mnt`                        |
| `gs`        | Go to `/srv`                        |
| `gp`        | Go to `/tmp`                        |
| `gr` / `g/` | Go to root (`/`)                    |
| `gR`        | Go to ranger installation directory |
| `g?`        | Go to ranger documentation          |

### Custom Quick Bookmarks

| Keybinding | Description                     |
| ---------- | ------------------------------- |
| `gb`       | **Custom:** Go to `~/Downloads` |
| `gd`       | **Custom:** Go to `~/Documents` |
| `gc`       | **Custom:** Go to `~/.config`   |
| `gp`       | **Custom:** Go to `~/Pictures`  |

### Special Navigation

| Keybinding | Description                     |
| ---------- | ------------------------------- |
| `gl`       | Go to last directory            |
| `gL`       | Go to directory of current file |

---

## ⚙️ Settings Toggle

| Keybinding        | Description                        |
| ----------------- | ---------------------------------- |
| `zh` / `Ctrl + h` | Toggle hidden files                |
| `zp`              | Toggle file preview                |
| `zP`              | Toggle directory preview           |
| `zi`              | Toggle image preview               |
| `zv`              | Toggle use of preview script       |
| `zc`              | Toggle collapse preview            |
| `zd`              | Toggle directories first in sort   |
| `zs`              | Toggle case-insensitive sort       |
| `zm`              | Toggle mouse support               |
| `zu`              | Toggle auto-update cumulative size |
| `zf` / `zz`       | Apply filter to current directory  |
| `F`               | Toggle freeze files (stop updates) |
| `~`               | Toggle viewmode (miller/multipane) |

---

## 🔦 Filter Stack

Advanced filtering system for complex file selection:

| Keybinding | Description                      |
| ---------- | -------------------------------- |
| `.d`       | Filter: show only directories    |
| `.f`       | Filter: show only files          |
| `.l`       | Filter: show only links          |
| `.m`       | Filter by mimetype (prompts)     |
| `.n`       | Filter by name pattern (prompts) |
| `.#`       | Filter by hash                   |
| `."`       | Filter: show only duplicates     |
| `.'`       | Filter: show only unique files   |
| `.\|`      | Filter: OR operation             |
| `.&`       | Filter: AND operation            |
| `.!`       | Filter: NOT operation            |
| `.r`       | Rotate filter stack              |
| `.c`       | Clear all filters                |
| `.*`       | Decompose filter                 |
| `.p`       | Pop last filter                  |
| `..`       | Show current filter stack        |

---

## 🔖 Bookmarks

### Using Bookmarks

| Keybinding              | Description                             |
| ----------------------- | --------------------------------------- |
| `` `<key> `` / `'<key>` | Jump to bookmark (e.g., `` `a ``, `'b`) |
| `m<key>`                | Create bookmark (e.g., `ma`, `mb`)      |
| `um<key>`               | Delete bookmark (e.g., `uma`)           |
| `m<bg>`                 | Show all bookmarks                      |

**Tip:** Bookmarks are saved in `~/.config/ranger/bookmarks`

---

## 💻 Console Commands

### Entering Console

| Keybinding | Description                           |
| ---------- | ------------------------------------- |
| `:` / `;`  | Open command console                  |
| `!`        | Console with shell command            |
| `@`        | Console with shell for selected files |
| `#`        | Console with shell (-p flag)          |
| `s`        | Shell command (prompts)               |
| `S`        | Open shell in current directory       |
| `cd`       | Change directory (prompts)            |
| `Ctrl + p` | Previous command in history           |

### Common Aliases

```
:e <file>              # Edit file (alias for :edit)
:q                     # Quit ranger
:q!                    # Force quit
:qa / :qall            # Quit all tabs
:setl                  # Set local option (current dir only)
```

---

## 📄 Pager Mode

When viewing file contents (`i` or `F3`):

| Keybinding                  | Description           |
| --------------------------- | --------------------- |
| `j` / `↓` / `Ctrl + n`      | Scroll down one line  |
| `k` / `↑` / `Ctrl + p`      | Scroll up one line    |
| `h` / `←`                   | Scroll left           |
| `l` / `→`                   | Scroll right          |
| `d` / `Ctrl + d`            | Scroll down half page |
| `u` / `Ctrl + u`            | Scroll up half page   |
| `f` / `Space` / `Page Down` | Scroll down full page |
| `b` / `Page Up`             | Scroll up full page   |
| `g` / `Home`                | Jump to top           |
| `G` / `End`                 | Jump to bottom        |
| `E`                         | Edit current file     |
| `q` / `Esc` / `i`           | Close pager           |

---

## 📊 Task View

View and manage background tasks (`w` to open):

| Keybinding        | Description            |
| ----------------- | ---------------------- |
| `w`               | Open task view         |
| `j` / `↓`         | Move down in task list |
| `k` / `↑`         | Move up in task list   |
| `J` / `Page Down` | Lower task priority    |
| `K` / `Page Up`   | Raise task priority    |
| `dd` / `Delete`   | Remove task            |
| `q` / `Esc` / `w` | Close task view        |

---

## 📐 Line Modes

Change the information displayed in file listings:

| Keybinding | Description                          |
| ---------- | ------------------------------------ |
| `Mf`       | Filename only                        |
| `Mi`       | File info (permissions, owner, etc.) |
| `Mm`       | Modification time                    |
| `Mh`       | Human-readable modification time     |
| `Mp`       | Permissions                          |
| `Ms`       | Size + modification time             |
| `MH`       | Size + human-readable mtime          |
| `Mt`       | Meta title                           |

---

## 🔧 External Programs

| Keybinding | Description                               |
| ---------- | ----------------------------------------- |
| `E` / `F4` | Edit file in default editor               |
| `i` / `F3` | View/inspect file (pager)                 |
| `r`        | Open with... (shows available programs)   |
| `x`        | **Custom:** Open with rifle (default app) |
| `?`        | Show help                                 |
| `W`        | Display log                               |

---

## 🎨 Custom Keybindings

These are specific to your configuration:

| Keybinding | Description                                         |
| ---------- | --------------------------------------------------- |
| `DD`       | Move to trash using `trash-put` (safer than delete) |
| `x`        | Open with rifle (default application)               |
| `bg`       | Set as wallpaper using `feh`                        |
| `mkd`      | Create directory (prompts for name)                 |
| `ex`       | Extract archive                                     |
| `cz`       | Compress selection                                  |

### Custom Go Bookmarks

| Keybinding | Description    |
| ---------- | -------------- |
| `gb`       | `~/Downloads`  |
| `gd`       | `~/Documents`  |
| `gc`       | `~/.config`    |
| `gp`       | `~/Pictures`   |
| `gh`       | Home directory |

---

## 🎯 Quick Reference: Common Workflows

### Move Files to Another Directory

1. Select files: `Space` or `v`
2. Cut: `dd`
3. Navigate to destination: `h`, `j`, `k`, `l`
4. Paste: `pp`

### Copy Files

1. Select files: `Space` or `v`
2. Copy: `yy`
3. Navigate to destination
4. Paste: `pp`

### Rename Multiple Files

1. Select files: `Space` (multiple times)
2. Use `:bulkrename` command
3. Edit names in editor
4. Save and close

### Search and Open

1. Press `/` to search
2. Type pattern
3. Press `n` to cycle through matches
4. Press `l` or `Enter` to open

### Create Archive

1. Select files: `Space`
2. Press `cz`
3. Choose compression type

### Extract Archive

1. Navigate to archive file
2. Press `ex`
3. Files are extracted to current directory

---

## ⚙️ Configuration Settings

Your current configuration includes:

- **View Mode:** Miller columns (3-column layout)
- **Column Ratios:** `1:3:4`
- **Hidden Files:** Shown by default
- **Preview:** Enabled for files and images
- **Sort:** Natural order, directories first
- **Mouse:** Enabled
- **VCS Awareness:** Enabled for Git
- **Confirm on Delete:** Always
- **Line Mode:** Devicons2 (with icons)
- **Auto Count Files:** Enabled

---

## 🛠️ Chmod Quick Reference

Add permissions:

```
+ur / +r    # Add read permission (user)
+uw / +w    # Add write permission
+ux / +x    # Add execute permission
+gr         # Add read (group)
+or         # Add read (others)
+ar         # Add read (all)
```

Remove permissions (use `-` instead of `+`):

```
-ur / -r    # Remove read
-uw / -w    # Remove write
-ux / -x    # Remove execute
```

---

## 🔑 Function Keys

| Keybinding | Description      |
| ---------- | ---------------- |
| `F1`       | Help             |
| `F2`       | Rename (append)  |
| `F3`       | View file        |
| `F4`       | Edit file        |
| `F5`       | Copy             |
| `F6`       | Cut              |
| `F7`       | Create directory |
| `F8`       | Delete           |
| `F10`      | Exit ranger      |

---

## 💡 Pro Tips

1. **Use tabs for multiple workspaces** - Great for organizing different projects
2. **Bookmarks are your friend** - Set bookmarks (`m<key>`) for frequently accessed directories
3. **Visual mode** - Press `V` then use `j`/`k` to select multiple files quickly
4. **Filter stack** - Use `.d` and `.f` to quickly filter directories/files
5. **Trash instead of delete** - Use `DD` (custom binding) for safer deletions
6. **Console history** - Use `↑`/`↓` in console to recall previous commands
7. **Rifle integration** - Press `r` to see all available programs for a file
8. **Quick preview** - Use `i` to quickly view file contents without opening
9. **Bulk rename** - Select files and use `:bulkrename` for efficient renaming
10. **Shell integration** - Press `S` to drop into a shell in the current directory

---

## 📚 Additional Resources

- [Ranger GitHub](https://github.com/ranger/ranger)
- [Ranger Wiki](https://github.com/ranger/ranger/wiki)
- [Ranger Manual](https://ranger.github.io/)
- Configuration Files:
  - `~/.config/ranger/rc.conf` - Main configuration
  - `~/.config/ranger/rifle.conf` - File associations
  - `~/.config/ranger/scope.sh` - Preview script

---

## 🚦 Exiting Ranger

| Keybinding        | Description              |
| ----------------- | ------------------------ |
| `q` / `ZZ` / `ZQ` | Quit ranger (single tab) |
| `Q`               | Quit all tabs            |
| `:q`              | Quit (console command)   |
| `:q!`             | Force quit               |
| `:qa` / `:qall`   | Quit all tabs            |

---

**Last Updated:** November 2025
**Config Location:** `~/.config/ranger/rc.conf`
**Rifle Config:** `~/.config/ranger/rifle.conf`
**Preview Script:** `~/.config/ranger/scope.sh`
