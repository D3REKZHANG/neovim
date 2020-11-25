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
call plug#end()

" Plugins Config (in order) 
let g:airline_powerline_fonts = 1
set noshowmode

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:tex_flavor = 'latex'

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

" --------------------------------------------------------------------------

set number relativenumber

syntax on
colorscheme monokai 

"hi Normal guibg=NONE ctermbg=NONE
 " highlight clear cursorLineNR
" highlight clear LineNr

set tabstop=4
set shiftwidth=4
set expandtab

" leader mapping
nnoremap <Leader>f :NERDTreeToggle<CR>
nnoremap <Leader>v :tabnew $MYVIMRC<CR>
nnoremap <Leader>vc :source $MYVIMRC<CR>

" tab control
nnoremap t; :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tn :tabnew<CR>

" Pane control
nnoremap <C-K> <C-W><C-J>
nnoremap <C-L> <C-W><C-K>
nnoremap <C-;> <C-W><C-L>
nnoremap <C-J> <C-W><C-H>

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
nnoremap b n

:set whichwrap+=>,l
:set whichwrap+=<,h

nnoremap <Space> i<Space><esc>
