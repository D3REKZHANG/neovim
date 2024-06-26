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
  Plug 'sainnhe/edge'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'mhartington/oceanic-next'
  Plug 'projekt0n/github-nvim-theme', { 'tag': 'v0.0.7' }
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
  Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }
  Plug 'savq/melange-nvim'

  " Utility
  "   Vimscript
  Plug 'junegunn/goyo.vim'
  " Plug 'psliwka/vim-smoothie'
  Plug 'dstein64/vim-startuptime'
  Plug 'voldikss/vim-floaterm'
  Plug 'tpope/vim-surround'
  " Plug 'Raimondi/delimitMate'
  Plug 'lervag/vimtex'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tpope/vim-obsession'

  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'

  Plug 'tpope/vim-fugitive'

  " Database
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-completion'
  Plug 'kristijanhusak/vim-dadbod-ui'

  "   Lua
  Plug 'nvim-lualine/lualine.nvim'
  " Plug 'kyazdani42/nvim-tree.lua'
  Plug 'nvim-neo-tree/neo-tree.nvim'
  Plug 'akinsho/nvim-bufferline.lua'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-ui-select.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'williamboman/mason.nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'hrsh7th/nvim-cmp'
  " Plug 'preservim/vim-markdown'
  Plug 'onsails/lspkind.nvim'
  Plug 'glepnir/dashboard-nvim'
  Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
  Plug 'famiu/bufdelete.nvim'
  Plug 'akinsho/git-conflict.nvim', { 'tag' : '*' }
  Plug 'f-person/git-blame.nvim'
  Plug 'sindrets/diffview.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'folke/zen-mode.nvim'
  Plug 'folke/noice.nvim'
  Plug 'numToStr/Comment.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'fgheng/winbar.nvim'
  Plug 'smjonas/inc-rename.nvim'
  " Plug 'jose-elias-alvarez/typescript.nvim'
  Plug 'stevearc/aerial.nvim'
  " Plug 'romgrk/barbar.nvim'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'VonHeikemen/fine-cmdline.nvim'
  Plug 'ggandor/leap.nvim'
  Plug 'dylanaraps/wal.vim'
  Plug 'xiyaowong/transparent.nvim'
  Plug 'luckasRanarison/tree-sitter-hypr'
  Plug 'jose-elias-alvarez/null-ls.nvim'
  Plug 'MunifTanjim/prettier.nvim'
  Plug 'rcarriga/nvim-notify'
  Plug 'kawre/leetcode.nvim'
  Plug 'nacro90/numb.nvim'
  Plug 'karb94/neoscroll.nvim'
  Plug 'ThePrimeagen/harpoon'
  Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

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
  set conceallevel=0

  let g:delimitMate_expand_cr = 1
  let g:delimitMate_expand_space = 1

  let g:floaterm_autoclose=1
  let g:floaterm_title=""
  let g:floaterm_wintype = 'normal'
  let g:floaterm_width = 0.7
  let g:floaterm_height = 0.7
  if has("win32")
    let g:floaterm_shell = 'powershell.exe -NoLogo'
  endif
  if has("linux")
    let g:floaterm_shell = 'zsh'
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
  set background=dark

  hi! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  hi! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
  hi! CmpItemKindFunction guibg=NONE guifg=#C586C0
  hi! CmpItemKindMethod guibg=NONE guifg=#C586C0
  hi! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
  hi! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
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
  require('mason').setup{}
  require("mason-lspconfig").setup()
  require("leetcode").setup({
    injector = { ---@type table<lc.lang, lc.inject>
        ["cpp"] = {
            before = { "#include <bits/stdc++.h>", "using namespace std;" },
            after = "int main() {}",
        }
    }
  })
  require("notify").setup({
    background_colour = "#000000",
  })
  require('numb').setup()
  require('neoscroll').setup({
    easing_function = "quadratic",
  })
  require("toggleterm").setup()
  -- require('leap').add_default_mappings{}

  require("user.cmp")
  require("user.lsp")
  require("user.dashboard")
  require("user.telescope")
  -- require("user.nvim-tree")
  require("user.neo-tree")
  require("user.bufferline")
  require("user.prettier")
  require("user.others")
EOF
" { left = '', right = ''
" { left = '', right = ''}
endif

" hi Normal guibg=NONE
" hi NormalFloat guibg=synIDattr(synIDtrans(hlID("Normal")), "bg#")
hi FloatBorder guibg=NONE
" hi NvimTreeWinSeparator guifg=#2e3440 guibg=#2e3440
" hi BufferLineFill guibg=#222730

" ---------------------------------------------------------------------------

" Leader Mapping ------------------------------------------------------------
let mapleader = " "

if exists('g:vscode')
  nnoremap <leader>w :call VSCodeCall('workbench.action.files.save')<CR>
else
  nnoremap <silent><leader>w :w<CR>
  nnoremap <silent><leader>t :FloatermToggle<CR>
  nnoremap <silent><leader><Tab> :BufferLinePick<CR>
  nnoremap <silent><leader>q :Bdelete<CR>
  nnoremap <silent><C-p> :Telescope find_files<CR>
  nnoremap <silent><leader>l :Telescope live_grep<CR>
  nnoremap <silent><C-b> :lua require("harpoon.ui").toggle_quick_menu()<CR>
  nnoremap <silent><leader>b :Telescope buffers<CR>
  nnoremap <silent><leader>e :Neotree toggle<CR>
  nnoremap <silent><leader>z <C-^>
  nnoremap <silent><leader>x :ClangdSwitchSourceHeader<CR>
  nnoremap <silent><C-m> :lua require("harpoon.mark").add_file()<CR>

  nnoremap <silent><leader>2 :call ToggleTabWidth()<CR>
  nnoremap <silent><leader>3 :call ToggleDiffview()<CR>
  nnoremap <silent><leader>4 :GitBlameToggle<CR>
  nnoremap <silent><leader>5 :set relativenumber!<CR>
  nnoremap <silent><leader>6 :call SetColorCol()<CR>
  nnoremap <silent><leader>7 :IndentBlanklineToggle<CR>
  nnoremap <silent><leader>8 :Gitsigns toggle_signs<CR>
  nnoremap <silent><leader>9 :Telescope colorscheme<CR>
  nnoremap <silent><leader>db :DBUIToggle<CR>
  nnoremap <silent><leader>a :AerialToggle<CR>
  nnoremap <leader>r :IncRename<space>

  nnoremap <leader>cc :GitConflictChoose
  nnoremap <leader>cn :GitConflictNextConflict<CR>
  nnoremap <leader>cN :GitConflictPrevConflict<CR>
endif

nnoremap <leader>v :lua require('telescope.builtin').find_files({cwd='~/.config/nvim/'})<CR>
nnoremap <leader>so :source $MYVIMRC<CR>
nnoremap <leader>p "0p
vnoremap <leader>p "0p
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>h :%s/
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
nnoremap <leader>T :set shiftwidth=

" g Mapping ----------------------------------------------------------------

nnoremap <silent>gp "+p
vnoremap <silent>gp "+p
inoremap <silent><C-v> <esc>"+pa

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

set cmdheight=1

" allow mouse control
set mouse=a

" nnoremap : <cmd>FineCmdline<CR>

" scrolling
" nnoremap <C-D> <cmd>call smoothie#do("25\<C-D>") <CR>
" vnoremap <C-D> <cmd>call smoothie#do("25\<C-D>") <CR>
" nnoremap <C-U> <cmd>call smoothie#do("25\<C-U>") <CR>
" vnoremap <C-U> <cmd>call smoothie#do("25\<C-U>") <CR>
nnoremap <C-E> 2<C-E> <CR>
nnoremap <C-Y> 2<C-Y> <CR>

nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>

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
nnoremap <C-Down> :m .+1<cr>==
nnoremap <C-Up> :m .-2<cr>==

" wrap movement across lines
set whichwrap+=>,l
set whichwrap+=<,h

" Misc
noremap 0 ^
noremap - $
noremap q %
noremap Q q
nnoremap Y y$

" Indent
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" nnoremap <Tab> >>
" nnoremap <S-Tab> <<
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
set textwidth=100
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

" For toggling DiffView.nvim
let s:diffview_open = 0

function! ToggleDiffview()
    if s:diffview_open
        DiffviewClose
        let s:diffview_open = 0
    else
        DiffviewOpen
        let s:diffview_open = 1
    endif
endfunction

" For toggling tab width
function! ToggleTabWidth()
    let x = &shiftwidth
    if x == 4
        set shiftwidth=2
        set tabstop=2
    else
        set shiftwidth=4
        set tabstop=4
    endif
endfunction

" lua vim.diagnostic.disable()
