" Vim Plug
call plug#begin('~/AppData/Local/nvim-data/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'patstockwell/vim-monokai-tasty' 
    Plug 'crusoexia/vim-monokai'
    Plug 'rakr/vim-one'
    Plug 'wlangstroth/vim-racket'
    Plug 'lervag/vimtex'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ryanoasis/vim-devicons'
    Plug 'SirVer/ultisnips'
    Plug 'junegunn/goyo.vim'
call plug#end()

" Plugins Config (in order) 
let g:airline_powerline_fonts = 1
set noshowmode

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeSortOrder = map(range(0, 25), '"\\." . nr2char(char2nr("a") + v:val) . "[^.]*$"')

let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'sumatrapdf.exe'
let g:vimtex_view_general_options = '@pdf'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

let g:UltiSnipsEditSplit="vertical"
" ---------------------------------------------------------------------------

" Leader Mapping ------------------------------------------------------------
let mapleader = " "

nnoremap <Leader>w :w<CR>
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <Leader>v :vsp $MYVIMRC<CR>
nnoremap <Leader>vc :source $MYVIMRC<CR>
nnoremap <Leader>sc :call UltiSnips#RefreshSnippets()<CR>
nnoremap <Leader>go :Goyo<CR>
nnoremap <Leader>al :AirlineToggle<CR>
nnoremap <Leader>x /yeetdab<CR>
nnoremap <Leader><space> i<space><esc>
nnoremap <Leader>y "*y
" --------------------------------------------------------------------------

set number relativenumber
set textwidth=150

filetype plugin on

syntax on
colorscheme one

" Transparent vim background
" hi Normal guibg=NONE ctermbg=NONE
" highlight clear cursorLineNR
" highlight clear LineNr

set tabstop=4
set shiftwidth=4
set expandtab 
" tab control
nnoremap t; :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tn :tabnew<CR>

" hi TablineSel ctermfg=yellow ctermbg=black  
" hi Tabline ctermfg=grey ctermbg=black
" hi TablineFill ctermbg=black     

" Pane control
nnoremap <C-J> <C-W><C-H>
nnoremap <C-K> <C-W><C-J>
nnoremap <C-L> <C-W><C-K>
nnoremap <C-W>; <C-W><C-L>

set splitbelow
set splitright

" Movement
vnoremap j h
vnoremap k j
vnoremap l k
vnoremap ; l
vnoremap ' ;
nnoremap j h
nnoremap k j
nnoremap l k
nnoremap ; l
nnoremap ' ;
onoremap j h
onoremap k j
onoremap l k
onoremap ; l
onoremap ' ;

nnoremap n b
onoremap n b
vnoremap n b
nnoremap m n
onoremap m n
vnoremap m n

" wrap movement across lines
set whichwrap+=>,l
set whichwrap+=<,h

nnoremap <up> /

" Scrolling
nnoremap K L
nnoremap L H

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
