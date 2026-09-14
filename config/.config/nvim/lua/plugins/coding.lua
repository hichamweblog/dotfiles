-- Modern IDE coding experience (VSCode-like features)
-- This configures autocompletion, snippets, and intelligent code actions

return {
  -- blink.cmp - Modern completion engine (already included in LazyVim)
  -- Ghost text disabled here since Copilot handles inline suggestions
  {
    "saghen/blink.cmp",
    dependencies = { "fang2hou/blink-copilot" },
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
            module = "blink-copilot",
            score_offset = 100, -- Pin Copilot suggestions to the top
            async = true,
          },
        },
      },
    },
  },

  -- GitHub Copilot — AI pair programmer (pure Lua integration)
  -- After install: run :Copilot auth  to sign in
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = false,
        debounce = 75,
        keymap = {
          accept = false, -- Handled below by smart <Tab> and <C-j>
          accept_word = "<C-Right>",
          accept_line = "<C-Down>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<M-\\>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
        gitcommit = true,
        ["*"] = true,
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)

      -- Smart <Tab>: Copilot ghost text -> snippet placeholder -> normal Tab/indent
      vim.keymap.set("i", "<Tab>", function()
        -- 1. If Copilot has an inline ghost text suggestion visible, accept it
        local suggestion = require("copilot.suggestion")
        if suggestion.is_visible() then
          suggestion.accept()
          return ""
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
      vim.keymap.set("i", "<C-j>", function()
        if require("copilot.suggestion").is_visible() then
          require("copilot.suggestion").accept()
        end
      end, { desc = "Copilot: Accept suggestion (alternative)" })
    end,
  },

  -- Copilot Chat & Inline Prompts (VS Code Copilot Chat / Cursor-like AI experience)
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
      "CopilotChatStop",
      "CopilotChatReset",
      "CopilotChatExplain",
      "CopilotChatReview",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatDocs",
      "CopilotChatTests",
      "CopilotChatCommit",
      "CopilotChatModels",
      "CopilotChatPrompts",
      "CopilotChatAgents",
    },
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        model = "auto", -- Auto mode for GitHub Student Pack
        auto_insert_mode = true,
        headers = {
          user = "  " .. user .. " ",
          assistant = "  Copilot ",
          tool = "󰊳  Tool ",
        },
        window = {
          layout = "vertical", -- 'vertical', 'horizontal', 'float', 'replace'
          width = 0.4, -- 40% editor width, matching VS Code sidebar
          border = "rounded",
        },
      }
    end,
    keys = {
      -- Submit prompt inside chat buffer
      { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
      -- Group description for which-key
      { "<leader>a", "", desc = "+ai / copilot chat", mode = { "n", "v" } },
      -- Toggle Chat Sidebar
      {
        "<leader>aa",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle Copilot Chat Sidebar",
        mode = { "n", "v" },
      },
      -- Toggle Inline Floating Chat (Cursor style)
      {
        "<leader>ai",
        function()
          return require("CopilotChat").toggle({
            window = {
              layout = "float",
              width = 0.7,
              height = 0.5,
              border = "rounded",
              title = "   Copilot Inline Chat ",
            },
          })
        end,
        desc = "Toggle Inline Floating Chat",
        mode = { "n", "v" },
      },
      -- Reset / Clear chat
      {
        "<leader>ax",
        function()
          return require("CopilotChat").reset()
        end,
        desc = "Reset Chat History",
        mode = { "n", "v" },
      },
      -- Quick Inline Chat Prompt
      {
        "<leader>aq",
        function()
          vim.ui.input({
            prompt = "Quick Chat (Auto): ",
          }, function(input)
            if input and input ~= "" then
              require("CopilotChat").ask(input)
            end
          end)
        end,
        desc = "Quick Chat (Inline Prompt)",
        mode = { "n", "v" },
      },
      -- Open Actions / Prompts Picker (Explain, Review, Fix, Optimize, Tests, etc.)
      {
        "<leader>ap",
        function()
          require("CopilotChat").select_prompt()
        end,
        desc = "Prompt Actions (Picker)",
        mode = { "n", "v" },
      },
      -- Direct Shortcuts for common AI actions (like Cursor / VS Code)
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "Explain Selected Code", mode = { "n", "v" } },
      { "<leader>af", "<cmd>CopilotChatFix<cr>", desc = "Fix Bugs / Diagnostic Errors", mode = { "n", "v" } },
      { "<leader>ao", "<cmd>CopilotChatOptimize<cr>", desc = "Optimize Selected Code", mode = { "n", "v" } },
      { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "Generate Unit Tests", mode = { "n", "v" } },
      { "<leader>ad", "<cmd>CopilotChatDocs<cr>", desc = "Generate Documentation / JSDoc", mode = { "n", "v" } },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "Review Code Quality", mode = { "n", "v" } },
      { "<leader>am", "<cmd>CopilotChatCommit<cr>", desc = "Generate Git Commit Message", mode = { "n", "v" } },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      chat.setup(opts)
    end,
  },

  -- Auto Template Strings (like VS Code / Cursor: typing ${} in strings auto-changes quotes to backticks)
  {
    "axelvc/template-string.nvim",
    event = "InsertEnter",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "svelte",
      "python",
      "html",
    },
    opts = {
      filetypes = {
        "html",
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
        "vue",
        "svelte",
        "python",
      },
      jsx_brackets = true, -- add JSX brackets if inside JSX attribute
      remove_template_string = true, -- revert to normal quotes when ${} is removed
      restore_quotes = {
        normal = [[']],
        jsx = [["]],
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

  -- Disable duplicate lsp_signature (prevents huge intrusive signature popups while typing)
  {
    "ray-x/lsp_signature.nvim",
    enabled = false,
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
        enable = false,
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

      ----------------------------------------------------------------------
      -- Visual Graphical Color Picker (Click-to-pick like VSCode)
      ----------------------------------------------------------------------
      local function parse_zenity_color(str)
        str = vim.trim(str)
        local r, g, b = str:match("^rgb%s*%(%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*%)$")
        if r and g and b then
          return string.format("#%02x%02x%02x", tonumber(r), tonumber(g), tonumber(b))
        end
        local r2, g2, b2, a2 = str:match("^rgba%s*%(%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*,%s*([%d%.]+)%s*%)$")
        if r2 and g2 and b2 then
          local alpha = tonumber(a2) or 1
          if alpha < 1 then
            return string.format("rgba(%d, %d, %d, %s)", tonumber(r2), tonumber(g2), tonumber(b2), a2)
          else
            return string.format("#%02x%02x%02x", tonumber(r2), tonumber(g2), tonumber(b2))
          end
        end
        if str:match("^#[0-9a-fA-F]+$") then
          return str
        end
        return str
      end

      local function get_color_under_cursor()
        local line = vim.api.nvim_get_current_line()
        local cursor = vim.api.nvim_win_get_cursor(0)
        local row = cursor[1]
        local col = cursor[2] + 1

        -- 1. Check for #hex under cursor
        for start_col, hex, end_col in line:gmatch("()(#%x+)()") do
          if col >= start_col and col <= end_col then
            return hex, row, start_col, end_col - 1
          end
        end
        -- 2. Check for rgb(...) or rgba(...) under cursor
        for start_col, rgb_str, end_col in line:gmatch("()(rgba?%b())()") do
          if col >= start_col and col <= end_col then
            return rgb_str, row, start_col, end_col - 1
          end
        end
        -- 3. Check for hsl(...) or hsla(...) under cursor
        for start_col, hsl_str, end_col in line:gmatch("()(hsla?%b())()") do
          if col >= start_col and col <= end_col then
            return hsl_str, row, start_col, end_col - 1
          end
        end
        -- 4. Fallback: check if there is any color on the current line
        for start_col, hex, end_col in line:gmatch("()(#%x+)()") do
          return hex, row, start_col, end_col - 1
        end
        for start_col, rgb_str, end_col in line:gmatch("()(rgba?%b())()") do
          return rgb_str, row, start_col, end_col - 1
        end
        return nil, row, col, col
      end

      local function open_visual_color_picker()
        if vim.fn.executable("zenity") == 0 then
          vim.notify("zenity is not installed (required for visual color picker)", vim.log.levels.WARN)
          return
        end

        local current_color, row, start_col, end_col = get_color_under_cursor()
        local bufnr = vim.api.nvim_get_current_buf()

        local cmd = { "zenity", "--color-selection", "--show-palette" }
        if current_color and (current_color:match("^#%x+") or current_color:match("^rgba?")) then
          table.insert(cmd, "--color=" .. current_color)
        end

        vim.system(cmd, { text = true }, function(obj)
          if obj.code == 0 and obj.stdout and obj.stdout ~= "" then
            local selected_color = parse_zenity_color(obj.stdout)
            vim.schedule(function()
              if not vim.api.nvim_buf_is_valid(bufnr) then
                return
              end
              local current_line = vim.api.nvim_buf_get_lines(bufnr, row - 1, row, false)[1] or ""
              if current_color and start_col and end_col and start_col <= end_col then
                local new_line = current_line:sub(1, start_col - 1) .. selected_color .. current_line:sub(end_col + 1)
                vim.api.nvim_buf_set_lines(bufnr, row - 1, row, false, { new_line })
              else
                local cursor = vim.api.nvim_win_get_cursor(0)
                local c = cursor[2]
                local new_line = current_line:sub(1, c) .. selected_color .. current_line:sub(c + 1)
                vim.api.nvim_buf_set_lines(bufnr, row - 1, row, false, { new_line })
              end
            end)
          end
        end)
      end

      -- User command
      vim.api.nvim_create_user_command("ColorPicker", open_visual_color_picker, { desc = "Open Visual Color Picker" })

      -- Keybinding: <leader>cp
      vim.keymap.set("n", "<leader>cp", open_visual_color_picker, { desc = "Color Picker (Visual GUI)" })

      -- Mouse click: Ctrl + Click on any color code
      vim.keymap.set({ "n", "i" }, "<C-LeftMouse>", function()
        local mouse = vim.fn.getmousepos()
        if mouse.winid > 0 and mouse.line > 0 then
          vim.api.nvim_set_current_win(mouse.winid)
          vim.api.nvim_win_set_cursor(mouse.winid, { mouse.line, math.max(0, mouse.column - 1) })
          open_visual_color_picker()
        end
      end, { desc = "Ctrl+Click color to open visual color picker" })

      -- Mouse double-click on any color code
      vim.keymap.set("n", "<2-LeftMouse>", function()
        local mouse = vim.fn.getmousepos()
        if mouse.winid > 0 and mouse.line > 0 then
          vim.api.nvim_set_current_win(mouse.winid)
          vim.api.nvim_win_set_cursor(mouse.winid, { mouse.line, math.max(0, mouse.column - 1) })
          local color = get_color_under_cursor()
          if color then
            open_visual_color_picker()
            return
          end
        end
        vim.cmd("normal! viw")
      end, { desc = "Double-click color to open visual color picker" })
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
        enabled = false, -- classes stay visible; toggle anytime with <leader>uT
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
