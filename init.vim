call plug#begin()

Plug 'sbdchd/neoformat'

Plug 'nvim-lua/completion-nvim'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP Support
Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim',          " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional

" Autocompletion
Plug 'hrsh7th/nvim-cmp'     " Required
Plug 'hrsh7th/cmp-nvim-lsp' " Required
Plug 'L3MON4D3/LuaSnip'     " Required

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
""Plug 'mason-org/mason-registry/releases/tag/2023-08-10-uppity-thomas'
Plug 'w0rp/ale'

Plug 'folke/tokyonight.nvim'

Plug 'github/copilot.vim'

Plug 'https://tpope.io/vim/commentary.git'

Plug 'ryanoasis/vim-devicons'

Plug 'preservim/nerdtree'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'https://tpope.io/vim/fugitive.git'

Plug 'integralist/vim-mypy'
Plug 'https://github.com/integralist/vim-mypy'

Plug 'xiyaowong/transparent.nvim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'EdenEast/nightfox.nvim' " Vim-Plug

Plug 'morhetz/gruvbox'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/dccsillag/magma-nvim/commit/c31b19efd5533d33a275c604f04736118b6c3a2e', { 'do': ':UpdateRemotePlugins' }
Plug 'edluffy/hologram.nvim'

Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'frazrepo/vim-rainbow'
Plug 'mfussenegger/nvim-jdtls'

Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'
Plug 'folke/neodev.nvim'


Plug 'https://github.com/907th/vim-auto-save'

Plug 'jupyter-vim/jupyter-vim'
Plug 'kdheepak/lazygit.nvim'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" set shell=/bin/zsh\ -i
call plug#end()

" let g:rainbow_active = 1
lua << EOF

	require('config')

--require('after.plugin.telescope')
--require('telescope.health').check()  
-- Set up nvim-cmp.
EOF
