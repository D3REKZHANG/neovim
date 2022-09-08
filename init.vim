" Vim Plug
if !exists('g:vscode')
  call plug#begin('~/AppData/Local/nvim-data/plugged')
 
  Plug 'lewis6991/impatient.nvim'

  " Aesthetics
  Plug 'joshdick/onedark.vim'
  Plug 'mangeshrex/everblush.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'sainnhe/everforest'

  " Utility
  "   Vimscript
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
  Plug 'junegunn/fzf.vim'
  Plug 'psliwka/vim-smoothie'
  Plug 'dstein64/vim-startuptime'
  Plug 'voldikss/vim-floaterm'
  Plug 'tpope/vim-surround'
  Plug 'Raimondi/delimitMate'

  "   Lua
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'akinsho/nvim-bufferline.lua'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  "Plug 'numToStr/FTerm.nvim'
  "Plug 'akinsho/toggleterm.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'lervag/vimtex'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'onsails/lspkind.nvim'
  Plug 'glepnir/dashboard-nvim'
  Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
  call plug#end()
endif

" Plugins Config
if !exists('g:vscode')
  lua require('impatient').enable_profile()

  "let g:airline_section_z='%l%:%c% '
  "let airline#extensions#nvimlsp#enabled=0
  set noshowmode
  set hidden

  let g:tex_flavor = 'latex'

  if has("win32")
      let g:vimtex_view_general_viewer = 'sumatrapdf.exe'
      let g:vimtex_view_general_options = '@pdf'
  else
      let g:vimtex_view_general_viewer = 'zathura'
      let g:vimtex_view_general_options = '@pdf'
  endif
  let g:vimtex_quickfix_ignore_filters = [
    \'Overfull',
    \'Underfull',
    \]
  let g:vimtex_matchparen_enabled = 0

  let g:delimitMate_expand_cr = 1
  let g:delimitMate_expand_space = 1

  let g:floaterm_autoclose=1
  let g:floaterm_title=""
  let g:floaterm_wintype = 'normal'
  if has("win32")
    let g:floaterm_shell = 'powershell.exe -NoLogo'
  endif
  tnoremap <ESC> <C-\><C-n>:FloatermToggle<CR>

  let g:dashboard_default_executive = 'telescope'

lua << EOF
  require("bufferline").setup{
      options = {
          offsets = {{filetype = "NvimTree", text_align = "left"}},
      }
  }
  require("lualine").setup {
      options = {
          component_separators = { left = '', right = '/'},
          section_separators = { left = '', right = ''},
          globalstatus = true,
      }
  }
  require("nvim-tree").setup{}
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "javascript", "typescript", "python" },
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
  require("luasnip.loaders.from_snipmate").lazy_load()

  require("user.cmp")
  require("user.lsp")
  require("user.dashboard")
EOF
"{ left = '', right = ''
"{ left = '', right = ''}
endif

" ---------------------------------------------------------------------------

" Leader Mapping ------------------------------------------------------------
let mapleader = " "

if exists('g:vscode')
  nnoremap <leader>w <CMD>call VSCodeCall('workbench.action.files.save')<CR>
else
  nnoremap <leader>w :w<CR>
  nnoremap <silent><leader>t :FloatermToggle<CR>
  nnoremap <silent><leader><Tab> :BufferLinePick<CR>
  nnoremap <leader>q :bd<CR>
  nnoremap <silent><leader>f <cmd>Telescope git_files<cr>
  nnoremap <silent><C-p> <cmd>Telescope git_files<cr>
  nnoremap <silent><leader>e :NvimTreeToggle<CR>
  nnoremap <leader>c :call ToggleClear()<cr>
  nnoremap <silent><leader>z <C-^>
endif

nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>so :source $MYVIMRC<CR>
nnoremap <silent><leader>go :Goyo<CR>
nnoremap <leader>p "*p
nnoremap <leader>y "+y
nnoremap <leader>h :%s/
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

nnoremap <leader>T :set shiftwidth 

" --------------------------------------------------------------------------

set number relativenumber
" set textwidth=150

filetype plugin on

" Colour scheme
syntax on
if !exists('g:vscode')
  let g:nord_underline = 0
  let g:nord_italic = v:false
  colorscheme everforest
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
  highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
  highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
  highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
endif

" Sets
set noswapfile
set incsearch
set inccommand=nosplit
set scrolloff=1

set tabstop=2
set shiftwidth=2
set expandtab

set splitbelow
set splitright

set signcolumn=yes

" allow mouse control
set mouse=a

" buffer control
nnoremap th :bp<CR>
nnoremap tl :bn<CR>

" pane control
nnoremap zh <C-w>h
nnoremap zj <C-w>j
nnoremap zk <C-w>k
nnoremap zl <C-w>l

noremap j gj
noremap k gk

" auto-completion selection
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" move line up/down
nnoremap <C-j> :m .+1<cr>==
nnoremap <C-k> :m .-2<cr>==

" wrap movement across lines
set whichwrap+=>,l
set whichwrap+=<,h

" Misc
noremap 0 ^
noremap q %
noremap Q q
nnoremap Y y$
vnoremap <Tab> >gv
vnoremap > >gv
vnoremap < <gv

" Search
set nohlsearch nowrapscan
nnoremap <silent> <C-_> :set hlsearch!<cr>:set wrapscan!<cr>

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}
augroup END

if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif
