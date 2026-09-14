return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/schemastore.nvim",
    },
    opts = {
      -- Diagnostic configuration (native virtual_text disabled for tiny-inline-diagnostic to avoid Copilot collisions)
      diagnostics = {
        virtual_text = false,
        severity_sort = true,
      },

      -- Inlay hints (type annotations inline)
      inlay_hints = {
        enabled = true,
        exclude = { "vue" }, -- disable for vue if needed
      },

      -- CodeLens (inline reference counts, implementations, etc.)
      codelens = {
        enabled = true,
      },

      -- LSP Server configurations
      servers = {
        -- TypeScript/JavaScript (vtsls is the modern replacement for tsserver)
        vtsls = {
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
              referencesCodeLens = {
                enabled = true,
                showOnAllFunctions = true,
              },
              implementationsCodeLens = {
                enabled = true,
              },
            },
            javascript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
              referencesCodeLens = {
                enabled = true,
                showOnAllFunctions = true,
              },
              implementationsCodeLens = {
                enabled = true,
              },
            },
          },
        },

        -- Python
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic", -- or "strict" for more checks
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },

        -- TailwindCSS
        tailwindcss = {
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "svelte",
            "astro",
          },
        },

        -- JSON with schema support
        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },

        -- YAML with schema support
        yamlls = {
          settings = {
            yaml = {
              schemas = require("schemastore").yaml.schemas(),
              schemaStore = {
                enable = false, -- disable built-in, use schemastore
                url = "",
              },
            },
          },
        },

        -- HTML
        html = {
          filetypes = { "html", "htmldjango" },
        },

        -- CSS
        cssls = {
          settings = {
            css = {
              lint = {
                unknownAtRules = "ignore", -- for @tailwind
              },
            },
            scss = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },

        -- Prisma
        prismals = {},

        -- Docker
        dockerls = {},
        docker_compose_language_service = {},

        -- Bash
        bashls = {},

        -- SQL
        sqlls = {},

        -- Astro
        astro = {},

        -- Lua (for Neovim config)
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                globals = { "vim" }, -- recognize vim global
              },
            },
          },
        },

        -- Pytest language server: disable so Pyright and Ruff handle Python without symbol conflicts
        pytest_language_server = {
          enabled = false,
        },

        -- PHP: only enable if php binary exists on system
        phpactor = {
          enabled = vim.fn.executable("php") == 1,
        },
      },
    },
  },

  -- Human-readable TypeScript errors (like VS Code "Pretty TypeScript Errors")
  {
    "dmmulroy/ts-error-translator.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {},
  },

  -- Asynchronous project-wide TypeScript type checking (like VS Code Problems tab)
  {
    "dmmulroy/tsc.nvim",
    cmd = "TSC",
    keys = {
      { "<leader>tc", "<cmd>TSC<cr>", desc = "Type-Check Project (TSC)" },
    },
    opts = {
      auto_open_qflist = true,
      auto_close_qflist = false,
      enable_progress_notifications = true,
      flags = {
        noEmit = true,
      },
    },
  },

  -- Non-conflicting inline diagnostics (under-cursor, multi-line, Copilot-friendly)
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    cmd = "TinyInlineDiag",
    keys = {
      {
        "<leader>uD",
        "<cmd>TinyInlineDiag toggle<cr>",
        desc = "Toggle Inline Diagnostics Details",
      },
    },
    opts = {
      preset = "modern",
      transparent_bg = false,
      options = {
        show_source = {
          enabled = true,
        },
        use_icons_from_diagnostic = true,
        add_messages = {
          display_count = true,
        },
        multilines = {
          enabled = true,
          always_show = false,
        },
      },
    },
    config = function(_, opts)
      require("tiny-inline-diagnostic").setup(opts)
      vim.diagnostic.config({ virtual_text = false })
    end,
  },
}
