-- React Native & Expo LSP and tooling support
return {
  -- Ensure Mason installs RN-relevant tools
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "vtsls",           -- TypeScript (handles RN TS files)
        "eslint-lsp",      -- ESLint LSP (better for RN than eslint_d in some setups)
        "prettier",
        "json-lsp",
      })
    end,
  },

  -- Treesitter: ensure JSX/TSX parsers are installed
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "javascript",
        "typescript",
        "json",
        "json5",    -- used in React Native metro config
        "graphql",  -- used in some RN apps
      })
    end,
  },

  -- Detect .jsx/.tsx files in React Native correctly
  {
    "nvim-lspconfig",
    opts = function(_, opts)
      -- Ensure vtsls handles .jsx/.tsx RN files
      opts.servers = opts.servers or {}
      opts.servers.vtsls = opts.servers.vtsls or {}
    end,
  },

  -- File associations for React Native specific files
  vim.filetype.add({
    extension = {
      env = "sh",           -- .env files
    },
    filename = {
      ["metro.config.js"] = "javascript",
      ["metro.config.ts"] = "typescript",
      ["app.json"] = "json",
      ["eas.json"] = "json",
      ["expo-env.d.ts"] = "typescript",
    },
    pattern = {
      [".env.*"] = "sh",
    },
  }),
}
