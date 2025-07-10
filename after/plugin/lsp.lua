local lsp = require('lsp-zero')
-- local lsp = require('lspconfig')
lsp.preset({})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
-- local cmp_action = require('lspconfig').cmp_action()

cmp.setup{
	sources = {
		-- { name = 'treesitter' },
		-- { name = 'buffer' },
		-- { name = 'path' },
		-- { name = 'cmdline' },
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' },
		-- { name = 'tsserver' },
		-- { name = 'pyright' },
		-- { name = 'lsp-zero' }
		-- Add other sources as needed
	},
	mapping = {
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({select = true}),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),
		-- ['<Down>'] = cmp.mapping.select_next_item(), {'i', 's'},
		-- ['<Up>'] = cmp.mapping.select_prev_item(), {'i', 's'},
		['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert}),
		['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

		-- Navigate between snippet placeholder
		['<C-j>'] = cmp_action.luasnip_jump_forward(),
		['<C-k>'] = cmp_action.luasnip_jump_backward(),
		--hide autocomplete menu
		['<C-e>'] = cmp.mapping.close(),
	}, { "i", "s" },
}


lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)
-- (Optional) Configure lua language server for neovim


-- add for c++ lsp
-- lspconfig.clangd.setup({
-- 	on_attach = custom_attach,
-- 	capabilities = lsp.capabilities,
-- 	flags = {
-- 		debounce_text_changes = 150,
-- 	},
-- })


require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
-- set mypy as a linting server
local lspconfig = require("lspconfig")
lspconfig.pyright.setup {
	-- on_attach = custom_attach,
	settings = {
		pyright = {
			plugins = {
				-- formatter options
				-- black = { enabled = true },
				-- autopep8 = { enabled = false },
				-- yapf = { enabled = false },
				-- linter options
				-- pylint = { enabled = true, executable = "pylint" },
				-- pyflakes = { enabled = false },
				-- pycodestyle = { enabled = false },
				-- type checker
				-- pylsp_mypy = { enabled = true },
				mypy = { enabled = true },
				-- auto-completion options
				jedi_completion = { fuzzy = true },
				-- import sorting
				pyls_isort = { enabled = true },
			},
		},
	},
}

-- lspconfig.mypy.setup {
-- 	on_attach = custom_attach,
	
-- 	settings = {
-- 		pyright = {
-- 			plugins = {
-- 				-- formatter options
-- 				-- black = { enabled = true },
-- 				-- autopep8 = { enabled = false },
-- 				-- yapf = { enabled = false },
-- 				-- linter options
-- 				-- pylint = { enabled = true, executable = "pylint" },
-- 				-- pyflakes = { enabled = false },
-- 				-- pycodestyle = { enabled = false },
-- 				-- type checker
-- 				pylsp_mypy = { enabled = true },
-- 				mypy = { enabled = true },
-- 				-- auto-completion options
-- 				-- jedi_completion = { fuzzy = true },
-- 				-- import sorting
-- 				-- pyls_isort = { enabled = true },
-- 			},
-- 		},
-- 	},
-- }

-- lspconfig.tsserver.setup({})
-- lspconfig.es_lint.setup({})
-- setup lua language server 
-- lspconfig.lua_ls.setup({})
-- lspconfig.jtdls.setup {}

-- lspconfig.clang.setup{}

-- local prettier = require("prettier")

-- Enable Prettier for supported filetypes
-- prettier.setup {
--   filetype = {
--     javascript = { "prettier" },
--     javascriptreact = { "prettier" },
--     typescript = { "prettier" },
--     typescriptreact = { "prettier" },
--     html = { "prettier" },
--     json = { "prettier" },
--     markdown = { "prettier" },
--   },
-- }


-- require('prettier').setup({
-- 	-- Specify the file types you want to format with Prettier
-- 	filetypes = { "javascript", "typescript", "jsx", "typescriptreact", "json", "css", "scss", "markdown" },
-- 	-- If you want to use eslint_d for javascript and typescript
-- 	-- Specify
--
-- })

-- Enable Prettier on save
--vim.api.nvim_exec([[
--autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.css,*.scss,*.md :Prettier
-- ]], false)


-- require('plenary.reload').reload_module('lspconfig', true)
-- require('lspconfig').mojo.setup{}
-- vim.cmd('packadd mojo.vim')
-- require('mojo.lsp').setup()


local mojo_config = {
	filetypes = { "mojo" },
	on_attach = function(client)
		-- Define custom key mappings and other client-specific settings
	end,
	init_options = {
		-- Custom initialization options for the Mojo LSP
	},
	settings = {
		-- Custom settings for the Mojo LSP
	},
	root_dir = function(fname)
		-- Define how to find the root directory for Mojo projects
		return vim.fn.getcwd()
	end,
}
-- lspconfig.mojo.setup {mojo_config}
-- vim.api.nvim_create_autocmd("BufNewFile,BufRead", { "*.🔥" }, function()
	--   if vim.bo.filetype ~= "mojo" then
	--     vim.bo.filetype = "mojo"
	--   end
	-- end)

	-- Customize Mojo-specific buffer options (if needed)
	-- vim.api.nvim_create_autocmd("FileType", { "mojo" }, function()
	-- 	vim.bo.expandtab = true
	-- 	vim.bo.shiftwidth = 4
	-- 	vim.bo.softtabstop = 4
	-- end)



	lspconfig.marksman.setup {}

	lsp.skip_server_setup({'jdtls'})
	lsp.setup()
