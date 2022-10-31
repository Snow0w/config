
"Indent's logic'
filetype plugin indent on
set	autoindent
set smartindent

"Disable vi-compatibility
set nocompatible

"expanded, 4-wide tabulations
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=4

"Real-world encoding
set encoding=utf-8

"Do not abandon buffers
set hidden

"Don't bother throttling tty
set ttyfast

"scroll"
set scrolloff=7

"More useful backspace behavior
set backspace=indent,eol,start

"Use statusbar on all windows
set laststatus=2

"Better search
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

"Syntax on
"syntax enable

"Maybe replaced with plugins
"set wildmenu
"
"see multiple spaces as tabstops so <BS> does the right thing
"set softtabstop=4

"Usefull feathures
set mouse+=a
set number
set ruler
set noerrorbells visualbell t_vb=

set relativenumber
"Show vimcmds
set showcmd

call plug#begin()
"Colorsheme
Plug 'https://github.com/sainnhe/sonokai'

"NERD tree
Plug 'https://github.com/preservim/nerdtree'

"tree-sitter
Plug 'nvim-treesitter/nvim-treesitter'

"comments"
Plug 'https://github.com/tpope/vim-commentary'

"lsp-config"
Plug 'https://github.com/neovim/nvim-lspconfig'

"cmp"
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-cmdline'

"Telescope"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do':'make'}

Plug 'https://github.com/morhetz/gruvbox'

call plug#end()

"Tree-sitter module
function! Tree_sitter_module_omanie()
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "java" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
endfunction

"lsp-config setup"
lua require("lsp_conf")



autocmd VimEnter * TSEnable highlight

" inoremap ( ()<left>
" inoremap () ()
" inoremap [ []<left>
" inoremap [] []
" inoremap { {}<Left>
" inoremap {} {}
" inoremap " ""<left>
" inoremap "" ""
" inoremap ' ''<left>
" inoremap '' ''

"new brakets mappings"
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"Vim splits movwment
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

"tab logic mapping"
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap tn :tabnew<CR>
nnoremap te :tabfind<Space>
set tabpagemax=50

"tag juming in vsp and tab modes"
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-s> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"save swp backup and undo files in folowing dirs"
set backupdir=~/.nvim/backup//
set directory=~/.nvim/swap//
set undodir=~/.nvim/undo//

"My mappings"
map <Space> <Leader>
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
map <silent> <leader><cr> :noh<cr>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"NERDTree settings"
nnoremap <C-f> :NERDTreeFind<CR>
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


"colorsheme setiings
if has('termguicolors')
  set termguicolors
endif
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
colorscheme sonokai

"gruvbox"
let g:gruvbox_italic=1
let g:gruvbox_hls_cursor="gray"
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_italicize_strings=1
let g:gruvbox_invert_selection=1
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
colorscheme gruvbox

"column border"
highlight ColorColumn ctermbg=gray
set colorcolumn=80

"School42 settings"
let g:user42 = 'omanie'
let g:mail42 = 'omanie@student21-school.ru'

"Telescope staff"
lua require("telescope_conf")
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"simple java runner"
nnoremap <F10> <cmd> :!javac *.java<cr>

"terminal neovim AWESOME"
" tnoremap <C-[> <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
" To simulate |i_CTRL-R| in terminal-mode: >
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

nnoremap <F12>  <cmd>sp<cr><C-w>j<cmd>terminal<cr><C-\><C-n><cmd>set nonumber<cr><cmd>resize 15<cr>i

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
