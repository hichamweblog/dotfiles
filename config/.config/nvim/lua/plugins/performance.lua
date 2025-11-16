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

  -- Faster filetype detection
  {
    "nathom/filetype.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      overrides = {
        extensions = {
          h = "c",
          jsx = "javascriptreact",
          tsx = "typescriptreact",
        },
        complex = {
          ["%.env%..*"] = "sh", -- .env.local, .env.production, etc
        },
      },
    },
  },
}
