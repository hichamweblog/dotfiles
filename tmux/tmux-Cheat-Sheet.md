# Tmux Cheat Sheet

> **Prefix Key:** `Ctrl + a` (default changed from `Ctrl + b`)

---

## 📋 Table of Contents

- [Session Management](#session-management)
- [Window Management](#window-management)
- [Pane Management](#pane-management)
- [Copy Mode (Vi-style)](#copy-mode-vi-style)
- [Vim Integration](#vim-integration)
- [Miscellaneous](#miscellaneous)
- [Mouse Support](#mouse-support)
- [Plugin Management (TPM)](#plugin-management-tpm)

---

## 🖥️ Session Management

| Keybinding                    | Description                            |
| ----------------------------- | -------------------------------------- |
| `tmux`                        | Start a new tmux session               |
| `tmux new -s <name>`          | Create a new session with a name       |
| `tmux ls`                     | List all sessions                      |
| `tmux a` or `tmux attach`     | Attach to the last session             |
| `tmux a -t <name>`            | Attach to a specific session           |
| `tmux kill-session -t <name>` | Kill a specific session                |
| `Ctrl + a, d`                 | Detach from current session            |
| `Ctrl + a, s`                 | Choose session from tree view          |
| `Ctrl + a, $`                 | Rename current session (custom prompt) |
| `Ctrl + a, (`                 | Move to previous session               |
| `Ctrl + a, )`                 | Move to next session                   |

---

## 🪟 Window Management

| Keybinding      | Description                             |
| --------------- | --------------------------------------- |
| `Ctrl + a, c`   | Create new window (in current path)     |
| `Ctrl + a, w`   | Rename current window (custom prompt)   |
| `Ctrl + a, &`   | Kill current window (with confirmation) |
| `Ctrl + a, n`   | Next window                             |
| `Ctrl + a, p`   | Previous window                         |
| `Ctrl + a, 0-9` | Switch to window by number              |
| `Ctrl + a, l`   | Switch to last active window            |
| `Ctrl + a, ,`   | Rename current window                   |
| `Ctrl + a, .`   | Move current window                     |
| `Ctrl + a, f`   | Find window by name                     |

**Note:** Windows start at index 1 (not 0) and auto-renumber when closed.

---

## 🔲 Pane Management

### Splitting Panes

| Keybinding     | Description                               |
| -------------- | ----------------------------------------- |
| `Ctrl + a, \|` | Split pane vertically (in current path)   |
| `Ctrl + a, -`  | Split pane horizontally (in current path) |

### Navigating Panes

| Keybinding    | Description                             |
| ------------- | --------------------------------------- |
| `Ctrl + h`    | Move to left pane (Vim-aware)           |
| `Ctrl + j`    | Move to pane below (Vim-aware)          |
| `Ctrl + k`    | Move to pane above (Vim-aware)          |
| `Ctrl + l`    | Move to right pane (Vim-aware)          |
| `Ctrl + \\`   | Toggle to last pane (Vim-aware)         |
| `Ctrl + a, o` | Cycle through panes                     |
| `Ctrl + a, q` | Show pane numbers (type number to jump) |

### Resizing Panes

| Keybinding                 | Description            |
| -------------------------- | ---------------------- |
| `Alt + Left`               | Resize pane left by 2  |
| `Alt + Right`              | Resize pane right by 2 |
| `Alt + Up`                 | Resize pane up by 1    |
| `Alt + Down`               | Resize pane down by 1  |
| `Ctrl + a, Ctrl + ←/→/↑/↓` | Resize pane in steps   |

### Pane Layouts & Management

| Keybinding        | Description                           |
| ----------------- | ------------------------------------- |
| `Ctrl + a, Space` | Toggle through preset layouts         |
| `Ctrl + a, {`     | Swap pane with previous               |
| `Ctrl + a, }`     | Swap pane with next                   |
| `Ctrl + a, x`     | Kill current pane (with confirmation) |
| `Ctrl + a, z`     | Toggle pane zoom (fullscreen)         |
| `Ctrl + a, !`     | Convert pane to window                |

---

## 📝 Copy Mode (Vi-style)

| Keybinding    | Description               |
| ------------- | ------------------------- |
| `Ctrl + a, [` | Enter copy mode           |
| `q`           | Exit copy mode            |
| `v`           | Start visual selection    |
| `y`           | Copy selection and exit   |
| `Ctrl + a, ]` | Paste buffer              |
| `h/j/k/l`     | Navigate (Vim motions)    |
| `/`           | Search forward            |
| `?`           | Search backward           |
| `n`           | Next search result        |
| `N`           | Previous search result    |
| `Space`       | Start selection (default) |
| `Enter`       | Copy selection (default)  |

**Scrollback:** 10,000 lines

---

## 🔄 Vim Integration

This config uses `christoomey/vim-tmux-navigator` plugin for seamless navigation between Vim splits and tmux panes.

| Keybinding  | Description                                |
| ----------- | ------------------------------------------ |
| `Ctrl + h`  | Navigate left (works in Vim & tmux)        |
| `Ctrl + j`  | Navigate down (works in Vim & tmux)        |
| `Ctrl + k`  | Navigate up (works in Vim & tmux)          |
| `Ctrl + l`  | Navigate right (works in Vim & tmux)       |
| `Ctrl + \\` | Navigate to previous (works in Vim & tmux) |

**Requirements:** Install matching Vim plugin for full integration.

---

## 🛠️ Miscellaneous

| Keybinding    | Description                                |
| ------------- | ------------------------------------------ |
| `Ctrl + a, r` | Reload tmux config (shows ✅ confirmation) |
| `Ctrl + a, ?` | List all keybindings                       |
| `Ctrl + a, t` | Show clock                                 |
| `Ctrl + a, :` | Enter command mode                         |

### Useful Commands

```bash
# Reload config from terminal
tmux source-file ~/.tmux.conf

# List all tmux commands
tmux list-commands

# Show all sessions, windows, panes
tmux info
```

---

## 🖱️ Mouse Support

**Mouse is ENABLED** in this configuration:

- **Click** to select pane
- **Drag** pane borders to resize
- **Scroll** to view history
- **Click** window name in status bar to switch
- **Right-click** for context menu (terminal-dependent)
- **Double-click** to select word in copy mode
- **Triple-click** to select line in copy mode

---

## 🔌 Plugin Management (TPM)

### Installed Plugins

1. **tpm** - Tmux Plugin Manager
2. **tmux-sensible** - Sensible defaults
3. **vim-tmux-navigator** - Seamless Vim/tmux navigation
4. **catppuccin/tmux** - Mocha theme

### Plugin Commands

| Keybinding          | Description                   |
| ------------------- | ----------------------------- |
| `Ctrl + a, I`       | Install plugins (capital I)   |
| `Ctrl + a, U`       | Update plugins (capital U)    |
| `Ctrl + a, Alt + u` | Uninstall plugins not in list |

### Installing TPM

```bash
# Clone TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Inside tmux, press: Ctrl + a, I (capital I)
```

---

## 🎨 Theme & Appearance

- **Theme:** Catppuccin Mocha
- **Colors:** 256-color + RGB support
- **Window Style:** Rounded
- **Status Bar:** Shows session name, windows, time, and date
- **Active Window:** Highlighted in blue
- **Pane Borders:** Blue for active, dim for inactive

### Status Bar Layout

```
 SESSION_NAME   1:window1  2:window2  3:window3*       HH:MM | DD Mon
```

---

## ⚙️ Configuration Highlights

- **Prefix:** `Ctrl + a` (easier to reach)
- **Base Index:** Windows and panes start at 1
- **Auto Renumber:** Windows renumber when one is closed
- **Mode Keys:** Vi-style keybindings
- **History:** 10,000 lines of scrollback
- **Terminal:** `tmux-256color` with RGB support
- **Automatic Rename:** Disabled (manual control)

---

## 🚀 Quick Start Guide

### Basic Workflow

1. **Start tmux:**

   ```bash
   tmux new -s myproject
   ```

2. **Create windows for different tasks:**

   - `Ctrl + a, c` (editor)
   - `Ctrl + a, c` (terminal)
   - `Ctrl + a, c` (server)

3. **Split panes as needed:**

   - `Ctrl + a, |` (vertical split)
   - `Ctrl + a, -` (horizontal split)

4. **Navigate with:**

   - `Ctrl + h/j/k/l` (Vim-style)
   - Mouse clicks

5. **Detach when done:**

   - `Ctrl + a, d`

6. **Reattach later:**
   ```bash
   tmux a -t myproject
   ```

---

## 💡 Pro Tips

1. **Keep config in sync:** This file is in your dotfiles repo
2. **Custom layouts:** Save with `Ctrl + a, :save-buffer`
3. **Session switching:** Use `Ctrl + a, s` for quick tree view
4. **Zoom panes:** `Ctrl + a, z` toggles fullscreen for focused work
5. **Copy to system clipboard:** May need additional config for Wayland/X11
6. **Rename meaningfully:** Use `Ctrl + a, w` for windows, `Ctrl + a, $` for sessions
7. **Kill stuck panes:** `Ctrl + a, x` with confirmation
8. **Clock overlay:** `Ctrl + a, t` for quick time check

---

## 📚 Additional Resources

- [Tmux Manual](https://man7.org/linux/man-pages/man1/tmux.1.html)
- [TPM GitHub](https://github.com/tmux-plugins/tpm)
- [Catppuccin Theme](https://github.com/catppuccin/tmux)
- [Vim-Tmux Navigator](https://github.com/christoomey/vim-tmux-navigator)

---

**Last Updated:** November 2025
**Config Location:** `~/.tmux.conf`
**Plugin Directory:** `~/.tmux/plugins/`
