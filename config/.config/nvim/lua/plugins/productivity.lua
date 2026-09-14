return {
  -- Better code navigation and refactoring
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon: Add file",
      },
      {
        "<leader>hh",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        desc = "Harpoon: Toggle menu",
      },
      {
        "<leader>h1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon: File 1",
      },
      {
        "<leader>h2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon: File 2",
      },
      {
        "<leader>h3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon: File 3",
      },
      {
        "<leader>h4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon: File 4",
      },
    },
    opts = {},
  },

  -- Disable LazyVim's mini.pairs to avoid conflict with nvim-autopairs
  { "nvim-mini/mini.pairs", enabled = false },

  -- Autopairs with treesitter support (better for JSX/TSX)
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        typescript = { "template_string" },
      },
    },
  },

  -- Auto close and rename HTML/JSX tags
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {
      filetypes = {
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "astro",
      },
    },
  },

  -- Disable LazyVim's mini.comment to avoid conflict
  { "nvim-mini/mini.comment", enabled = false },

  -- Better commenting with context awareness
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      local comment = require("Comment")
      local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

      comment.setup({
        pre_hook = ts_context_commentstring.create_pre_hook(),
      })
    end,
  },

  -- Better quickfix/location list
  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {},
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
  },

  -- Todo comments highlighting
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    keys = {
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
    },
  },

  -- Git integration (better than default)
  -- Note: Already configured in git.lua with more features
  -- This duplicate config is disabled to avoid conflicts

  -- Indent guides
  -- Note: Already configured in ui-vscode.lua with enhanced settings
  -- This duplicate is disabled to avoid conflicts

  -- Enhanced f/F/t/T motions
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },

  -- Better terminal integration
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
    },
    keys = {
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal float" },
      { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Terminal horizontal" },
      { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Terminal vertical" },
    },
  },

  -- Database UI for SQL work
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    keys = {
      { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle DBUI" },
    },
  },

  -- REST/HTTP client for API testing (Better alternative to rest.nvim)
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    keys = {
      { "<leader>rs", "<cmd>lua require('kulala').run()<cr>", desc = "Send HTTP request" },
      { "<leader>rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle HTTP response" },
      { "<leader>rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Previous HTTP request" },
      { "<leader>rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Next HTTP request" },
      { "<leader>rc", "<cmd>lua require('kulala').copy()<cr>", desc = "Copy as cURL" },
      { "<leader>ri", "<cmd>lua require('kulala').inspect()<cr>", desc = "Inspect HTTP request" },
    },
    opts = {
      default_view = "body",
      default_env = "dev",
      debug = false,
      kulala_core = {
        path = vim.fn.expand("~/.local/bin/kulala-core"),
      },
    },
  },

  -- Vitest test runner (in-gutter indicators & runner for TypeScript/Node)
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(
        opts.adapters,
        require("neotest-vitest")({
          filter_dir = function(name)
            return name ~= "node_modules"
          end,
        })
      )
    end,
    keys = {
      { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest Test" },
      { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run Test File" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Test Summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Test Output" },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Test Output Panel" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop Test" },
      { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch Test File" },
    },
  },

  -- Task runner & process manager (like VS Code NPM Scripts / tasks)
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerRun",
      "OverseerInfo",
      "OverseerTaskAction",
      "OverseerClearCache",
    },
    keys = {
      { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run Task (npm, build, etc.)" },
      { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle Task Panel" },
      { "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Task Action" },
      { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
    },
    opts = {},
  },

  -- Package version lens for package.json (outdated dependency badges & updates)
  {
    "vuki656/package-info.nvim",
    event = { "BufRead package.json", "BufNewFile package.json" },
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      autostart = true,
    },
    keys = {
      { "<leader>np", function() require("package-info").toggle() end, desc = "Toggle Package Versions" },
      { "<leader>nu", function() require("package-info").update() end, desc = "Update Package" },
      { "<leader>nd", function() require("package-info").delete() end, desc = "Delete Package" },
      { "<leader>ni", function() require("package-info").install() end, desc = "Install Package" },
      { "<leader>nv", function() require("package-info").change_version() end, desc = "Change Package Version" },
    },
  },
}
