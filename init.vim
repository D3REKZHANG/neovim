" Vim Plug
call plug#begin('~/AppData/Local/nvim-data/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'patstockwell/vim-monokai-tasty'
    Plug 'lervag/vimtex'
    Plug 'morhetz/gruvbox'
    Plug 'crusoexia/vim-monokai'
    Plug 'sainnhe/sonokai'
    Plug 'wlangstroth/vim-racket'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ryanoasis/vim-devicons'
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

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

" --------------------------------------------------------------------------

" leader mapping
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <Leader>v :tabnew $MYVIMRC<CR>
nnoremap <Leader>vc :source $MYVIMRC<CR>
" --------------------------------------------------------------------------

set number relativenumber
set textwidth=150

filetype plugin on

syntax on
colorscheme monokai 

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

hi TablineSel ctermfg=yellow ctermbg=black  
hi Tabline ctermfg=grey ctermbg=black
hi TablineFill ctermbg=black     

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

nnoremap j h
nnoremap k j
nnoremap l k
nnoremap ; l

nnoremap n b
onoremap n b
vnoremap n b
nnoremap b n
onoremap b n
vnoremap b n

" wrap movement across lines
:set whichwrap+=>,l
:set whichwrap+=<,h

nnoremap <Space> i<Space><esc>

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

