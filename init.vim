" Vim Plug
if !exists('g:vscode')
  call plug#begin('~/AppData/Local/nvim-data/plugged')
 
  Plug 'lewis6991/impatient.nvim'

  " Colourthemes
  Plug 'joshdick/onedark.vim'
  Plug 'mangeshrex/everblush.vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'AhmedAbdulrahman/vim-aylin'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'sainnhe/everforest'
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  Plug 'EdenEast/nightfox.nvim'

  " Utility
  "   Vimscript
  Plug 'junegunn/goyo.vim'
  Plug 'psliwka/vim-smoothie'
  Plug 'dstein64/vim-startuptime'
  Plug 'voldikss/vim-floaterm'
  Plug 'tpope/vim-surround'
  Plug 'Raimondi/delimitMate'
  Plug 'lervag/vimtex'

  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'

  "   Lua
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'akinsho/nvim-bufferline.lua'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
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
  colorscheme nordfox

  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
  highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
  highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
  highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
  highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
  hi hlgroup gui=underline
  hi NvimTreeRootFolder guifg=FG 

lua << EOF
  require("bufferline").setup{
      options = {
          offsets = {
            {
                filetype = "NvimTree",
                text="File Explorer",
                separator= true,
                text_align = "left"
            }
          },

          diagnostics = "nvim_lsp",
          separator_style = {"", ""},
          modified_icon = '●',
          show_close_icon = false,
          show_buffer_close_icons = false,
      },
    highlights = {
      separator = {
        bg = '#'..string.format("%06x", vim.api.nvim_get_hl_by_name("Normal", true).background),
      }
    }
  }

  require("lualine").setup {
      options = {
          component_separators = { left = '', right = '/'},
          section_separators = { left = '', right = ''},
          globalstatus = true,
      },
      sections = {
      lualine_c = {
        {
          'filename',
          file_status = true, -- displays file status (readonly status, modified status)
          path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
        }
      }
    }
  }

  require("nvim-tree").setup{
      view = {width = "20%"},
      update_focused_file = { enable = true },
      renderer = {
        icons = {
          show = {
            folder = true,
            folder_arrow = true,
          },
          glyphs = {
            folder = {
              default ="",
              open = "ﱮ",
            },
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          }
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        debounce_delay = 50,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },

  }

  require("nvim-treesitter.configs").setup {
    ensure_installed = { "javascript", "typescript", "python" },
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }

  require("luasnip.loaders.from_snipmate").lazy_load()

  local theme = require("telescope.themes")
  require("telescope").setup {
    defaults = {
      path_display = {"truncate"},
    },
    pickers = {
      find_files = {
        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
        theme="dropdown",
        previewer = false,
      },
      colorscheme = {
        --enable_preview = true,
        previewer = false,
        theme="dropdown"
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
        path_display = {"tail"},
      }
    },
  } 

  require("trouble").setup{}
  require('git-conflict').setup{}
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
  nnoremap <silent><leader>t <cmd>FloatermToggle<CR>
  nnoremap <silent><leader><Tab> <cmd>BufferLinePick<CR>
  nnoremap <silent><leader>q <cmd>Bdelete<CR>
  nnoremap <silent><C-p> <cmd>Telescope find_files<CR>
  nnoremap <silent><C-l> <cmd>Telescope live_grep<CR>
  nnoremap <silent><leader>9 <cmd>Telescope colorscheme<CR>
  nnoremap <silent><leader>b <cmd>Telescope buffers<CR>
  nnoremap <silent><leader>e <cmd>NvimTreeToggle<CR>
  nnoremap <silent><leader>z <C-^>
  nnoremap <silent><leader>8 <cmd>IndentBlanklineToggle<CR>
endif

nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>so :source $MYVIMRC<CR>
nnoremap <silent><leader>go :Goyo<CR>
nnoremap <leader>p "0p
nnoremap <leader>y "+y
nnoremap <leader>h :%s/
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
nnoremap <leader>T :set shiftwidth 

" g Mapping ----------------------------------------------------------------

nnoremap <silent>gc :call SetColorCol()<CR>
nnoremap <silent>gb :GitBlameToggle<CR>
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
nnoremap <silent> <C-/> :set hlsearch!<cr>:set wrapscan!<cr>

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
