" Vim Plug
call plug#begin('~/AppData/Local/nvim-data/plugged')
    " Aesthetics
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Plug 'nvim-lualine/lualine.nvim'
    Plug 'rakr/vim-one'
    Plug 'arcticicestudio/nord-vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'

    " Utility
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jiangmiao/auto-pairs'
    Plug 'SirVer/ultisnips'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
    Plug 'junegunn/fzf.vim'
    Plug 'psliwka/vim-smoothie'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'akinsho/nvim-bufferline.lua'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'dstein64/vim-startuptime'

    " Syntax
    Plug 'wlangstroth/vim-racket'
    Plug 'lervag/vimtex'
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'pprovost/vim-ps1'
    Plug 'voldikss/vim-floaterm'
    Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
call plug#end()

" Plugins Config (in order)

let g:airline_section_z='%l%:%c% '
let airline#extensions#nvimlsp#enabled=0
set noshowmode
set hidden

let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'sumatrapdf.exe'
let g:vimtex_view_general_options = '@pdf'
let g:vimtex_quickfix_ignore_filters = [
  \'Overfull',
  \]
let g:vimtex_matchparen_enabled = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

let g:UltiSnipsEditSplit="vertical"

if has("win32")
    source ~/AppData/Local/nvim/config/coc.vim
else
    source ~/.config/nvim/config/coc.vim
endif

let g:floaterm_autoclose=1
let g:floaterm_title=""
let g:floaterm_wintype = 'normal'
let g:floaterm_shell = 'powershell.exe -NoLogo'
tnoremap <ESC> <C-\><C-n>:FloatermToggle<CR>



lua << EOF
require("bufferline").setup{
    options = {
        offsets = {{filetype = "NvimTree", text_align = "left"}},
    }
}
require'lualine'.setup{
    options = { theme='nord' },
    sections = {
        lualine_a = { {'diagnostics', sources = {'coc'}} }
    }
}

EOF


" ---------------------------------------------------------------------------

" Leader Mapping ------------------------------------------------------------
let mapleader = " "

nnoremap <Leader>w :w<CR>
nnoremap <Leader>v :e $MYVIMRC<CR>
nnoremap <Leader>so :source $MYVIMRC<CR>
nnoremap <silent><Leader>go :Goyo<CR>
nnoremap <silent><Leader>x :nohl<CR>
nnoremap <silent><Leader>z <C-^>
nnoremap <silent><Leader>t :FloatermToggle<CR>
nnoremap <Leader>p "*p
nnoremap <Leader>y "+y
nnoremap <silent><Leader><Tab> :BufferLinePick<CR>
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>h :%s/
nnoremap <silent><Leader>f <cmd>Telescope git_files<cr>
nnoremap <silent><Leader>F :NvimTreeToggle<CR>
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>
nnoremap <Leader>c :call ToggleClear()<cr>

" --------------------------------------------------------------------------

set number relativenumber
" set textwidth=150

filetype plugin on

" Colour scheme
syntax on
let g:nord_underline = 0
colorscheme one
"let g:airline_theme='base16_spacemacs'

set noswapfile
set incsearch
set inccommand=nosplit
set scrolloff=1

set tabstop=4
set shiftwidth=4
set expandtab

set splitbelow
set splitright
" Mouse
set mouse=a

let g:bg_clear = 1

" Transparent vim background
function! ToggleClear()
    if g:bg_clear
        let g:bg_clear = 0
        hi! EndOfBuffer ctermbg=16 ctermfg=16 guibg=#282c34 guifg=#282c34
        hi Normal ctermfg=145 ctermbg=16 guifg=#abb2bf guibg=#282c34
        " hi LineNr ctermfg=59 guifg=#4b5263
        "hi cursorLineNr ctermfg=145 ctermbg=16 guifg=#abb2bf guibg=#2c323c
    else
        let g:bg_clear = 1
        hi Normal guibg=NONE ctermbg=NONE
        hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=#282c34
        " hi clear cursorLineNR
        " hi clear LineNr
    endif
endfunction

call ToggleClear()

" tab control
nnoremap th :bp<CR>
nnoremap tl :bn<CR>

" Pane control
nnoremap zh <C-w>h
nnoremap zj <C-w>j
nnoremap zk <C-w>k
nnoremap zl <C-w>l

noremap j gj
noremap k gk

" auto-completion selection
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" wrap movement across lines
set whichwrap+=>,l
set whichwrap+=<,h

" Misc
noremap 0 ^
noremap q %
nnoremap Y y$

" Search
set nohlsearch nowrapscan
nnoremap <silent> <c-_> :set hlsearch!<cr>

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
