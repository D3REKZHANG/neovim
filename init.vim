" Vim Plug
if !exists('g:vscode')
  call plug#begin('~/AppData/Local/nvim-data/plugged')
 
  Plug 'lewis6991/impatient.nvim'

  " Colourschemes
  Plug 'joshdick/onedark.vim'
  Plug 'mangeshrex/everblush.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'AhmedAbdulrahman/vim-aylin'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'sainnhe/everforest'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
  Plug 'NLKNguyen/papercolor-theme'

  " Utility
  "   Vimscript
  Plug 'junegunn/goyo.vim'
  Plug 'psliwka/vim-smoothie'
  Plug 'dstein64/vim-startuptime'
  Plug 'voldikss/vim-floaterm'
  Plug 'tpope/vim-surround'
  Plug 'Raimondi/delimitMate'
  Plug 'lervag/vimtex'
  Plug 'turbio/bracey.vim'

  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'

  Plug 'tpope/vim-fugitive'

  " Database
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-completion'
  Plug 'kristijanhusak/vim-dadbod-ui'

  "   Lua
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'akinsho/nvim-bufferline.lua'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-ui-select.nvim'
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
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'onsails/lspkind.nvim'
  Plug 'glepnir/dashboard-nvim'
  Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
  Plug 'famiu/bufdelete.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'akinsho/git-conflict.nvim', { 'tag' : '*' }
  Plug 'f-person/git-blame.nvim'
  Plug 'sindrets/diffview.nvim'
  Plug 'folke/zen-mode.nvim'
  Plug 'numToStr/Comment.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'fgheng/winbar.nvim'
  Plug 'SmiteshP/nvim-navic'
  Plug 'smjonas/inc-rename.nvim'
  Plug 'jose-elias-alvarez/typescript.nvim'
  Plug 'stevearc/aerial.nvim'

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

  let g:smoothie_no_default_mappings = 1

  " Include text after begin and end markers
  let g:conflict_marker_begin = '^<<<<<<< .*$'
  let g:conflict_marker_end   = '^>>>>>>> .*$'

  let g:gitblame_enabled = 0

  " Colour scheme
  syntax on
  let g:nord_underline = 0
  let g:nord_italic = v:false
  let g:everforest_disable_italic_comment = 1
  let g:everforest_background = "hard"
  colorscheme onenord

  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
  highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
  highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
  highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
  hi hlgroup gui=underline
  hi NvimTreeRootFolder guifg=FG 

lua << EOF
  require("luasnip.loaders.from_snipmate").lazy_load()
  require("Comment").setup{}
  require('gitsigns').setup()
  require('lsp_signature').setup()
  require("trouble").setup{}
  require('git-conflict').setup{}
  require('inc_rename').setup{}
  require('typescript').setup{}

  require("user.cmp")
  require("user.lsp")
  require("user.dashboard")
  require("user.telescope")
  require("user.nvim-tree")
  require("user.others")
EOF
"{ left = '', right = ''
"{ left = '', right = ''}
endif

hi NormalFloat guibg=synIDattr(synIDtrans(hlID("Normal")), "bg#")
hi FloatBorder guibg=synIDattr(synIDtrans(hlID("Normal")), "bg#")
hi NvimTreeWinSeparator guifg=#2e3440 guibg=#2e3440

" ---------------------------------------------------------------------------

" Leader Mapping ------------------------------------------------------------
let mapleader = " "

if exists('g:vscode')
  nnoremap <leader>w :call VSCodeCall('workbench.action.files.save')<CR>
else
  nnoremap <leader>w :w<CR>
  nnoremap <silent><leader>t :FloatermToggle<CR>
  nnoremap <silent><leader><Tab> :BufferLinePick<CR>
  nnoremap <silent><leader>q :Bdelete<CR>
  nnoremap <silent><C-p> :Telescope find_files<CR>
  nnoremap <silent><C-l> :Telescope live_grep<CR>
  nnoremap <silent><leader>b :Telescope buffers<CR>
  nnoremap <silent><leader>e :NvimTreeToggle<CR>
  nnoremap <silent><leader>z <C-^>

  nnoremap <silent><leader>4 :call SetColorCol()<CR>
  nnoremap <silent><leader>5 :ZenMode<CR>
  nnoremap <silent><leader>8 :IndentBlanklineToggle<CR>
  nnoremap <silent><leader>9 :Telescope colorscheme<CR>
  nnoremap <silent><leader>7 :Gitsigns toggle_signs<CR>
  nnoremap <silent><leader>6 :GitBlameToggle<CR>
  nnoremap <silent><leader>db :DBUIToggle<CR>
  nnoremap <silent><leader>a :AerialToggle!<CR>
  nnoremap <leader>r :IncRename<space>

  nnoremap <leader>cc :GitConflictChoose
  nnoremap <leader>cn :GitConflictNextConflict<CR>
  nnoremap <leader>cN :GitConflictPrevConflict<CR>
endif

nnoremap <leader>v :lua require('telescope.builtin').find_files({cwd='~/.config/nvim/'})<CR>
nnoremap <leader>so :source $MYVIMRC<CR>
nnoremap <leader>p "0p
nnoremap <leader>y "+y
nnoremap <leader>h :%s/
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
nnoremap <leader>T :set shiftwidth 

" g Mapping ----------------------------------------------------------------

nnoremap <silent>gp "*p

" --------------------------------------------------------------------------

set number relativenumber
" set textwidth=150

filetype plugin on

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

" scrolling
nnoremap <C-D> <cmd>call smoothie#do("\<C-D>") <CR>
vnoremap <C-D> <cmd>call smoothie#do("\<C-D>") <CR>
nnoremap <C-U> <cmd>call smoothie#do("\<C-U>") <CR>
vnoremap <C-U> <cmd>call smoothie#do("\<C-U>") <CR>
nnoremap <C-E> 2<C-E> <CR>
nnoremap <C-Y> 2<C-Y> <CR>

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

" Indent
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap > >gv
vnoremap < <gv

" Search
set nohlsearch nowrapscan
nnoremap <silent><C-/> :set hlsearch!<cr>:set wrapscan!<cr>
nnoremap <silent><C-_> :set hlsearch!<cr>:set wrapscan!<cr>

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

" Functions
function! SetColorCol()
  if &colorcolumn==""
    set colorcolumn=100
  else
    set colorcolumn=""
  endif
endfunction

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
