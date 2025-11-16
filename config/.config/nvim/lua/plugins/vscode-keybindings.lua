-- VSCode-inspired keybindings - DISABLED
-- Using LazyVim default keybindings instead
-- This file is kept for reference but all plugins are disabled

-- stylua: ignore
if true then return {} end

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
          presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
          },
        },
        spec = {
          {
            mode = { "n", "v" },
            { "<leader>b", group = "buffer" },
            { "<leader>c", group = "code" },
            { "<leader>d", group = "debug" },
            { "<leader>f", group = "file/find" },
            { "<leader>g", group = "git" },
            { "<leader>h", group = "hunk/harpoon" },
            { "<leader>q", group = "quit/session" },
            { "<leader>r", group = "refactor/replace" },
            { "<leader>s", group = "search" },
            { "<leader>t", group = "terminal/test" },
            { "<leader>u", group = "ui" },
            { "<leader>w", group = "window" },
            { "<leader>x", group = "diagnostics/quickfix" },
            { "[", group = "prev" },
            { "]", group = "next" },
            { "g", group = "goto" },
            { "z", group = "fold" },
          },
        },
      }
    end,
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
    end,
  },

  -- Add VSCode-inspired keybindings (non-conflicting)
  {
    "LazyVim/LazyVim",
    opts = function()
      local map = vim.keymap.set

      -- SAFE VSCode-like keybindings that don't conflict with Neovim defaults

      -- File operations (Ctrl+P is safe, not used by Neovim)
      map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find Files (Ctrl+P)" })

      -- Move lines (Alt+Up/Down - safe, not Neovim defaults)
      map("n", "<A-Down>", ":m .+1<cr>==", { desc = "Move Line Down" })
      map("n", "<A-Up>", ":m .-2<cr>==", { desc = "Move Line Up" })
      map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move Selection Down" })
      map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move Selection Up" })

      -- Duplicate line (Alt+Shift - safe)
      map("n", "<A-S-Down>", "yyp", { desc = "Duplicate Line Down" })
      map("n", "<A-S-Up>", "yyP", { desc = "Duplicate Line Up" })

      -- Function keys (safe - F2, F8, F12 not used by Neovim)
      map("n", "<F2>", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { expr = true, desc = "Rename Symbol (F2)" })

      map("n", "<F8>", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Next Diagnostic (F8)" })
      map("n", "<S-F8>", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Prev Diagnostic (Shift+F8)" })

      map("n", "<F12>", "<cmd>Lspsaga goto_definition<cr>", { desc = "Go to Definition (F12)" })
      map("n", "<A-F12>", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek Definition (Alt+F12)" })
      map("n", "<S-F12>", "<cmd>Telescope lsp_references<cr>", { desc = "References (Shift+F12)" })

      -- Format (Shift+Alt+F - safe)
      map("n", "<S-A-f>", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, { desc = "Format Document (Shift+Alt+F)" })

      -- Note: The following VSCode keybindings are INTENTIONALLY EXCLUDED to avoid conflicts:
      -- - Ctrl+B (conflicts with Vim page up)
      -- - Ctrl+D (conflicts with Vim scroll down)
      -- - Ctrl+W (conflicts with window commands)
      -- - Ctrl+G (conflicts with file info)
      -- - Ctrl+/ (terminal-dependent, may not work)
      --
      -- Use LazyVim defaults instead:
      -- - <leader>e or <leader>fe for file explorer
      -- - <leader><space> for file finder
      -- - <leader>/ for grep search
      -- - gcc for comment toggle
      -- - <leader>bd for close buffer
    end,
  },
}
