-- Modern IDE coding experience (VSCode-like features)
-- This configures autocompletion, snippets, and intelligent code actions

return {
  -- blink.cmp - Modern completion engine (already included in LazyVim)
  -- Using LazyVim defaults with ghost text enabled
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = {
          enabled = true, -- Show ghost text like GitHub Copilot
        },
      },
    },
  },

  -- Snippet engine and collection (VSCode-like snippets)
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets", -- Collection of snippets for various languages
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
      region_check_events = "CursorMoved",
    },
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<tab>",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "<s-tab>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
  },

  -- Incremental LSP renaming (like F2 in VSCode)
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
    keys = {
      {
        "<leader>cr",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Rename (inc-rename)",
      },
    },
  },

  -- Better code actions UI (VSCode-like menu)
  {
    "aznhe21/actions-preview.nvim",
    keys = {
      {
        "<leader>ca",
        function()
          require("actions-preview").code_actions()
        end,
        desc = "Code Action (Preview)",
        mode = { "n", "v" },
      },
    },
    opts = {
      telescope = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
          width = 0.8,
          height = 0.9,
          prompt_position = "top",
          preview_cutoff = 20,
          preview_height = function(_, _, max_lines)
            return max_lines - 15
          end,
        },
      },
    },
  },

  -- Inline function signatures (parameter hints like VSCode)
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded",
      },
      hint_enable = true, -- Virtual hint text
      hint_prefix = "󰊕 ",
      hi_parameter = "LspSignatureActiveParameter",
      max_width = 120,
      floating_window = true,
      floating_window_above_cur_line = true,
    },
  },

  -- Auto imports (like VSCode auto-import)
  {
    "stevanmilic/nvim-lspimport",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    keys = {
      {
        "<leader>ci",
        function()
          require("lspimport").import()
        end,
        desc = "Import missing symbol",
      },
    },
  },

  -- Better LSP UI (hover, signature help, diagnostics)
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      ui = {
        border = "rounded",
        code_action = "💡",
      },
      lightbulb = {
        enable = true,
        sign = true,
        virtual_text = false,
      },
      symbol_in_winbar = {
        enable = true, -- Show current symbol in winbar (like VSCode breadcrumbs)
      },
      outline = {
        layout = "float", -- Symbol outline
      },
    },
    keys = {
      { "<leader>cf", "<cmd>Lspsaga finder<cr>", desc = "LSP Finder" },
      { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Documentation" },
      { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto Definition" },
      { "gp", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition" },
      { "<leader>co", "<cmd>Lspsaga outline<cr>", desc = "Symbol Outline" },
      { "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Line Diagnostics" },
      { "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Prev Diagnostic" },
      { "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" },
    },
  },

  -- Inline type hints (like VSCode inlay hints)
  -- Already configured in lsp.lua, but ensure it's enabled

  -- Refactoring tools (extract function, inline variable, etc.)
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "<leader>re",
        function()
          require("refactoring").refactor("Extract Function")
        end,
        mode = "x",
        desc = "Extract Function",
      },
      {
        "<leader>rf",
        function()
          require("refactoring").refactor("Extract Function To File")
        end,
        mode = "x",
        desc = "Extract Function To File",
      },
      {
        "<leader>rv",
        function()
          require("refactoring").refactor("Extract Variable")
        end,
        mode = "x",
        desc = "Extract Variable",
      },
      {
        "<leader>ri",
        function()
          require("refactoring").refactor("Inline Variable")
        end,
        mode = { "n", "x" },
        desc = "Inline Variable",
      },
    },
    opts = {
      prompt_func_return_type = {
        go = false,
        java = false,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      prompt_func_param_type = {
        go = false,
        java = false,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      printf_statements = {},
      print_var_statements = {},
    },
  },

  -- AI-powered completions (GitHub Copilot alternative - optional)
  -- Uncomment if you want AI suggestions like VSCode Copilot
  -- {
  --   "Exafunction/codeium.nvim",
  --   event = "InsertEnter",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup({})
  --   end,
  -- },

  -- Treesitter-based text objects (already included in LazyVim by default)
  -- Uncomment below to customize text object keymaps if needed
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   opts = {
  --     textobjects = {
  --       select = {
  --         enable = true,
  --         lookahead = true,
  --         keymaps = {
  --           ["af"] = "@function.outer",
  --           ["if"] = "@function.inner",
  --           ["ac"] = "@class.outer",
  --           ["ic"] = "@class.inner",
  --         },
  --       },
  --     },
  --   },
  -- },

  -- Colorize color codes (like VSCode color decorator)
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue or red
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = "background", -- Set the display mode: foreground, background, virtualtext
        tailwind = true, -- Enable tailwind colors
        sass = { enable = true, parsers = { "css" } },
        virtualtext = "■",
      },
      buftypes = {},
    },
  },

  -- Dim unused code (like VSCode fade out)
  {
    "zbirenbaum/neodim",
    event = "LspAttach",
    opts = {
      alpha = 0.45,
      blend_color = "#000000",
      update_in_insert = {
        enable = true,
        delay = 100,
      },
      hide = {
        virtual_text = false,
        signs = false,
        underline = false,
      },
    },
  },
}
