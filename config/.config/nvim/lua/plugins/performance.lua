return {
  -- Optimize lazy.nvim performance
  {
    "folke/lazy.nvim",
    opts = {
      defaults = {
        lazy = true, -- Make all plugins lazy by default
      },
      performance = {
        cache = {
          enabled = true,
        },
        reset_packpath = true,
        rtp = {
          reset = true,
          paths = {},
          disabled_plugins = {
            "gzip",
            "matchit",
            "matchparen",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
          },
        },
      },
      change_detection = {
        enabled = true,
        notify = false, -- Don't notify on every config change
      },
    },
  },

  -- Note: filetype.nvim is no longer needed
  -- Neovim 0.8+ has built-in fast Lua-based filetype detection
  -- LazyVim already optimizes this automatically
}
