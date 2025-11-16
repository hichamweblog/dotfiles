# LazyVim Full-Stack DevOps Cheatsheet

## 🚀 Quick Start

- Leader key: `<Space>`
- Check health: `:checkhealth`
- Update plugins: `:Lazy sync`
- Update Mason tools: `:Mason`

## 📁 File Navigation

- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - Find buffers
- `<leader>fr` - Recent files
- `<leader>e` - Toggle file explorer
- `<C-h/j/k/l>` - Navigate windows

### Harpoon (Quick File Marks)

- `<leader>ha` - Add file to harpoon
- `<leader>hh` - Toggle harpoon menu
- `<leader>h1-4` - Jump to marked file 1-4

## ✏️ Editing

- `gcc` - Toggle comment line
- `gc` (visual) - Toggle comment selection
- `<leader>cf` - Format file
- `<C-s>` - Save file
- `<leader>bd` - Delete buffer

### Auto-pairs

- Type `(` → auto-closes to `()`
- Type `"` → auto-closes to `""`
- Auto-close HTML/JSX tags

### Surround (nvim-surround)

- `ys{motion}{char}` - Add surround (e.g., `ysiw"` surrounds word with quotes)
- `ds{char}` - Delete surround (e.g., `ds"` removes quotes)
- `cs{old}{new}` - Change surround (e.g., `cs"'` changes " to ')

## 🔍 Search & Replace

- `/` - Search forward
- `?` - Search backward
- `n/N` - Next/previous match
- `<leader>nh` - Clear highlights
- `<leader>sr` - Global search & replace (Spectre)
- `<leader>sw` - Replace word under cursor
- `<leader>sf` - Replace in current file

### Flash (Fast Navigation)

- `s` - Jump to any visible text
- `S` - Jump using treesitter

## 🐛 LSP & Diagnostics

- `gd` - Go to definition
- `gr` - Go to references
- `gi` - Go to implementation
- `K` - Hover documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `]d` - Next diagnostic
- `[d` - Previous diagnostic
- `<leader>xx` - Open diagnostics (Trouble)
- `<leader>do` - Show diagnostic float

## 🔧 Formatting & Linting

- Auto-formats on save
- `<leader>cf` - Manual format
- `:ConformInfo` - Check formatter status
- `:LspInfo` - Check LSP status

## 📦 Git Integration

### LazyGit

- `<leader>gg` - Open LazyGit
- `<leader>gf` - LazyGit current file
- `<leader>gc` - View commits

### Gitsigns

- `]h` / `[h` - Next/prev hunk
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line
- `<leader>gb` - Toggle inline blame
- `<leader>hd` - Diff this file

### DiffView

- `<leader>gd` - Open diff view
- `<leader>gh` - File history
- `<leader>gH` - Repo history

### Git Conflicts

- `co` - Choose ours
- `ct` - Choose theirs
- `cb` - Choose both
- `]x` / `[x` - Navigate conflicts

## 🗄️ Database (vim-dadbod-ui)

- `<leader>db` - Toggle database UI
- Navigate and query databases directly in Neovim

## 🌐 HTTP/REST API Testing (kulala)

Create `.http` files with requests:

```http
### Test API
GET https://api.example.com/users
Content-Type: application/json

{
  "name": "test"
}
```

- `<leader>rs` - Send request
- `<leader>rt` - Toggle response view
- `<leader>rn` - Next request
- `<leader>rp` - Previous request

## 💻 Terminal

- `<C-\>` - Toggle terminal
- `<leader>tf` - Float terminal
- `<leader>th` - Horizontal terminal
- `<leader>tv` - Vertical terminal

## 🎯 Session Management

- `<leader>qs` - Restore session
- `<leader>ql` - Restore last session
- `<leader>qd` - Don't save current session

## 📋 Folding

- `za` - Toggle fold under cursor
- `zR` - Open all folds
- `zM` - Close all folds
- `zo` - Open fold
- `zc` - Close fold

## 🎨 UI & Focus

- `<leader>z` - Zen mode (distraction-free)
- `<leader>ut` - Toggle twilight (dim inactive code)
- `<leader>sn` - Show notification history
- `<leader>sd` - Dismiss all notifications

## 🔍 TODO Comments

- `<leader>ft` - Find todos
- Highlights: TODO, FIXME, HACK, WARN, PERF, NOTE

## 📊 Performance

- `:Lazy profile` - View plugin load times
- `:checkhealth lazy` - Check lazy.nvim health
- `:LspInfo` - Check LSP status
- `:Mason` - Check installed tools

## 🎨 Languages Configured

- JavaScript/TypeScript (vtsls)
- React/Next.js/Astro
- Python (pyright)
- HTML/CSS/SCSS
- TailwindCSS
- JSON/YAML (with schemas)
- SQL
- Docker
- Bash/Shell
- Prisma
- Markdown
- Lua

## 🛠️ Formatters Installed

- Prettier (JS/TS/CSS/HTML/JSON)
- Black (Python)
- stylua (Lua)
- shfmt (Shell)
- sql-formatter (SQL)

## 🔍 Linters Installed

- eslint_d (JS/TS)
- pylint (Python)
- markdownlint (Markdown)
- hadolint (Docker)
- shellcheck (Shell)
- sqlfluff (SQL)

## 🚨 Troubleshooting

1. **Slow startup?**
   - Run `:Lazy profile` to find slow plugins
   - Check `:checkhealth`

2. **LSP not working?**
   - Run `:LspInfo`
   - Check `:Mason` for installed servers

3. **Formatter not working?**
   - Run `:ConformInfo`
   - Check if `.eslintrc` exists for ESLint

4. **Plugin not loading?**
   - Run `:Lazy` and press `X` to clear failed
   - Press `S` to sync

5. **Python slow?**
   - Already configured in options.lua
   - Check `which python3`

## 📚 Learn More

- LazyVim docs: https://www.lazyvim.org
- Press `<leader>` and wait to see available commands
- Press `?` in `:Lazy` for help
- Use `:help <topic>` for Neovim help
