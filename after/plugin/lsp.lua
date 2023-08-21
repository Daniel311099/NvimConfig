local lsp = require('lsp-zero')
lsp.preset({})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
	mapping = {
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({select = true}),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),
		--hide autocomplete menu
		['<C-e>'] = cmp.mapping.close(),
	}
})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	-- lsp.default_keymaps({buffer = bufnr})
end)
-- (Optional) Configure lua language server for neovim



-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
-- set mypy as a linting server
local lspconfig = require("lspconfig")
lspconfig.pyright.setup {
	-- on_attach = custom_attach,
	settings = {
		pyright = {
			plugins = {
				-- formatter options
				black = { enabled = true },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
				-- linter options
				pylint = { enabled = true, executable = "pylint" },
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				-- type checker
				pylsp_mypy = { enabled = true },
				-- auto-completion options
				jedi_completion = { fuzzy = true },
				-- import sorting
				pyls_isort = { enabled = true },
			},
		},
	},
}
lsp.setup()
