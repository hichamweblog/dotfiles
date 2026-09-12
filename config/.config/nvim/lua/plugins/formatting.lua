-- Filetype detection for GitHub Actions workflows
vim.filetype.add({
  pattern = {
    [".*/%.github/workflows/.*%.ya?ml"] = "yaml.ghaction",
  },
})

return {
  -- Configure conform.nvim for formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- JavaScript/TypeScript/React/Next/Astro
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        astro = { "prettier" },

        -- Styles
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },

        -- JSON/YAML
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },

        -- Markdown
        markdown = { "prettier" },
        ["markdown.mdx"] = { "prettier" },

        -- Python
        python = { "black" },

        -- SQL
        sql = { "sql_formatter" },

        -- Shell
        bash = { "shfmt" },
        sh = { "shfmt" },

        -- Lua (for Neovim config)
        lua = { "stylua" },

        -- Prisma
        prisma = { "prettier" },

        -- Docker
        dockerfile = { "prettier" },
      },

      -- Note: Format-on-save is handled automatically by LazyVim with toggle (<leader>uf)

      -- Customize formatters
      formatters = {
        prettier = {
          prepend_args = {
            "--single-quote",
            "--trailing-comma",
            "es5",
            "--print-width",
            "100",
            "--tab-width",
            "2",
          },
        },
        black = {
          prepend_args = {
            "--line-length",
            "100",
            "--fast",
          },
        },
        shfmt = {
          prepend_args = { "-i", "2", "-ci" }, -- 2 spaces, indent switch cases
        },
      },
    },
  },

  -- Configure nvim-lint for linting
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- Linters by filetype
      linters_by_ft = {
        -- JavaScript/TypeScript
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        astro = { "eslint_d" },

        -- Python - REMOVED pylint for now
        python = {}, -- Rely on LSP diagnostics instead

        -- Markdown
        markdown = { "markdownlint" },

        -- YAML & GitHub Actions CI/CD
        yaml = { "yamllint" },
        ["yaml.ghaction"] = { "actionlint" },

        -- Docker
        dockerfile = { "hadolint" },

        -- Bash
        bash = { "shellcheck" },
        sh = { "shellcheck" },

        -- SQL
        sql = { "sqlfluff" },
      },

      -- Configure specific linters
      linters = {
        eslint_d = {
          -- Only lint if .eslintrc exists
          condition = function(ctx)
            return vim.fs.find(
              { ".eslintrc", ".eslintrc.js", ".eslintrc.json", "eslint.config.js" },
              { path = ctx.filename, upward = true }
            )[1]
          end,
        },
      },
    },
  },

  -- Auto-install formatters and linters with Mason
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        -- Formatters
        "prettier", -- JS/TS/CSS/HTML/JSON/YAML/Markdown
        "black", -- Python
        "stylua", -- Lua
        "shfmt", -- Bash/Shell
        "sql-formatter", -- SQL

        -- Linters
        "actionlint", -- GitHub Actions workflows
        "eslint_d", -- JS/TS (faster than eslint)
        "pylint", -- Python
        "markdownlint", -- Markdown
        "hadolint", -- Dockerfile
        "shellcheck", -- Bash/Shell
        "sqlfluff", -- SQL
        "yamllint", -- YAML
      },
      auto_update = false,
      run_on_start = true,
    },
  },
}
