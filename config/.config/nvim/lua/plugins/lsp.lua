return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Diagnostic configuration
      diagnostics = {
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },

      -- Inlay hints (type annotations inline)
      inlay_hints = {
        enabled = true,
        exclude = { "vue" }, -- disable for vue if needed
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
      },
    },
  },
}
