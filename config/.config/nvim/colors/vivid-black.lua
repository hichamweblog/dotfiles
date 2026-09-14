-- Vivid Black Neovim colorscheme
-- Faithfully crafted from Vivid Black VS Code theme by asmraihan

local M = {}

local p = {
  bg = "#141417",
  bg_dark = "#101012",
  bg_sidebar = "#101012",
  bg_highlight = "#19191e",
  bg_visual = "#2b2b36",
  bg_float = "#1f1f24",
  bg_popup = "#141417",
  bg_status = "#101012",

  fg = "#eeeeee",
  fg_dark = "#cbcbcb",
  fg_gutter = "#555555",
  fg_inactive = "#404040",

  yellow = "#ffb638",       -- keywords, import, from, return, if, await, operators
  teal = "#14e5d4",         -- const, let, var, type keyword, storage
  blue = "#28a9ff",         -- functions, methods, tags, identifiers
  purple = "#a95eff",       -- types, classes, interfaces
  pink = "#ff478d",         -- variables, parameters, imported names
  orchid = "#e66dff",       -- decorators, quotes
  green = "#37ae6f",        -- strings
  bright_green = "#42dd76", -- git added, diff
  coral = "#ff7135",        -- numbers, units, this/self, properties
  red = "#d62c2c",          -- constants, errors, git deleted
  comment = "#555555",      -- comments (italic)
  border = "#2a2a32",
  border_active = "#ffb638",
  cursor = "#ffb638",
  diff_add = "#182820",
  diff_change = "#152433",
  diff_delete = "#31171c",
}

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "vivid-black"
  vim.o.termguicolors = true
  vim.o.background = "dark"

  local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Editor UI Highlights
  hl("Normal", { fg = p.fg, bg = p.bg })
  hl("NormalNC", { fg = p.fg, bg = p.bg })
  hl("NormalFloat", { fg = p.fg, bg = p.bg_float })
  hl("FloatBorder", { fg = p.border, bg = p.bg_float })
  hl("FloatTitle", { fg = p.yellow, bg = p.bg_float, bold = true })
  hl("FloatFooter", { fg = p.fg_gutter, bg = p.bg_float })

  hl("Cursor", { fg = p.bg, bg = p.cursor })
  hl("TermCursor", { fg = p.bg, bg = p.cursor })
  hl("CursorLine", { bg = p.bg_highlight })
  hl("CursorColumn", { bg = p.bg_highlight })
  hl("ColorColumn", { bg = p.bg_highlight })
  hl("LineNr", { fg = p.fg_gutter, bg = p.bg })
  hl("CursorLineNr", { fg = p.fg, bg = p.bg, bold = true })
  hl("SignColumn", { fg = p.fg_gutter, bg = p.bg })
  hl("FoldColumn", { fg = p.fg_gutter, bg = p.bg })
  hl("Folded", { fg = p.comment, bg = p.bg_highlight })

  hl("Visual", { bg = p.bg_visual })
  hl("VisualNOS", { bg = p.bg_visual })
  hl("Search", { fg = p.bg, bg = p.yellow, bold = true })
  hl("IncSearch", { fg = p.bg, bg = p.blue, bold = true })
  hl("CurSearch", { fg = p.bg, bg = p.blue, bold = true })

  hl("VertSplit", { fg = p.border, bg = p.bg })
  hl("WinSeparator", { fg = p.border, bg = p.bg })

  hl("StatusLine", { fg = p.fg_dark, bg = p.bg_status })
  hl("StatusLineNC", { fg = p.fg_gutter, bg = p.bg_status })

  hl("TabLine", { fg = p.fg_gutter, bg = p.bg_sidebar })
  hl("TabLineSel", { fg = p.fg, bg = p.bg, bold = true })
  hl("TabLineFill", { bg = p.bg_sidebar })

  hl("Pmenu", { fg = p.fg_dark, bg = p.bg_float })
  hl("PmenuSel", { fg = p.fg, bg = "#32323e", bold = true })
  hl("PmenuSbar", { bg = p.bg_float })
  hl("PmenuThumb", { bg = p.border })

  hl("WildMenu", { fg = p.bg, bg = p.yellow, bold = true })
  hl("Directory", { fg = p.blue, bold = true })
  hl("MatchParen", { fg = p.yellow, bg = p.bg_highlight, bold = true, underline = true })
  hl("Question", { fg = p.bright_green })
  hl("MoreMsg", { fg = p.bright_green })
  hl("ErrorMsg", { fg = p.red, bold = true })
  hl("WarningMsg", { fg = p.yellow, bold = true })
  hl("ModeMsg", { fg = p.fg, bold = true })
  hl("NonText", { fg = "#222228" })
  hl("Whitespace", { fg = "#222228" })
  hl("SpecialKey", { fg = "#222228" })
  hl("Title", { fg = p.yellow, bold = true })
  hl("Conceal", { fg = p.comment })

  -- Standard Syntax Highlighting
  hl("Comment", { fg = p.comment, italic = true })
  hl("Constant", { fg = p.red })
  hl("String", { fg = p.green })
  hl("Character", { fg = p.green })
  hl("Number", { fg = p.coral })
  hl("Boolean", { fg = p.red })
  hl("Float", { fg = p.coral })

  hl("Identifier", { fg = p.pink })
  hl("Function", { fg = p.blue })

  hl("Statement", { fg = p.yellow, bold = true })
  hl("Conditional", { fg = p.yellow, bold = true })
  hl("Repeat", { fg = p.yellow, bold = true })
  hl("Label", { fg = p.yellow, bold = true })
  hl("Operator", { fg = p.yellow })
  hl("Keyword", { fg = p.yellow, bold = true })
  hl("Exception", { fg = p.yellow, bold = true })

  hl("PreProc", { fg = p.yellow })
  hl("Include", { fg = p.yellow })
  hl("Define", { fg = p.yellow })
  hl("Macro", { fg = p.orchid })
  hl("PreCondit", { fg = p.yellow })

  hl("Type", { fg = p.purple })
  hl("StorageClass", { fg = p.teal })
  hl("Structure", { fg = p.purple })
  hl("Typedef", { fg = p.purple })

  hl("Special", { fg = p.orchid })
  hl("SpecialChar", { fg = p.yellow })
  hl("Tag", { fg = p.blue })
  hl("Delimiter", { fg = "#8c8c93" })
  hl("SpecialComment", { fg = p.comment, italic = true })
  hl("Debug", { fg = p.red })
  hl("Underlined", { underline = true })
  hl("Error", { fg = p.red, bold = true })
  hl("Todo", { fg = p.bg, bg = p.yellow, bold = true })

  -- Treesitter Highlights (matches Vivid Black VS Code rules)
  hl("@comment", { fg = p.comment, italic = true })
  hl("@comment.documentation", { fg = p.comment, italic = true })
  hl("@comment.todo", { fg = p.bg, bg = p.yellow, bold = true })
  hl("@comment.note", { fg = p.bg, bg = p.blue, bold = true })
  hl("@comment.warning", { fg = p.bg, bg = p.yellow, bold = true })
  hl("@comment.error", { fg = p.bg, bg = p.red, bold = true })

  hl("@string", { fg = p.green })
  hl("@string.documentation", { fg = "#2f7a4e" })
  hl("@string.regexp", { fg = p.green })
  hl("@string.escape", { fg = p.yellow })
  hl("@string.special", { fg = p.orchid })
  hl("@character", { fg = p.green })
  hl("@character.special", { fg = p.yellow })

  hl("@number", { fg = p.coral })
  hl("@number.float", { fg = p.coral })
  hl("@boolean", { fg = p.red })

  -- Keywords: control flow, import, export are yellow; storage is teal
  hl("@keyword", { fg = p.yellow, bold = true })
  hl("@keyword.coroutine", { fg = p.yellow, bold = true }) -- async, await
  hl("@keyword.function", { fg = p.teal, bold = true })    -- function
  hl("@keyword.type", { fg = p.teal, bold = true })        -- type, interface
  hl("@keyword.modifier", { fg = p.teal, bold = true })    -- const, let, var, static
  hl("@keyword.repeat", { fg = p.yellow, bold = true })
  hl("@keyword.return", { fg = p.yellow, bold = true })
  hl("@keyword.conditional", { fg = p.yellow, bold = true })
  hl("@keyword.conditional.ternary", { fg = p.yellow, bold = true })
  hl("@keyword.exception", { fg = p.yellow, bold = true })
  hl("@keyword.import", { fg = p.yellow, bold = true })    -- import, from
  hl("@keyword.export", { fg = p.yellow, bold = true })
  hl("@keyword.operator", { fg = p.yellow, bold = true })  -- =>, ===, =

  hl("@operator", { fg = p.yellow })

  -- Functions: always electric sky blue
  hl("@function", { fg = p.blue })
  hl("@function.call", { fg = p.blue })
  hl("@function.builtin", { fg = p.blue })
  hl("@function.macro", { fg = p.orchid })
  hl("@function.method", { fg = p.blue })
  hl("@function.method.call", { fg = p.blue })
  hl("@constructor", { fg = p.purple })

  -- Variables: identifiers are pink/magenta, properties are coral/white
  hl("@variable", { fg = p.pink })
  hl("@variable.builtin", { fg = p.coral }) -- this, self
  hl("@variable.parameter", { fg = p.pink })
  hl("@variable.member", { fg = p.coral })
  hl("@property", { fg = p.coral })

  -- Types: vivid electric purple
  hl("@type", { fg = p.purple })
  hl("@type.builtin", { fg = p.purple })
  hl("@type.definition", { fg = p.purple })
  hl("@type.qualifier", { fg = p.teal })

  -- Constants
  hl("@constant", { fg = p.red })
  hl("@constant.builtin", { fg = p.red })
  hl("@constant.macro", { fg = p.coral })

  -- Delimiters & Punctuation
  hl("@punctuation.delimiter", { fg = "#8c8c93" })
  hl("@punctuation.bracket", { fg = "#8c8c93" })
  hl("@punctuation.special", { fg = p.yellow })

  -- Markup / HTML / JSX
  hl("@tag", { fg = p.blue })
  hl("@tag.builtin", { fg = p.blue })
  hl("@tag.attribute", { fg = p.yellow })
  hl("@tag.delimiter", { fg = p.blue })

  -- LSP Semantic Highlighting (exact Vivid Black semantic token colors)
  hl("@lsp.type.class", { fg = p.purple })
  hl("@lsp.type.decorator", { fg = p.orchid })
  hl("@lsp.type.enum", { fg = p.purple })
  hl("@lsp.type.enumMember", { fg = p.purple })
  hl("@lsp.type.function", { fg = p.blue })
  hl("@lsp.type.interface", { fg = p.purple })
  hl("@lsp.type.macro", { fg = p.orchid })
  hl("@lsp.type.method", { fg = p.blue })
  hl("@lsp.type.namespace", { fg = p.blue })
  hl("@lsp.type.parameter", { fg = p.orchid })
  hl("@lsp.type.property", { fg = p.coral })
  hl("@lsp.type.struct", { fg = p.purple })
  hl("@lsp.type.type", { fg = p.purple })
  hl("@lsp.type.typeParameter", { fg = p.purple })
  hl("@lsp.type.variable", { fg = "#9f7efe" })
  hl("@lsp.typemod.variable.defaultLibrary", { fg = p.teal })
  hl("@lsp.typemod.function.defaultLibrary", { fg = p.blue })
  hl("@lsp.typemod.variable.readonly", { fg = p.pink })

  -- Diagnostics
  hl("DiagnosticError", { fg = p.red })
  hl("DiagnosticWarn", { fg = p.yellow })
  hl("DiagnosticInfo", { fg = p.blue })
  hl("DiagnosticHint", { fg = p.bright_green })
  hl("DiagnosticUnderlineError", { undercurl = true, sp = p.red })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = p.yellow })
  hl("DiagnosticUnderlineInfo", { undercurl = true, sp = p.blue })
  hl("DiagnosticUnderlineHint", { undercurl = true, sp = p.bright_green })

  -- Git Signs
  hl("GitSignsAdd", { fg = p.bright_green, bg = p.bg })
  hl("GitSignsChange", { fg = p.blue, bg = p.bg })
  hl("GitSignsDelete", { fg = p.red, bg = p.bg })

  -- Diff
  hl("DiffAdd", { bg = p.diff_add })
  hl("DiffChange", { bg = p.diff_change })
  hl("DiffDelete", { bg = p.diff_delete })
  hl("DiffText", { bg = "#183a54", bold = true })

  -- Indent Blankline
  hl("IblIndent", { fg = "#222228" })
  hl("IblWhitespace", { fg = "#222228" })
  hl("IblScope", { fg = "#777777", bold = true })

  -- Neo-tree
  hl("NeoTreeNormal", { fg = p.fg_dark, bg = p.bg_sidebar })
  hl("NeoTreeNormalNC", { fg = p.fg_dark, bg = p.bg_sidebar })
  hl("NeoTreeWinSeparator", { fg = p.border, bg = p.bg_sidebar })
  hl("NeoTreeDirectoryIcon", { fg = p.blue })
  hl("NeoTreeDirectoryName", { fg = p.fg, bold = true })
  hl("NeoTreeFileName", { fg = p.fg_dark })
  hl("NeoTreeGitAdded", { fg = p.bright_green })
  hl("NeoTreeGitModified", { fg = p.blue })
  hl("NeoTreeGitDeleted", { fg = p.red })
  hl("NeoTreeGitUntracked", { fg = p.bright_green })
  hl("NeoTreeCursorLine", { bg = p.bg_highlight })
  hl("NeoTreeRootName", { fg = p.yellow, bold = true })
  hl("NeoTreeExpander", { fg = p.fg_gutter })
  hl("NeoTreeIndentMarker", { fg = p.border })

  -- Telescope
  hl("TelescopeNormal", { fg = p.fg, bg = p.bg_float })
  hl("TelescopeBorder", { fg = p.border, bg = p.bg_float })
  hl("TelescopeTitle", { fg = p.yellow, bg = p.bg_float, bold = true })
  hl("TelescopePromptNormal", { fg = p.fg, bg = p.bg_popup })
  hl("TelescopePromptBorder", { fg = p.border, bg = p.bg_popup })
  hl("TelescopePromptTitle", { fg = p.bg, bg = p.yellow, bold = true })
  hl("TelescopePromptPrefix", { fg = p.yellow, bold = true })
  hl("TelescopeSelection", { fg = p.fg, bg = p.bg_visual })
  hl("TelescopeMatching", { fg = p.yellow, bold = true })

  -- Blink.cmp
  hl("BlinkCmpMenu", { fg = p.fg, bg = p.bg_float })
  hl("BlinkCmpMenuBorder", { fg = p.border, bg = p.bg_float })
  hl("BlinkCmpMenuSelection", { fg = p.fg, bg = "#32323e", bold = true })
  hl("BlinkCmpDoc", { fg = p.fg, bg = p.bg_float })
  hl("BlinkCmpDocBorder", { fg = p.border, bg = p.bg_float })
  hl("BlinkCmpKind", { fg = p.yellow })
  hl("BlinkCmpKindFunction", { fg = p.blue })
  hl("BlinkCmpKindMethod", { fg = p.blue })
  hl("BlinkCmpKindVariable", { fg = p.pink })
  hl("BlinkCmpKindKeyword", { fg = p.yellow })
  hl("BlinkCmpKindProperty", { fg = p.coral })
  hl("BlinkCmpKindClass", { fg = p.purple })
  hl("BlinkCmpKindInterface", { fg = p.purple })
  hl("BlinkCmpKindTypeParameter", { fg = p.purple })

  -- Barbecue / Navic (Breadcrumbs)
  hl("NavicText", { fg = p.fg_dark, bg = p.bg })
  hl("NavicSeparator", { fg = p.fg_gutter, bg = p.bg })
  hl("NavicIconsFile", { fg = p.blue, bg = p.bg })
  hl("NavicIconsModule", { fg = p.yellow, bg = p.bg })
  hl("NavicIconsNamespace", { fg = p.blue, bg = p.bg })
  hl("NavicIconsPackage", { fg = p.yellow, bg = p.bg })
  hl("NavicIconsClass", { fg = p.purple, bg = p.bg })
  hl("NavicIconsMethod", { fg = p.blue, bg = p.bg })
  hl("NavicIconsProperty", { fg = p.coral, bg = p.bg })
  hl("NavicIconsField", { fg = p.coral, bg = p.bg })
  hl("NavicIconsConstructor", { fg = p.purple, bg = p.bg })
  hl("NavicIconsEnum", { fg = p.purple, bg = p.bg })
  hl("NavicIconsInterface", { fg = p.purple, bg = p.bg })
  hl("NavicIconsFunction", { fg = p.blue, bg = p.bg })
  hl("NavicIconsVariable", { fg = p.pink, bg = p.bg })
  hl("NavicIconsConstant", { fg = p.red, bg = p.bg })
  hl("NavicIconsString", { fg = p.green, bg = p.bg })
  hl("NavicIconsNumber", { fg = p.coral, bg = p.bg })
  hl("NavicIconsBoolean", { fg = p.red, bg = p.bg })
  hl("NavicIconsArray", { fg = p.yellow, bg = p.bg })
  hl("NavicIconsObject", { fg = p.purple, bg = p.bg })
  hl("NavicIconsKey", { fg = p.coral, bg = p.bg })
  hl("NavicIconsNull", { fg = p.red, bg = p.bg })
  hl("NavicIconsEnumMember", { fg = p.purple, bg = p.bg })
  hl("NavicIconsStruct", { fg = p.purple, bg = p.bg })
  hl("NavicIconsEvent", { fg = p.blue, bg = p.bg })
  hl("NavicIconsOperator", { fg = p.yellow, bg = p.bg })
  hl("NavicIconsTypeParameter", { fg = p.purple, bg = p.bg })

  -- WhichKey
  hl("WhichKey", { fg = p.yellow, bold = true })
  hl("WhichKeyGroup", { fg = p.blue })
  hl("WhichKeyDesc", { fg = p.fg })
  hl("WhichKeySeparator", { fg = p.fg_gutter })
  hl("WhichKeyFloat", { bg = p.bg_float })
  hl("WhichKeyBorder", { fg = p.border, bg = p.bg_float })

  -- Mini Hipatterns
  hl("MiniHipatternsFixme", { fg = p.bg, bg = p.red, bold = true })
  hl("MiniHipatternsHack", { fg = p.bg, bg = p.yellow, bold = true })
  hl("MiniHipatternsTodo", { fg = p.bg, bg = p.yellow, bold = true })
  hl("MiniHipatternsNote", { fg = p.bg, bg = p.blue, bold = true })
end

M.setup()
return M
