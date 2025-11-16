# 🎯 Complete LazyVim Keybindings Reference

> **Leader Key:** `<Space>` (Space bar)  
> **Local Leader:** `\` (Backslash)  
> **Note:** `<C-x>` = Ctrl+x, `<S-x>` = Shift+x, `<A-x>` = Alt+x

---

## 📁 File Navigation & Management

### File Finding (Telescope/Snacks Picker)

| Key          | Action             | Description                       |
| ------------ | ------------------ | --------------------------------- |
| `<leader>ff` | Find Files         | Search files in current directory |
| `<leader>fr` | Recent Files       | Recently opened files             |
| `<leader>fb` | Find Buffers       | List open buffers                 |
| `<leader>fg` | Live Grep          | Search text in all files          |
| `<leader>fw` | Grep Word          | Search word under cursor          |
| `<leader>fW` | Grep Word (root)   | Search in project root            |
| `<leader>fc` | Find Config        | Search Neovim config files        |
| `<leader>fn` | New File           | Create new file                   |
| `<leader>fo` | Recent Files (cwd) | Recent in current directory       |
| `<leader>fR` | Recent (root)      | Recent in project root            |
| `<leader>f/` | Live Grep (root)   | Search in project root            |

### File Explorer (Snacks Explorer)

| Key                  | Action          | Description                  |
| -------------------- | --------------- | ---------------------------- |
| `<leader>e`          | Toggle Explorer | Open/close file tree         |
| `<leader>E`          | Explorer (cwd)  | File tree in current dir     |
| **Inside Explorer:** |                 |                              |
| `<CR>`               | Open            | Open file/folder             |
| `l`                  | Open            | Alternative to Enter         |
| `h`                  | Close Folder    | Close folder or go to parent |
| `a`                  | Create          | Create new file/folder       |
| `d`                  | Delete          | Delete file/folder           |
| `r`                  | Rename          | Rename file/folder           |
| `y`                  | Copy            | Copy file                    |
| `x`                  | Cut             | Cut file                     |
| `p`                  | Paste           | Paste file                   |
| `R`                  | Refresh         | Refresh file tree            |
| `H`                  | Toggle Hidden   | Show/hide hidden files       |
| `g?`                 | Help            | Show keybindings             |

### Harpoon (Quick File Marks)

| Key          | Action      | Description           |
| ------------ | ----------- | --------------------- |
| `<leader>ha` | Add File    | Mark current file     |
| `<leader>hh` | Toggle Menu | Show marked files     |
| `<leader>h1` | File 1      | Jump to marked file 1 |
| `<leader>h2` | File 2      | Jump to marked file 2 |
| `<leader>h3` | File 3      | Jump to marked file 3 |
| `<leader>h4` | File 4      | Jump to marked file 4 |

---

## 🪟 Window & Buffer Management

### Window Navigation

| Key          | Action   | Description              |
| ------------ | -------- | ------------------------ |
| `<C-h>`      | Go Left  | Move to left window      |
| `<C-j>`      | Go Down  | Move to bottom window    |
| `<C-k>`      | Go Up    | Move to top window       |
| `<C-l>`      | Go Right | Move to right window     |
| `<leader>wh` | Go Left  | Alternative window left  |
| `<leader>wj` | Go Down  | Alternative window down  |
| `<leader>wk` | Go Up    | Alternative window up    |
| `<leader>wl` | Go Right | Alternative window right |

### Window Splitting

| Key          | Action           | Description                |
| ------------ | ---------------- | -------------------------- |
| `<leader>wv` | Split Vertical   | Split window vertically    |
| `<leader>ws` | Split Horizontal | Split window horizontally  |
| `<leader>we` | Equal Size       | Make splits equal          |
| `<leader>wx` | Close Split      | Close current split        |
| `<leader>-`  | Split Below      | Split horizontal (LazyVim) |
| `<leader>\|` | Split Right      | Split vertical (LazyVim)   |
| `<leader>wd` | Delete Window    | Close window               |

### Window Resizing

| Key         | Action          | Description          |
| ----------- | --------------- | -------------------- |
| `<C-Up>`    | Increase Height | Make window taller   |
| `<C-Down>`  | Decrease Height | Make window shorter  |
| `<C-Left>`  | Decrease Width  | Make window narrower |
| `<C-Right>` | Increase Width  | Make window wider    |

### Buffer Management

| Key          | Action            | Description                |
| ------------ | ----------------- | -------------------------- |
| `<S-h>`      | Prev Buffer       | Previous buffer (Shift+h)  |
| `<S-l>`      | Next Buffer       | Next buffer (Shift+l)      |
| `[b`         | Prev Buffer       | Alternative previous       |
| `]b`         | Next Buffer       | Alternative next           |
| `<leader>bb` | Switch Buffer     | Switch to buffer           |
| `<leader>bd` | Delete Buffer     | Close buffer (keep window) |
| `<leader>bD` | Force Delete      | Force close buffer         |
| `<leader>bo` | Close Others      | Close other buffers        |
| `<leader>bp` | Pin Buffer        | Pin/unpin buffer           |
| `<leader>bP` | Delete Non-Pinned | Close unpinned buffers     |
| `<leader>br` | Delete Right      | Close buffers to right     |
| `<leader>bl` | Delete Left       | Close buffers to left      |
| `<leader>\`` | Switch to Other   | Switch to last buffer      |

---

## ✏️ Editing & Text Manipulation

### Basic Editing

| Key          | Action        | Description               |
| ------------ | ------------- | ------------------------- |
| `<C-s>`      | Save File     | Save (works in all modes) |
| `<leader>w`  | Save          | Alternative save          |
| `<leader>K`  | Keywordprg    | Lookup keyword            |
| `<leader>L`  | Lazy          | Open Lazy plugin manager  |
| `<leader>fn` | New File      | Create new file           |
| `<leader>xl` | Location List | Open location list        |
| `<leader>xq` | Quickfix List | Open quickfix list        |

### Commenting

| Key         | Action             | Description                        |
| ----------- | ------------------ | ---------------------------------- |
| `gcc`       | Toggle Line        | Comment/uncomment line             |
| `gc`        | Toggle (motion)    | Comment with motion (e.g., `gcap`) |
| `gc`        | Toggle (visual)    | Comment selection                  |
| `gbc`       | Block Comment Line | Block comment line                 |
| `gb`        | Block Comment      | Block comment (motion/visual)      |
| `<leader>/` | Toggle Comment     | Alternative comment toggle         |
| `gcO`       | Comment Above      | Add comment above                  |
| `gco`       | Comment Below      | Add comment below                  |
| `gcA`       | Comment EOL        | Add comment at end of line         |

### Surround (nvim-surround)

| Key                | Action                  | Description                     |
| ------------------ | ----------------------- | ------------------------------- |
| `ys{motion}{char}` | Add Surround            | Add surrounding (e.g., `ysiw"`) |
| `yss{char}`        | Surround Line           | Surround entire line            |
| `yS{motion}{char}` | Surround (newline)      | Add with newlines               |
| `ySS{char}`        | Surround Line (newline) | Line with newlines              |
| `ds{char}`         | Delete Surround         | Remove surrounding              |
| `cs{old}{new}`     | Change Surround         | Change surrounding              |
| `cS{old}{new}`     | Change (newline)        | Change with newlines            |
| **Visual Mode:**   |                         |                                 |
| `S{char}`          | Surround Selection      | Surround selected text          |

**Examples:**

- `ysiw"` - Surround word with quotes
- `ysiw)` - Surround word with parentheses
- `ds"` - Delete surrounding quotes
- `cs"'` - Change double to single quotes
- `dst` - Delete surrounding HTML tag

### Auto-pairs

| Key     | Action           | Description                 |
| ------- | ---------------- | --------------------------- |
| `(`     | Auto-close       | Automatically adds `)`      |
| `[`     | Auto-close       | Automatically adds `]`      |
| `{`     | Auto-close       | Automatically adds `}`      |
| `"`     | Auto-close       | Automatically adds `"`      |
| `'`     | Auto-close       | Automatically adds `'`      |
| `` ` `` | Auto-close       | Automatically adds `` ` ``  |
| `<CR>`  | Newline + Indent | Smart newline in pairs      |
| `<BS>`  | Delete Pair      | Delete both pair characters |

### Text Objects

| Key           | Action                  | Description                |
| ------------- | ----------------------- | -------------------------- |
| `viw`         | Select Inner Word       | Select word                |
| `vaw`         | Select Around Word      | Select word with space     |
| `vi"`         | Select Inner Quotes     | Inside quotes              |
| `va"`         | Select Around Quotes    | Quotes + content           |
| `vi(` / `vib` | Select Inner Parens     | Inside parentheses         |
| `va(` / `vab` | Select Around Parens    | Parens + content           |
| `vi{` / `viB` | Select Inner Braces     | Inside braces              |
| `va{` / `vaB` | Select Around Braces    | Braces + content           |
| `vit`         | Select Inner Tag        | Inside HTML tag            |
| `vat`         | Select Around Tag       | Tag + content              |
| `vip`         | Select Inner Paragraph  | Select paragraph           |
| `vap`         | Select Around Paragraph | Paragraph with blank lines |

### Copy/Paste/Delete

| Key         | Action          | Description                    |
| ----------- | --------------- | ------------------------------ |
| `yy`        | Yank Line       | Copy line                      |
| `Y`         | Yank to EOL     | Copy to end of line            |
| `dd`        | Delete Line     | Cut line                       |
| `D`         | Delete to EOL   | Cut to end of line             |
| `p`         | Paste After     | Paste after cursor             |
| `P`         | Paste Before    | Paste before cursor            |
| `<leader>p` | Paste (no yank) | Paste without yanking (visual) |
| `<C-a>`     | Select All      | Select entire file             |
| `x`         | Delete Char     | Delete character               |
| `s`         | Substitute Char | Delete char and insert         |

### Indentation

| Key    | Action           | Description                 |
| ------ | ---------------- | --------------------------- |
| `>>`   | Indent Right     | Indent line                 |
| `<<`   | Indent Left      | Dedent line                 |
| `>`    | Indent (motion)  | Indent with motion          |
| `<`    | Dedent (motion)  | Dedent with motion          |
| `>`    | Indent (visual)  | Indent selection            |
| `<`    | Dedent (visual)  | Dedent selection            |
| `=`    | Auto-indent      | Auto-indent (motion/visual) |
| `==`   | Auto-indent Line | Auto-indent current line    |
| `gg=G` | Indent File      | Auto-indent entire file     |

---

## 🔍 Search & Replace

### Search

| Key          | Action               | Description                       |
| ------------ | -------------------- | --------------------------------- |
| `/`          | Search Forward       | Search forward                    |
| `?`          | Search Backward      | Search backward                   |
| `n`          | Next Match           | Next search result (centered)     |
| `N`          | Prev Match           | Previous search result (centered) |
| `*`          | Search Word Forward  | Search current word forward       |
| `#`          | Search Word Backward | Search current word backward      |
| `<leader>nh` | Clear Highlights     | Clear search highlights           |
| `<Esc>`      | Clear Highlights     | Alternative clear (LazyVim)       |

### Find & Replace (Spectre)

| Key                 | Action            | Description               |
| ------------------- | ----------------- | ------------------------- |
| `<leader>sr`        | Replace (project) | Global search & replace   |
| `<leader>sw`        | Replace Word      | Replace word under cursor |
| `<leader>sf`        | Replace (file)    | Replace in current file   |
| **Inside Spectre:** |                   |                           |
| `<leader>rc`        | Replace (confirm) | Replace with confirmation |
| `<leader>R`         | Replace All       | Replace all matches       |
| `<leader>o`         | Show Options      | Toggle options            |
| `<leader>q`         | Send to Quickfix  | Send results to quickfix  |

### Flash (Fast Navigation)

| Key     | Action            | Description              |
| ------- | ----------------- | ------------------------ |
| `s`     | Flash Jump        | Jump to any visible text |
| `S`     | Flash Treesitter  | Jump using treesitter    |
| `r`     | Flash Remote      | Remote flash             |
| `R`     | Treesitter Search | Treesitter search        |
| `/`     | Search            | Flash enhanced search    |
| `<C-s>` | Toggle Flash      | Toggle in search         |

---

## 🐛 LSP (Language Server Protocol)

### Navigation

| Key     | Action                | Description                 |
| ------- | --------------------- | --------------------------- |
| `gd`    | Go to Definition      | Jump to definition          |
| `gD`    | Go to Declaration     | Jump to declaration         |
| `gr`    | Go to References      | Show references             |
| `gI`    | Go to Implementation  | Jump to implementation      |
| `gy`    | Go to Type Definition | Jump to type definition     |
| `grt`   | Type Definition       | Alternative type definition |
| `gri`   | Implementation        | Alternative implementation  |
| `grr`   | References            | Alternative references      |
| `K`     | Hover                 | Show documentation          |
| `gK`    | Signature Help        | Show signature              |
| `<C-k>` | Signature (insert)    | Signature in insert mode    |

### Code Actions

| Key          | Action           | Description             |
| ------------ | ---------------- | ----------------------- |
| `<leader>ca` | Code Action      | Show code actions       |
| `<leader>cA` | Source Action    | Source code actions     |
| `<leader>cc` | Run Codelens     | Run codelens            |
| `<leader>cC` | Refresh Codelens | Refresh codelens        |
| `<leader>cr` | Rename           | Rename symbol           |
| `<leader>rn` | Rename           | Alternative rename      |
| `grn`        | Rename           | Alternative rename      |
| `gra`        | Code Action      | Alternative code action |

### Formatting

| Key          | Action        | Description           |
| ------------ | ------------- | --------------------- |
| `<leader>cf` | Format        | Format file/selection |
| `<leader>uf` | Toggle Format | Toggle format on save |

### Diagnostics (Errors/Warnings)

| Key          | Action           | Description            |
| ------------ | ---------------- | ---------------------- |
| `]d`         | Next Diagnostic  | Next diagnostic        |
| `[d`         | Prev Diagnostic  | Previous diagnostic    |
| `]e`         | Next Error       | Next error             |
| `[e`         | Prev Error       | Previous error         |
| `]w`         | Next Warning     | Next warning           |
| `[w`         | Prev Warning     | Previous warning       |
| `<leader>do` | Show Diagnostic  | Show diagnostic float  |
| `<leader>dn` | Next Diagnostic  | Custom next diagnostic |
| `<leader>dp` | Prev Diagnostic  | Custom prev diagnostic |
| `<leader>dl` | List Diagnostics | List all diagnostics   |

### Trouble (Diagnostic UI)

| Key          | Action             | Description             |
| ------------ | ------------------ | ----------------------- |
| `<leader>xx` | Toggle Diagnostics | Open diagnostics list   |
| `<leader>xX` | Buffer Diagnostics | Buffer diagnostics only |
| `<leader>cs` | Symbols            | Document symbols        |
| `<leader>cS` | LSP Symbols        | LSP symbols             |
| `<leader>xL` | Location List      | Open location list      |
| `<leader>xQ` | Quickfix           | Open quickfix list      |
| `<leader>xq` | Quickfix           | Alternative quickfix    |

### Information

| Key            | Action         | Description           |
| -------------- | -------------- | --------------------- |
| `:LspInfo`     | LSP Info       | Show LSP client info  |
| `:Mason`       | Mason          | Open Mason installer  |
| `:ConformInfo` | Formatter Info | Show formatter status |

---

## 🎨 Git Integration

### LazyGit

| Key          | Action            | Description                  |
| ------------ | ----------------- | ---------------------------- |
| `<leader>gg` | LazyGit           | Open LazyGit TUI             |
| `<leader>gf` | LazyGit File      | LazyGit for current file     |
| `<leader>gc` | LazyGit Commits   | View commits                 |
| `<leader>gG` | LazyGit (cwd)     | LazyGit in current directory |
| `<leader>gl` | LazyGit Log       | Git log                      |
| `<leader>gL` | LazyGit Log (cwd) | Log in current directory     |

### Gitsigns (Hunk Operations)

| Key          | Action        | Description          |
| ------------ | ------------- | -------------------- |
| `]h`         | Next Hunk     | Next git change      |
| `[h`         | Prev Hunk     | Previous git change  |
| `]H`         | Last Hunk     | Jump to last hunk    |
| `[H`         | First Hunk    | Jump to first hunk   |
| `<leader>hs` | Stage Hunk    | Stage current hunk   |
| `<leader>hr` | Reset Hunk    | Reset current hunk   |
| `<leader>hS` | Stage Buffer  | Stage entire file    |
| `<leader>hR` | Reset Buffer  | Reset entire file    |
| `<leader>hu` | Undo Stage    | Undo stage hunk      |
| `<leader>hp` | Preview Hunk  | Preview hunk changes |
| `<leader>hb` | Blame Line    | Show full blame      |
| `<leader>hB` | Blame Line    | Toggle line blame    |
| `<leader>gb` | Toggle Blame  | Toggle inline blame  |
| `<leader>hd` | Diff This     | Diff current file    |
| `<leader>hD` | Diff This (~) | Diff against HEAD    |
| `ih`         | Select Hunk   | Text object for hunk |

### DiffView

| Key          | Action        | Description          |
| ------------ | ------------- | -------------------- |
| `<leader>gd` | DiffView Open | Open diff view       |
| `<leader>gh` | File History  | Current file history |
| `<leader>gH` | Repo History  | Full repo history    |

### Git Conflicts

| Key  | Action        | Description               |
| ---- | ------------- | ------------------------- |
| `co` | Choose Ours   | Accept current change     |
| `ct` | Choose Theirs | Accept incoming change    |
| `cb` | Choose Both   | Keep both changes         |
| `c0` | Choose None   | Delete both changes       |
| `]x` | Next Conflict | Jump to next conflict     |
| `[x` | Prev Conflict | Jump to previous conflict |

---

## 💻 Terminal

### Terminal Management

| Key                  | Action              | Description                   |
| -------------------- | ------------------- | ----------------------------- |
| `<C-\>`              | Toggle Terminal     | Toggle terminal               |
| `<leader>tf`         | Terminal Float      | Floating terminal             |
| `<leader>th`         | Terminal Horizontal | Horizontal split terminal     |
| `<leader>tv`         | Terminal Vertical   | Vertical split terminal       |
| `<leader>ft`         | Terminal (root)     | Terminal in project root      |
| `<leader>fT`         | Terminal (cwd)      | Terminal in current directory |
| `<C-/>`              | Toggle Terminal     | Alternative toggle            |
| **Inside Terminal:** |                     |                               |
| `<C-\><C-\>`         | Exit Terminal Mode  | Back to normal mode           |
| `<Esc><Esc>`         | Exit Terminal Mode  | Alternative exit              |
| `<C-h/j/k/l>`        | Navigate Windows    | Move between windows          |

---

## 🗄️ Database (Dadbod UI)

| Key              | Action         | Description                 |
| ---------------- | -------------- | --------------------------- |
| `<leader>db`     | Toggle DBUI    | Open database UI            |
| **Inside DBUI:** |                |                             |
| `<CR>`           | Execute/Open   | Execute query or open table |
| `S`              | Execute File   | Execute SQL file            |
| `R`              | Rename Buffer  | Rename query buffer         |
| `A`              | Add Connection | Add new connection          |
| `D`              | Delete Buffer  | Delete query buffer         |
| `H`              | Toggle Help    | Show/hide help              |
| `o`              | Toggle         | Toggle expand/collapse      |

**Connection String Examples:**

```
postgresql://user:password@localhost:5432/database
mysql://user:password@localhost:3306/database
mongodb://localhost:27017/database
```

---

## 🌐 HTTP/REST API (Kulala)

| Key          | Action          | Description                  |
| ------------ | --------------- | ---------------------------- |
| `<leader>rs` | Send Request    | Execute HTTP request         |
| `<leader>rt` | Toggle Response | Toggle response view         |
| `<leader>rn` | Next Request    | Jump to next request         |
| `<leader>rp` | Prev Request    | Jump to previous request     |
| `<leader>rc` | Copy as cURL    | Copy request as cURL command |
| `<leader>ri` | Inspect         | Inspect request details      |

**Example .http file:**

```http
### Get User
GET https://api.github.com/users/github
Content-Type: application/json

### Post Data
POST https://api.example.com/users
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com"
}
```

---

## 📋 Session Management

| Key          | Action          | Description                |
| ------------ | --------------- | -------------------------- |
| `<leader>qs` | Restore Session | Restore session for cwd    |
| `<leader>ql` | Restore Last    | Restore last session       |
| `<leader>qd` | Don't Save      | Don't save current session |
| `<leader>qq` | Quit All        | Quit all windows           |

---

## 🎯 Code Folding

| Key  | Action           | Description                  |
| ---- | ---------------- | ---------------------------- |
| `za` | Toggle Fold      | Toggle fold under cursor     |
| `zA` | Toggle All Folds | Toggle all folds recursively |
| `zc` | Close Fold       | Close fold                   |
| `zC` | Close All Folds  | Close all folds recursively  |
| `zo` | Open Fold        | Open fold                    |
| `zO` | Open All Folds   | Open all folds recursively   |
| `zR` | Open All         | Open all folds in buffer     |
| `zM` | Close All        | Close all folds in buffer    |
| `zj` | Next Fold        | Jump to next fold            |
| `zk` | Prev Fold        | Jump to previous fold        |
| `[z` | Fold Start       | Jump to fold start           |
| `]z` | Fold End         | Jump to fold end             |

---

## 🎨 UI & Focus

### Zen Mode & Twilight

| Key          | Action   | Description             |
| ------------ | -------- | ----------------------- |
| `<leader>z`  | Zen Mode | Distraction-free coding |
| `<leader>ut` | Twilight | Dim inactive code       |

### Notifications (Noice)

| Key           | Action          | Description               |
| ------------- | --------------- | ------------------------- |
| `<leader>sn`  | Noice History   | Show notification history |
| `<leader>sl`  | Last Message    | Show last message         |
| `<leader>sd`  | Dismiss All     | Dismiss all notifications |
| `<leader>sna` | Noice All       | All Noice messages        |
| `<leader>snd` | Dismiss All     | Dismiss notifications     |
| `<leader>snh` | Noice History   | Notification history      |
| `<leader>snl` | Last Message    | Last message              |
| `<leader>snt` | Noice Telescope | Search messages           |

### UI Toggles

| Key          | Action              | Description                  |
| ------------ | ------------------- | ---------------------------- |
| `<leader>ub` | Toggle Background   | Dark/light mode              |
| `<leader>uc` | Toggle Conceal      | Toggle conceal level         |
| `<leader>ud` | Toggle Diagnostics  | Toggle diagnostics           |
| `<leader>uf` | Toggle Format       | Toggle format on save        |
| `<leader>ug` | Toggle Git Signs    | Toggle git signs             |
| `<leader>uh` | Toggle Inlay Hints  | Toggle inlay hints           |
| `<leader>ui` | Inspect Pos         | Inspect position             |
| `<leader>uI` | Inspect Tree        | Inspect tree                 |
| `<leader>ul` | Toggle Line Numbers | Toggle line numbers          |
| `<leader>uL` | Toggle Relative     | Toggle relative numbers      |
| `<leader>us` | Toggle Spelling     | Toggle spell check           |
| `<leader>uw` | Toggle Wrap         | Toggle line wrap             |
| `<leader>uT` | Toggle Treesitter   | Toggle treesitter highlights |

---

## 📝 TODO Comments

| Key          | Action         | Description           |
| ------------ | -------------- | --------------------- |
| `<leader>ft` | Find TODOs     | Search TODO comments  |
| `<leader>st` | Find TODOs     | Alternative search    |
| `<leader>sT` | TODO/Fix/Fixme | Search specific types |
| `]t`         | Next TODO      | Next TODO comment     |
| `[t`         | Prev TODO      | Previous TODO comment |

**Highlighted Keywords:**

- `TODO:` - Something to do
- `HACK:` - Hacky solution
- `WARN:` - Warning
- `PERF:` - Performance issue
- `NOTE:` - Note/info
- `TEST:` - Testing needed
- `FIX:` / `FIXME:` - Bug to fix

---

## ⚙️ Quickfix & Location List

| Key          | Action         | Description            |
| ------------ | -------------- | ---------------------- |
| `<leader>qo` | Open Quickfix  | Open quickfix list     |
| `<leader>qc` | Close Quickfix | Close quickfix list    |
| `<leader>qn` | Next Item      | Next quickfix item     |
| `<leader>qp` | Prev Item      | Previous quickfix item |
| `]q`         | Next Quickfix  | Next quickfix          |
| `[q`         | Prev Quickfix  | Previous quickfix      |
| `]l`         | Next Location  | Next location          |
| `[l`         | Prev Location  | Previous location      |

---

## 🔄 Marks & Jumps

### Marks

| Key          | Action           | Description            |
| ------------ | ---------------- | ---------------------- |
| `m{a-z}`     | Set Mark         | Set local mark         |
| `m{A-Z}`     | Set Global Mark  | Set global mark        |
| `'{a-z}`     | Jump to Mark     | Jump to mark (line)    |
| `'{A-Z}`     | Jump Global Mark | Jump to global mark    |
| `` `{a-z} `` | Jump to Mark     | Jump to exact position |
| `<leader>sm` | Marks            | Search marks           |

### Jump List

| Key     | Action       | Description            |
| ------- | ------------ | ---------------------- |
| `<C-o>` | Jump Older   | Jump to older position |
| `<C-i>` | Jump Newer   | Jump to newer position |
| `''`    | Last Jump    | Jump to last position  |
| `'.`    | Last Change  | Jump to last change    |
| `g;`    | Older Change | Go to older change     |
| `g,`    | Newer Change | Go to newer change     |

---

## 🔢 Macros & Registers

### Macros

| Key          | Action         | Description       |
| ------------ | -------------- | ----------------- |
| `q{a-z}`     | Record Macro   | Start recording   |
| `q`          | Stop Recording | Stop recording    |
| `@{a-z}`     | Play Macro     | Execute macro     |
| `@@`         | Repeat Macro   | Repeat last macro |
| `<leader>sm` | Search Macros  | View macros       |

### Registers

| Key          | Action               | Description                  |
| ------------ | -------------------- | ---------------------------- |
| `"{a-z}y`    | Yank to Register     | Copy to register             |
| `"{a-z}p`    | Paste from Register  | Paste from register          |
| `<leader>sr` | Registers            | View registers               |
| `"0p`        | Last Yank            | Paste last yank (not delete) |
| `"+y`        | Copy to Clipboard    | System clipboard             |
| `"+p`        | Paste from Clipboard | System clipboard             |

---

## 📊 Miscellaneous

### Scrolling

| Key     | Action             | Description               |
| ------- | ------------------ | ------------------------- |
| `<C-d>` | Scroll Down        | Half page down (centered) |
| `<C-u>` | Scroll Up          | Half page up (centered)   |
| `<C-f>` | Page Down          | Full page down            |
| `<C-b>` | Page Up            | Full page up              |
| `<C-e>` | Scroll Down (line) | Scroll one line down      |
| `<C-y>` | Scroll Up (line)   | Scroll one line up        |
| `zz`    | Center Screen      | Center cursor line        |
| `zt`    | Top of Screen      | Cursor to top             |
| `zb`    | Bottom of Screen   | Cursor to bottom          |

### Movement

| Key       | Action             | Description              |
| --------- | ------------------ | ------------------------ |
| `h/j/k/l` | Left/Down/Up/Right | Basic movement           |
| `w`       | Next Word          | Jump to next word        |
| `b`       | Prev Word          | Jump to previous word    |
| `e`       | End of Word        | Jump to word end         |
| `0`       | Line Start         | Start of line            |
| `^`       | First Non-blank    | First non-whitespace     |
| `$`       | Line End           | End of line              |
| `gg`      | File Start         | Go to first line         |
| `G`       | File End           | Go to last line          |
| `{line}G` | Go to Line         | Jump to line number      |
| `%`       | Match Bracket      | Jump to matching bracket |
| `f{char}` | Find Forward       | Find character forward   |
| `F{char}` | Find Backward      | Find character backward  |
| `t{char}` | Till Forward       | Till character forward   |
| `T{char}` | Till Backward      | Till character backward  |
| `;`       | Repeat f/t         | Repeat find/till         |
| `,`       | Reverse f/t        | Reverse find/till        |

### Visual Mode

| Key     | Action       | Description                |
| ------- | ------------ | -------------------------- |
| `v`     | Visual       | Character-wise visual      |
| `V`     | Visual Line  | Line-wise visual           |
| `<C-v>` | Visual Block | Block-wise visual          |
| `gv`    | Reselect     | Reselect last selection    |
| `o`     | Switch End   | Switch cursor to other end |
| `>`     | Indent       | Indent selection           |
| `<`     | Dedent       | Dedent selection           |

### Insert Mode

| Key     | Action               | Description                |
| ------- | -------------------- | -------------------------- |
| `i`     | Insert               | Insert before cursor       |
| `I`     | Insert Line Start    | Insert at line start       |
| `a`     | Append               | Insert after cursor        |
| `A`     | Append Line End      | Insert at line end         |
| `o`     | Open Below           | New line below             |
| `O`     | Open Above           | New line above             |
| `<C-o>` | Normal Command       | Execute one normal command |
| `<C-w>` | Delete Word Back     | Delete word backward       |
| `<C-u>` | Delete to Line Start | Delete to line start       |

### Command Mode

| Key     | Action           | Description                 |
| ------- | ---------------- | --------------------------- |
| `:`     | Command          | Enter command mode          |
| `<C-f>` | Command History  | Open command history window |
| `<C-p>` | Previous Command | Previous in history         |
| `<C-n>` | Next Command     | Next in history             |
| `q:`    | Command Window   | Command history window      |
| `q/`    | Search Window    | Search history window       |

---

## 🎓 Learning & Help

| Key             | Action         | Description           |
| --------------- | -------------- | --------------------- |
| `:help {topic}` | Help           | Open help for topic   |
| `<leader>?`     | LazyVim Help   | LazyVim keymaps       |
| `K`             | Hover Docs     | Show documentation    |
| `:checkhealth`  | Health Check   | Check plugin health   |
| `:Lazy`         | Lazy Manager   | Open plugin manager   |
| `:Mason`        | Mason          | Open tool installer   |
| `g?`            | Help (context) | Context-specific help |

---

## 🚀 Plugin Management (Lazy)

| Key              | Action    | Description                    |
| ---------------- | --------- | ------------------------------ |
| `:Lazy`          | Open Lazy | Open plugin manager            |
| `:LazyExtras`    | Extras    | Enable/disable language extras |
| **Inside Lazy:** |           |                                |
| `I`              | Install   | Install plugins                |
| `U`              | Update    | Update plugins                 |
| `S`              | Sync      | Sync (clean + update)          |
| `X`              | Clear     | Clear finished tasks           |
| `C`              | Check     | Check for updates              |
| `L`              | Log       | Show recent updates            |
| `R`              | Restore   | Restore lockfile               |
| `P`              | Profile   | Profile startup time           |
| `?`              | Help      | Show keybindings               |

---

## 🛠️ Mason (LSP/Tool Management)

| Key               | Action          | Description             |
| ----------------- | --------------- | ----------------------- |
| `:Mason`          | Open Mason      | Open tool installer     |
| **Inside Mason:** |                 |                         |
| `i`               | Install         | Install package         |
| `u`               | Update          | Update package          |
| `U`               | Update All      | Update all packages     |
| `X`               | Uninstall       | Uninstall package       |
| `c`               | Check Updates   | Check for updates       |
| `C`               | Check Outdated  | Check outdated packages |
| `g?`              | Help            | Show help               |
| `/`               | Filter          | Filter packages         |
| `<C-f>`           | Language Filter | Apply language filter   |
| `1`               | Show All        | Show all packages       |
| `2`               | Show LSP        | Show LSP servers only   |
| `3`               | Show DAP        | Show debuggers only     |
| `4`               | Show Linters    | Show linters only       |
| `5`               | Show Formatters | Show formatters only    |

---

## 🔧 Advanced Keybindings

### Repeat Actions

| Key  | Action            | Description            |
| ---- | ----------------- | ---------------------- |
| `.`  | Repeat            | Repeat last change     |
| `@:` | Repeat Command    | Repeat last command    |
| `&`  | Repeat Substitute | Repeat last substitute |

### Increment/Decrement

| Key      | Action                 | Description               |
| -------- | ---------------------- | ------------------------- |
| `<C-a>`  | Increment              | Increase number           |
| `<C-x>`  | Decrement              | Decrease number           |
| `g<C-a>` | Increment (sequential) | Increment in visual block |
| `g<C-x>` | Decrement (sequential) | Decrement in visual block |

### Case Changes

| Key          | Action         | Description              |
| ------------ | -------------- | ------------------------ |
| `~`          | Toggle Case    | Toggle case of character |
| `gu{motion}` | Lowercase      | Convert to lowercase     |
| `gU{motion}` | Uppercase      | Convert to uppercase     |
| `guu`        | Lowercase Line | Lowercase entire line    |
| `gUU`        | Uppercase Line | Uppercase entire line    |
| `g~{motion}` | Toggle Case    | Toggle case (motion)     |

### Join Lines

| Key  | Action          | Description         |
| ---- | --------------- | ------------------- |
| `J`  | Join Lines      | Join line with next |
| `gJ` | Join (no space) | Join without space  |

---

## 🎯 Language-Specific Features

### Treesitter

| Key                 | Action            | Description                   |
| ------------------- | ----------------- | ----------------------------- |
| `<leader>ui`        | Inspect Pos       | Inspect syntax tree at cursor |
| `<leader>uI`        | Inspect Tree      | Show full syntax tree         |
| `<leader>uT`        | Toggle Treesitter | Toggle highlighting           |
| `:TSInstall {lang}` | Install Parser    | Install language parser       |
| `:TSUpdate`         | Update Parsers    | Update all parsers            |

### Python Specific

| Key            | Action          | Description                       |
| -------------- | --------------- | --------------------------------- |
| `<leader>cv`   | Select Venv     | Select Python virtual environment |
| `:ConformInfo` | Check Formatter | Check Black formatter status      |

### JavaScript/TypeScript Specific

| Key          | Action           | Description           |
| ------------ | ---------------- | --------------------- |
| `<leader>co` | Organize Imports | Organize/sort imports |
| `<leader>cR` | Remove Unused    | Remove unused imports |
| `<leader>cM` | Add Missing      | Add missing imports   |

### HTML/JSX Specific

| Key             | Action  | Description              |
| --------------- | ------- | ------------------------ |
| Auto-close tags | Enabled | Tags close automatically |
| `<leader>cf`    | Format  | Prettier formatting      |

---

## 📈 Performance & Diagnostics

### Performance Monitoring

| Key                  | Action         | Description              |
| -------------------- | -------------- | ------------------------ |
| `:Lazy profile`      | Profile        | View plugin load times   |
| `:checkhealth`       | Health         | Full system health check |
| `:checkhealth lazy`  | Lazy Health    | Check Lazy.nvim          |
| `:checkhealth mason` | Mason Health   | Check Mason              |
| `:LspInfo`           | LSP Status     | Check LSP servers        |
| `:ConformInfo`       | Formatter Info | Check formatters         |

### Startup Time

```bash
# Check startup time from terminal
nvim --startuptime startup.log
```

---

## 💡 Pro Tips & Tricks

### Combinations

| Combination | Description                             |
| ----------- | --------------------------------------- |
| `ciw`       | Change inner word                       |
| `ci"`       | Change inside quotes                    |
| `ci(`       | Change inside parentheses               |
| `da"`       | Delete around quotes (including quotes) |
| `di{`       | Delete inside braces                    |
| `yap`       | Yank around paragraph                   |
| `vit`       | Select inside HTML tag                  |
| `>ip`       | Indent paragraph                        |
| `=ap`       | Auto-indent paragraph                   |
| `gUiw`      | Uppercase word                          |
| `guiw`      | Lowercase word                          |

### Useful Commands

| Command      | Description                |
| ------------ | -------------------------- |
| `:so %`      | Source current file        |
| `:messages`  | Show message history       |
| `:reg`       | Show all registers         |
| `:marks`     | Show all marks             |
| `:jumps`     | Show jump list             |
| `:changes`   | Show change list           |
| `:oldfiles`  | Show recently opened files |
| `:pwd`       | Print working directory    |
| `:cd {path}` | Change directory           |

### Search & Replace Patterns

```vim
:%s/old/new/g          " Replace in entire file
:%s/old/new/gc         " Replace with confirmation
:'<,'>s/old/new/g      " Replace in visual selection
:g/pattern/d           " Delete lines matching pattern
:v/pattern/d           " Delete lines NOT matching
```

### Multi-cursor Simulation

| Keys                   | Description                           |
| ---------------------- | ------------------------------------- |
| `cgn`                  | Change next match, then `.` to repeat |
| `<C-v>` + select + `I` | Insert at multiple lines              |
| `<C-v>` + select + `A` | Append at multiple lines              |

---

## 🎮 Cheat Sheet Quick Reference

### Most Used Shortcuts

```
<Space>ff    Find files
<Space>fg    Search in files
<Space>e     File explorer
<Space>gg    LazyGit
<C-\>        Terminal

gd           Go to definition
K            Documentation
<Space>ca    Code actions
<Space>cf    Format code

gcc          Comment line
<C-s>        Save
<Space>bd    Close buffer
<Space>nh    Clear search
```

### Essential Motions

```
w/b/e        Word navigation
0/$          Line start/end
gg/G         File start/end
{/}          Paragraph up/down
%            Matching bracket
f{char}      Find character
```

### Must-Know Operators

```
d   Delete (cut)
c   Change (delete + insert)
y   Yank (copy)
v   Visual select
>   Indent
=   Auto-indent
```

### Combining Operator + Motion

```
dw    Delete word
d$    Delete to end of line
ciw   Change inner word
yap   Yank around paragraph
>ip   Indent paragraph
```

---

## 📚 Resources & Documentation

### Official Documentation

- **LazyVim:** https://www.lazyvim.org
- **Neovim:** https://neovim.io/doc
- **Lazy.nvim:** https://github.com/folke/lazy.nvim

### Help Commands

```vim
:help keymaps           " Keymapping help
:help motion            " Movement help
:help text-objects      " Text objects help
:help nvim-treesitter   " Treesitter help
:help lsp               " LSP help
```

### In-Editor Help

- Press `<Space>` and wait → See available commands
- Press `g?` in any plugin UI → Context help
- Type `:help {topic}` → Search documentation

---

## 🔄 Customization

Your custom configurations are in:

```
~/.config/nvim/lua/
├── config/
│   ├── options.lua      # Editor options
│   ├── keymaps.lua      # Your custom keymaps
│   ├── autocmds.lua     # Auto commands
│   └── lazy.lua         # Plugin manager config
└── plugins/
    ├── lsp.lua          # LSP configuration
    ├── formatting.lua   # Formatters & linters
    ├── git.lua          # Git integration
    ├── productivity.lua # Productivity plugins
    ├── workflow.lua     # Workflow enhancements
    └── performance.lua  # Performance optimizations
```

To add custom keymaps, edit: `~/.config/nvim/lua/config/keymaps.lua`

---

## 🆘 Troubleshooting Shortcuts

| Issue                 | Command                           |
| --------------------- | --------------------------------- |
| Plugin not working    | `:Lazy` → press `X` → `S` to sync |
| LSP not working       | `:LspInfo` to check status        |
| Formatter not working | `:ConformInfo` to check           |
| Check for errors      | `:messages` to see error log      |
| Full health check     | `:checkhealth`                    |
| Slow startup          | `:Lazy profile` to find culprit   |

---

## 🌟 Final Notes

- **Muscle memory takes time** - Be patient!
- **Start with basics** - Don't try to learn everything at once
- **Use `<Space>`** - Your gateway to most commands
- **`:help {topic}`** - When in doubt, read the docs
- **Practice daily** - 15 minutes of deliberate practice
- **Customize gradually** - Add keymaps as you need them

**Happy coding! 🚀**

---

_Last updated: November 2025_  
_LazyVim Configuration by dzgeek_
