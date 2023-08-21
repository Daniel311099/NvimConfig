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


call plug#end()

lua <<EOF

  require('config')

  --require('after.plugin.telescope')
  --require('telescope.health').check()  
  -- Set up nvim-cmp.
EOF
