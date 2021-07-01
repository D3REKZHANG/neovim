" Vim Plug
call plug#begin('~/AppData/Local/nvim-data/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'rakr/vim-one'
    Plug 'wlangstroth/vim-racket'
    Plug 'lervag/vimtex'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ryanoasis/vim-devicons'
    Plug 'SirVer/ultisnips'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
    Plug 'junegunn/fzf.vim'
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'pprovost/vim-ps1'
    Plug 'voldikss/vim-floaterm'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
    Plug 'psliwka/vim-smoothie'
call plug#end()

" Plugins Config (in order)
let g:airline_powerline = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z='Ln %l% '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_alt_sep = '|'
set noshowmode

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" let g:NERDTreeSortOrder = map(range(0, 25), '"\\." . nr2char(char2nr("a") + v:val) . "[^.]*$"')

let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'sumatrapdf.exe'
let g:vimtex_view_general_options = '@pdf'

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
tnoremap <ESC> <C-\><C-n>:FloatermToggle<CR>

let g:highlightedyank_highlight_duration = 100
" ---------------------------------------------------------------------------

" Leader Mapping ------------------------------------------------------------
let mapleader = " "

nnoremap <Leader>w :w<CR>
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <Leader>v :vsp $MYVIMRC<CR>
nnoremap <Leader>vc :source $MYVIMRC<CR>
nnoremap <Leader>sc :call UltiSnips#RefreshSnippets()<CR>
nnoremap <Leader>go :Goyo<CR>
nnoremap <silent><Leader>x :nohl<CR>
nnoremap <Leader>F :Files ~<CR>
nnoremap <Leader>gf :GitFiles<CR>
nnoremap <Leader>z <C-^>
nnoremap <Leader>t :FloatermToggle<CR>
nnoremap <Leader>p "*p
nnoremap <Leader>y "+y
nnoremap <Leader>m ma
nnoremap <Leader>; `a
" --------------------------------------------------------------------------

set number relativenumber
" set textwidth=150

filetype plugin on

syntax on
colorscheme one
let g:airline_theme='base16_spacemacs'

set noswapfile
set incsearch
set inccommand=nosplit
set hidden
set scrolloff=1

set tabstop=4
set shiftwidth=4
set expandtab

set splitbelow
set splitright

" Mouse
set mouse=a

nnoremap <C-h> :%s/

" Transparent vim background
" hi Normal guibg=NONE ctermbg=NONE
" highlight clear cursorLineNR
" highlight clear LineNr
"

" tab control
nnoremap th :bp<CR>
nnoremap tl :bn<CR>

" hi TablineSel ctermfg=yellow ctermbg=black
" hi Tabline ctermfg=grey ctermbg=black
" hi TablineFill ctermbg=black

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

" Some ergonomic rebindings
" NOTE: m (set mark) moved to <Leader>m 
noremap n b
noremap N B
noremap m n
noremap M N
noremap q %
nnoremap Y y$

" wrap movement across lines
set whichwrap+=>,l
set whichwrap+=<,h

" Misc
nnoremap <up> /
noremap 0 ^

" Scrolling
nnoremap K L}
nnoremap L H{

" Unbind
map <PageDown> <nop>

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif

hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
