-- codeSTACKr Neovim colorscheme
-- Faithfully crafted from codeSTACKr VS Code theme by Jesse Hall

local M = {}

local p = {
  bg = "#09131b",
  bg_dark = "#070f15",
  bg_sidebar = "#0a1620",
  bg_highlight = "#0d1f2d",
  bg_visual = "#163852",
  bg_float = "#0a1620",
  bg_popup = "#0e1e2b",
  bg_status = "#070f15",

  fg = "#ffffff",
  fg_dark = "#c8d6e5",
  fg_gutter = "#506375",
  fg_inactive = "#3d5166",

  orange = "#ff652f",
  yellow = "#ffe400",
  green = "#14a76c",
  neon_green = "#1efaa2",
  purple = "#746aff",
  blue = "#5eb7ee",
  pink = "#ff5177",
  amber = "#ff9d00",
  coral = "#ff9746",
  comment = "#577997",
  border = "#1b3951",
  border_active = "#ff652f",
  diff_add = "#132c25",
  diff_change = "#132e42",
  diff_delete = "#361622",
}

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "codestackr"
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
  hl("FloatTitle", { fg = p.orange, bg = p.bg_float, bold = true })
  hl("FloatFooter", { fg = p.fg_gutter, bg = p.bg_float })

  hl("Cursor", { fg = p.bg, bg = p.yellow })
  hl("TermCursor", { fg = p.bg, bg = p.yellow })
  hl("CursorLine", { bg = p.bg_highlight })
  hl("CursorColumn", { bg = p.bg_highlight })
  hl("ColorColumn", { bg = p.bg_highlight })
  hl("LineNr", { fg = p.fg_gutter, bg = p.bg })
  hl("CursorLineNr", { fg = p.orange, bg = p.bg, bold = true })
  hl("SignColumn", { fg = p.fg_gutter, bg = p.bg })
  hl("FoldColumn", { fg = p.fg_gutter, bg = p.bg })
  hl("Folded", { fg = p.comment, bg = p.bg_highlight })

  hl("Visual", { bg = p.bg_visual })
  hl("VisualNOS", { bg = p.bg_visual })
  hl("Search", { fg = p.fg, bg = p.orange })
  hl("IncSearch", { fg = p.bg, bg = p.yellow, bold = true })
  hl("CurSearch", { fg = p.bg, bg = p.yellow, bold = true })

  hl("VertSplit", { fg = p.border, bg = p.bg })
  hl("WinSeparator", { fg = p.border, bg = p.bg })

  hl("StatusLine", { fg = p.fg, bg = p.bg_status })
  hl("StatusLineNC", { fg = p.fg_gutter, bg = p.bg_status })

  hl("TabLine", { fg = p.fg_gutter, bg = p.bg_sidebar })
  hl("TabLineSel", { fg = p.fg, bg = p.bg, bold = true })
  hl("TabLineFill", { bg = p.bg_sidebar })

  hl("Pmenu", { fg = p.fg, bg = p.bg_popup })
  hl("PmenuSel", { fg = p.fg, bg = "#1b4468", bold = true })
  hl("PmenuSbar", { bg = p.bg_popup })
  hl("PmenuThumb", { bg = p.border })

  hl("WildMenu", { fg = p.bg, bg = p.yellow, bold = true })
  hl("Directory", { fg = p.blue, bold = true })
  hl("MatchParen", { fg = p.yellow, bg = p.bg_highlight, bold = true, underline = true })
  hl("Question", { fg = p.green })
  hl("MoreMsg", { fg = p.green })
  hl("ErrorMsg", { fg = p.pink, bold = true })
  hl("WarningMsg", { fg = p.yellow, bold = true })
  hl("ModeMsg", { fg = p.fg, bold = true })
  hl("NonText", { fg = "#162838" })
  hl("Whitespace", { fg = "#162838" })
  hl("SpecialKey", { fg = "#162838" })
  hl("Title", { fg = p.orange, bold = true })
  hl("Conceal", { fg = p.comment })

  -- Standard Syntax Highlighting
  hl("Comment", { fg = p.comment, italic = true })
  hl("Constant", { fg = p.pink })
  hl("String", { fg = p.green })
  hl("Character", { fg = p.neon_green })
  hl("Number", { fg = p.yellow })
  hl("Boolean", { fg = p.orange })
  hl("Float", { fg = p.yellow })

  hl("Identifier", { fg = p.purple })
  hl("Function", { fg = p.yellow })

  hl("Statement", { fg = p.yellow, bold = true })
  hl("Conditional", { fg = p.yellow, bold = true })
  hl("Repeat", { fg = p.yellow, bold = true })
  hl("Label", { fg = p.yellow, bold = true })
  hl("Operator", { fg = p.blue })
  hl("Keyword", { fg = p.blue, bold = true })
  hl("Exception", { fg = p.yellow, bold = true })

  hl("PreProc", { fg = p.coral })
  hl("Include", { fg = p.coral })
  hl("Define", { fg = p.coral })
  hl("Macro", { fg = p.coral })
  hl("PreCondit", { fg = p.coral })

  hl("Type", { fg = p.amber })
  hl("StorageClass", { fg = p.orange })
  hl("Structure", { fg = p.amber })
  hl("Typedef", { fg = p.amber })

  hl("Special", { fg = p.neon_green })
  hl("SpecialChar", { fg = p.neon_green })
  hl("Tag", { fg = p.orange })
  hl("Delimiter", { fg = p.fg })
  hl("SpecialComment", { fg = p.coral, italic = true })
  hl("Debug", { fg = p.pink })
  hl("Underlined", { underline = true })
  hl("Error", { fg = p.pink, bold = true })
  hl("Todo", { fg = p.bg, bg = p.yellow, bold = true })

  -- Treesitter Highlights (matches VS Code codeSTACKr token colors)
  hl("@comment", { fg = p.comment, italic = true })
  hl("@comment.documentation", { fg = p.comment, italic = true })
  hl("@comment.todo", { fg = p.bg, bg = p.yellow, bold = true })
  hl("@comment.note", { fg = p.bg, bg = p.blue, bold = true })
  hl("@comment.warning", { fg = p.bg, bg = p.yellow, bold = true })
  hl("@comment.error", { fg = p.bg, bg = p.pink, bold = true })

  hl("@string", { fg = p.green })
  hl("@string.documentation", { fg = p.green })
  hl("@string.regexp", { fg = p.neon_green })
  hl("@string.escape", { fg = p.neon_green })
  hl("@string.special", { fg = p.neon_green })
  hl("@character", { fg = p.neon_green })
  hl("@character.special", { fg = p.neon_green })

  hl("@number", { fg = p.yellow })
  hl("@number.float", { fg = p.yellow })
  hl("@boolean", { fg = p.orange })

  -- Keywords: control flow is yellow, storage is orange, general is sky blue
  hl("@keyword", { fg = p.blue, bold = true })
  hl("@keyword.coroutine", { fg = p.orange, bold = true }) -- async, await
  hl("@keyword.function", { fg = p.orange, bold = true })  -- function
  hl("@keyword.type", { fg = p.orange, bold = true })      -- type, interface, class, enum
  hl("@keyword.modifier", { fg = p.orange, bold = true })  -- export, default, declare
  hl("@keyword.repeat", { fg = p.yellow, bold = true })    -- for, while, do
  hl("@keyword.return", { fg = p.yellow, bold = true })    -- return
  hl("@keyword.conditional", { fg = p.yellow, bold = true }) -- if, else, switch, case
  hl("@keyword.conditional.ternary", { fg = p.blue, bold = true })
  hl("@keyword.exception", { fg = p.yellow, bold = true }) -- throw, try, catch, finally
  hl("@keyword.import", { fg = p.blue, bold = true })      -- import, from
  hl("@keyword.export", { fg = p.orange, bold = true })
  hl("@keyword.operator", { fg = p.blue, bold = true })

  hl("@operator", { fg = p.blue })

  -- Functions: definition is blue, calls are yellow
  hl("@function", { fg = p.blue })
  hl("@function.call", { fg = p.yellow })
  hl("@function.builtin", { fg = p.yellow })
  hl("@function.macro", { fg = p.coral })
  hl("@function.method", { fg = p.blue })
  hl("@function.method.call", { fg = p.yellow })
  hl("@constructor", { fg = p.amber })

  -- Variables: identifiers are purple, parameters purple, properties sky blue
  hl("@variable", { fg = p.purple })
  hl("@variable.builtin", { fg = p.blue }) -- this, super
  hl("@variable.parameter", { fg = p.purple })
  hl("@variable.member", { fg = p.blue })
  hl("@property", { fg = p.blue })

  -- Types: warm amber
  hl("@type", { fg = p.amber })
  hl("@type.builtin", { fg = p.amber })
  hl("@type.definition", { fg = p.amber })
  hl("@type.qualifier", { fg = p.orange })

  -- Constants
  hl("@constant", { fg = p.pink })
  hl("@constant.builtin", { fg = p.orange })
  hl("@constant.macro", { fg = p.pink })

  -- Delimiters & Punctuation
  hl("@punctuation.delimiter", { fg = p.fg })
  hl("@punctuation.bracket", { fg = p.fg })
  hl("@punctuation.special", { fg = p.orange })

  -- Markup / HTML / JSX
  hl("@tag", { fg = "#ffc598" })
  hl("@tag.builtin", { fg = "#ffc598" })
  hl("@tag.attribute", { fg = p.yellow })
  hl("@tag.delimiter", { fg = p.orange })

  -- LSP Semantic Highlighting (ensures TypeScript/JS exact match)
  hl("@lsp.type.class", { fg = p.amber })
  hl("@lsp.type.decorator", { fg = p.coral })
  hl("@lsp.type.enum", { fg = p.amber })
  hl("@lsp.type.enumMember", { fg = p.pink })
  hl("@lsp.type.function", { fg = p.yellow })
  hl("@lsp.type.interface", { fg = p.amber })
  hl("@lsp.type.macro", { fg = p.coral })
  hl("@lsp.type.method", { fg = p.yellow })
  hl("@lsp.type.namespace", { fg = p.fg })
  hl("@lsp.type.parameter", { fg = p.purple })
  hl("@lsp.type.property", { fg = p.blue })
  hl("@lsp.type.struct", { fg = p.amber })
  hl("@lsp.type.type", { fg = p.amber })
  hl("@lsp.type.typeParameter", { fg = p.amber })
  hl("@lsp.type.variable", { fg = p.purple })
  hl("@lsp.typemod.variable.defaultLibrary", { fg = p.blue })
  hl("@lsp.typemod.function.defaultLibrary", { fg = p.yellow })
  hl("@lsp.typemod.variable.readonly", { fg = p.pink })
  hl("@lsp.typemod.property.readonly", { fg = p.blue })

  -- Diagnostics
  hl("DiagnosticError", { fg = p.pink })
  hl("DiagnosticWarn", { fg = p.yellow })
  hl("DiagnosticInfo", { fg = p.blue })
  hl("DiagnosticHint", { fg = p.green })
  hl("DiagnosticUnderlineError", { undercurl = true, sp = p.pink })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = p.yellow })
  hl("DiagnosticUnderlineInfo", { undercurl = true, sp = p.blue })
  hl("DiagnosticUnderlineHint", { undercurl = true, sp = p.green })

  -- Git Signs
  hl("GitSignsAdd", { fg = p.green, bg = p.bg })
  hl("GitSignsChange", { fg = p.blue, bg = p.bg })
  hl("GitSignsDelete", { fg = p.pink, bg = p.bg })

  -- Diff
  hl("DiffAdd", { bg = p.diff_add })
  hl("DiffChange", { bg = p.diff_change })
  hl("DiffDelete", { bg = p.diff_delete })
  hl("DiffText", { bg = "#1b4a6b", bold = true })

  -- Indent Blankline (matches VS Code bracket guides)
  hl("IblIndent", { fg = "#162838" })
  hl("IblWhitespace", { fg = "#162838" })
  hl("IblScope", { fg = p.orange, bold = true })

  -- Neo-tree (VS Code Sidebar look)
  hl("NeoTreeNormal", { fg = p.fg, bg = p.bg_sidebar })
  hl("NeoTreeNormalNC", { fg = p.fg, bg = p.bg_sidebar })
  hl("NeoTreeWinSeparator", { fg = p.border, bg = p.bg_sidebar })
  hl("NeoTreeDirectoryIcon", { fg = p.blue })
  hl("NeoTreeDirectoryName", { fg = p.fg, bold = true })
  hl("NeoTreeFileName", { fg = p.fg })
  hl("NeoTreeGitAdded", { fg = p.green })
  hl("NeoTreeGitModified", { fg = p.blue })
  hl("NeoTreeGitDeleted", { fg = p.pink })
  hl("NeoTreeGitUntracked", { fg = p.coral })
  hl("NeoTreeCursorLine", { bg = p.bg_highlight })
  hl("NeoTreeRootName", { fg = p.orange, bold = true })
  hl("NeoTreeExpander", { fg = p.fg_gutter })
  hl("NeoTreeIndentMarker", { fg = p.border })

  -- Telescope
  hl("TelescopeNormal", { fg = p.fg, bg = p.bg_float })
  hl("TelescopeBorder", { fg = p.border, bg = p.bg_float })
  hl("TelescopeTitle", { fg = p.orange, bg = p.bg_float, bold = true })
  hl("TelescopePromptNormal", { fg = p.fg, bg = p.bg_popup })
  hl("TelescopePromptBorder", { fg = p.border, bg = p.bg_popup })
  hl("TelescopePromptTitle", { fg = p.bg, bg = p.orange, bold = true })
  hl("TelescopePromptPrefix", { fg = p.orange, bold = true })
  hl("TelescopeSelection", { fg = p.fg, bg = p.bg_visual })
  hl("TelescopeMatching", { fg = p.yellow, bold = true })

  -- Blink.cmp / nvim-cmp
  hl("BlinkCmpMenu", { fg = p.fg, bg = p.bg_popup })
  hl("BlinkCmpMenuBorder", { fg = p.border, bg = p.bg_popup })
  hl("BlinkCmpMenuSelection", { fg = p.fg, bg = "#1b4468", bold = true })
  hl("BlinkCmpDoc", { fg = p.fg, bg = p.bg_float })
  hl("BlinkCmpDocBorder", { fg = p.border, bg = p.bg_float })
  hl("BlinkCmpKind", { fg = p.orange })
  hl("BlinkCmpKindFunction", { fg = p.yellow })
  hl("BlinkCmpKindMethod", { fg = p.yellow })
  hl("BlinkCmpKindVariable", { fg = p.purple })
  hl("BlinkCmpKindKeyword", { fg = p.blue })
  hl("BlinkCmpKindProperty", { fg = p.blue })
  hl("BlinkCmpKindClass", { fg = p.amber })
  hl("BlinkCmpKindInterface", { fg = p.amber })
  hl("BlinkCmpKindTypeParameter", { fg = p.amber })

  -- Barbecue / Navic (Breadcrumbs)
  hl("NavicText", { fg = p.fg_dark, bg = p.bg })
  hl("NavicSeparator", { fg = p.fg_gutter, bg = p.bg })
  hl("NavicIconsFile", { fg = p.blue, bg = p.bg })
  hl("NavicIconsModule", { fg = p.coral, bg = p.bg })
  hl("NavicIconsNamespace", { fg = p.fg, bg = p.bg })
  hl("NavicIconsPackage", { fg = p.coral, bg = p.bg })
  hl("NavicIconsClass", { fg = p.amber, bg = p.bg })
  hl("NavicIconsMethod", { fg = p.yellow, bg = p.bg })
  hl("NavicIconsProperty", { fg = p.blue, bg = p.bg })
  hl("NavicIconsField", { fg = p.blue, bg = p.bg })
  hl("NavicIconsConstructor", { fg = p.amber, bg = p.bg })
  hl("NavicIconsEnum", { fg = p.amber, bg = p.bg })
  hl("NavicIconsInterface", { fg = p.amber, bg = p.bg })
  hl("NavicIconsFunction", { fg = p.yellow, bg = p.bg })
  hl("NavicIconsVariable", { fg = p.purple, bg = p.bg })
  hl("NavicIconsConstant", { fg = p.pink, bg = p.bg })
  hl("NavicIconsString", { fg = p.green, bg = p.bg })
  hl("NavicIconsNumber", { fg = p.yellow, bg = p.bg })
  hl("NavicIconsBoolean", { fg = p.orange, bg = p.bg })
  hl("NavicIconsArray", { fg = p.orange, bg = p.bg })
  hl("NavicIconsObject", { fg = p.amber, bg = p.bg })
  hl("NavicIconsKey", { fg = p.blue, bg = p.bg })
  hl("NavicIconsNull", { fg = p.pink, bg = p.bg })
  hl("NavicIconsEnumMember", { fg = p.pink, bg = p.bg })
  hl("NavicIconsStruct", { fg = p.amber, bg = p.bg })
  hl("NavicIconsEvent", { fg = p.yellow, bg = p.bg })
  hl("NavicIconsOperator", { fg = p.blue, bg = p.bg })
  hl("NavicIconsTypeParameter", { fg = p.amber, bg = p.bg })

  -- WhichKey
  hl("WhichKey", { fg = p.orange, bold = true })
  hl("WhichKeyGroup", { fg = p.blue })
  hl("WhichKeyDesc", { fg = p.fg })
  hl("WhichKeySeparator", { fg = p.fg_gutter })
  hl("WhichKeyFloat", { bg = p.bg_float })
  hl("WhichKeyBorder", { fg = p.border, bg = p.bg_float })

  -- Mini Hipatterns / Colorize
  hl("MiniHipatternsFixme", { fg = p.bg, bg = p.pink, bold = true })
  hl("MiniHipatternsHack", { fg = p.bg, bg = p.yellow, bold = true })
  hl("MiniHipatternsTodo", { fg = p.bg, bg = p.yellow, bold = true })
  hl("MiniHipatternsNote", { fg = p.bg, bg = p.blue, bold = true })
end

M.setup()
return M
