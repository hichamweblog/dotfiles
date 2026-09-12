-- Modern IDE coding experience (VSCode-like features)
-- This configures autocompletion, snippets, and intelligent code actions

return {
  -- blink.cmp - Modern completion engine (already included in LazyVim)
  -- Ghost text disabled here since Copilot handles inline suggestions
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = {
          enabled = false, -- Copilot handles ghost text / inline suggestions
        },
      },
      sources = {
        -- Add copilot as a completion source in the popup menu
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100, -- Pin Copilot suggestions to the top
            async = true,
          },
        },
      },
    },
  },

  -- GitHub Copilot — AI pair programmer
  -- After install: run :Copilot auth  to sign in
  {
    "github/copilot.vim",
    -- Managed by lazyvim.plugins.extras.ai.copilot extra
    -- Custom keybindings below override the defaults
    config = function()
      -- Disable default <Tab> mapping so we can manage it with smart priority
      vim.g.copilot_no_tab_map = true

      -- Smart <Tab>: Copilot ghost text -> snippet placeholder -> normal Tab/indent
      vim.keymap.set("i", "<Tab>", function()
        -- 1. If Copilot has a suggestion visible, accept it
        if vim.fn.exists("*copilot#GetDisplayedSuggestion") == 1 and vim.fn["copilot#GetDisplayedSuggestion"]().text ~= "" then
          return vim.fn["copilot#Accept"]()
        end

        -- 2. If inside an active snippet, jump forward to next placeholder
        if vim.snippet and vim.snippet.active({ direction = 1 }) then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
          return ""
        end

        local luasnip = package.loaded["luasnip"]
        if luasnip and luasnip.locally_jumpable(1) then
          luasnip.jump(1)
          return ""
        end

        -- 3. Otherwise, insert a regular tab / indent
        return "\t"
      end, {
        expr = true,
        silent = true,
        replace_keycodes = false,
        desc = "Copilot: Smart Tab accept",
      })

      -- Also keep Ctrl+J as an alternative accept shortcut
      vim.keymap.set("i", "<C-j>", 'copilot#Accept("")', {
        expr = true,
        replace_keycodes = false,
        desc = "Copilot: Accept suggestion (alternative)",
      })

      -- Cycle through alternative suggestions
      vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", { desc = "Copilot: Next suggestion" })
      vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", { desc = "Copilot: Previous suggestion" })

      -- Dismiss current suggestion
      vim.keymap.set("i", "<M-\\>", "<Plug>(copilot-dismiss)", { desc = "Copilot: Dismiss" })

      -- Accept only the next word (not the whole line)
      vim.keymap.set("i", "<C-Right>", "<Plug>(copilot-accept-word)", { desc = "Copilot: Accept word" })

      -- Accept only the next line
      vim.keymap.set("i", "<C-Down>", "<Plug>(copilot-accept-line)", { desc = "Copilot: Accept line" })

      -- Filetypes where Copilot should be disabled
      vim.g.copilot_filetypes = {
        ["*"] = true,        -- enabled for all by default
        TelescopePrompt = false,
        ["neo-tree"] = false,
        help = false,
        gitcommit = true,    -- useful for commit messages
        markdown = true,
      }
    end,
  },

  -- blink.cmp Copilot source (required for popup menu integration)
  {
    "giuxtaposition/blink-cmp-copilot",
    dependencies = { "github/copilot.vim", "saghen/blink.cmp" },
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

  -- Configure mini.snippets (active snippet engine in LazyVim)
  {
    "nvim-mini/mini.snippets",
    opts = function(_, opts)
      local mini_snippets = require("mini.snippets")
      local config_path = vim.fn.stdpath("config")
      opts.snippets = {
        mini_snippets.gen_loader.from_file(config_path .. "/snippets/global.json"),
        mini_snippets.gen_loader.from_lang({
          lang_patterns = {
            tsx = { "**/react*.json", "**/typescript.json", "**/typescriptreact.json", "**/tsx.json" },
            typescriptreact = { "**/react*.json", "**/typescript.json", "**/typescriptreact.json", "**/tsx.json" },
            jsx = { "**/react*.json", "**/javascript.json", "**/javascriptreact.json", "**/jsx.json" },
            javascriptreact = { "**/react*.json", "**/javascript.json", "**/javascriptreact.json", "**/jsx.json" },
            javascript = { "**/react*.json", "**/javascript.json", "**/javascriptreact.json", "**/jsx.json" },
            typescript = { "**/typescript.json", "**/typescriptreact.json", "**/tsx.json" },
            astro = { "**/astro.json", "**/typescript.json", "**/javascript.json" },
          },
        }),
      }
    end,
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
        sign = false,
        virtual_text = true,
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

  -- Colorize color codes (like VSCode color decorator - shows #fff as white background)
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true, -- #RGB hex codes (e.g. #fff)
        RRGGBB = true, -- #RRGGBB hex codes (e.g. #ffffff)
        names = false, -- "Name" codes like Blue or red
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        mode = "background", -- Display color as background of the text so #fff shows white
        tailwind = true, -- Enable tailwind colors
        sass = { enable = true, parsers = { "css" } },
        virtualtext = "■",
      },
      buftypes = {},
    },
    config = function(_, opts)
      require("colorizer").setup(opts)
      vim.schedule(function()
        pcall(require("colorizer").attach_to_buffer, 0)
      end)
    end,
  },

  -- Multi-cursor support (like VSCode Ctrl+D / multi-cursor)
  {
    "mg979/vim-visual-multi",
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      vim.g.VM_default_mappings = 1
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
        ["Find Subword Under"] = "<C-n>",
      }
    end,
  },

  -- Tailwind CSS tools (class concealing, color preview)
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      document_color = {
        enabled = true,
        kind = "inline",
        inline_symbol = "󰝤 ",
      },
      conceal = {
        enabled = true,
        symbol = "󱏿",
        highlight = {
          fg = "#38bdf8",
        },
      },
    },
    keys = {
      { "<leader>uT", "<cmd>TailwindConcealToggle<cr>", desc = "Toggle Tailwind Class Conceal" },
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
