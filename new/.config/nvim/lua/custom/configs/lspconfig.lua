local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "ts_ls", "pest_ls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local HOME = vim.fn.expand('$HOME')
lspconfig.jdtls.setup{
	cmd = { HOME .. "/Downloads/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls",},
	on_attach = on_attach,
	capabilities = capabilities,
}

lspconfig.clangd.setup({
  on_attach = function(_, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,
	capabilities = capabilities,
  filetypes = {
    "c",
    "cpp",
    "h",
    "hpp",
  },
	settings = {
		inlayHints = {
			deducedTypes = { enabled = true },
			-- enumMemberValues = { enabled = true },
      -- functionLikeReturnTypes = { enabled = true },
      parameterNames = { enabled = true },
      parameterTypes = { enabled = true },
      propertyDeclarationTypes = { enabled = true },
      variableTypes = { enabled = true },
		}
	}

})

lspconfig.rust_analyzer.setup({
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end,
	settings = {
    ["rust-analyzer"] = {
      imports = {
				preferNoStd = true,
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
				allFeatures = true,
      },
	    procMacro = {
        enable = true
      },
			assist = {
				termSearch = {
					borrowcheck = true,
				}
			},
			check = {
				features = "all",
			},
			diagnostics = {
				experimental = {
					enable = true,
				},
			},
    }
  }
})

lspconfig.serve_d.setup({
	settings = {
		d = {
			stdlibPath = {"/usr/include/dlang/dmd"},
			ccdbPath = "compile_commands.json",
			argumentSnippets = true,
			enableFallbackHighlight = true,
			enableLinting = true,
			enableStaticLinting = true,
			enableDubLinting = false,
			neverUseDub = true,
		},
		dfmt = {
			alignSwitchStatements = true,
			braceStyle = "otbs",
			spaceAfterCast = false,
		},
		dscanner = {
			ignoredKeys = {""},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.bashls.setup{}

require('lsp_lines')
vim.keymap.set('n', '<Leader>l', require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
vim.diagnostic.config({ virtual_lines = { only_current_line = true }})
--
-- lspconfig.pyright.setup { blabla}
