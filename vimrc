" ================= All Plugins ===========================
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vim Bundle
Plugin 'gmarik/Vundle.vim'

" Syntax Highlight for JSX
Plugin 'mxw/vim-jsx'

" Fuzzy Search
Plugin 'ctrlpvim/ctrlp.vim'

" Tabular
Plugin 'godlygeek/tabular'

" Markdown
Plugin 'plasticboy/vim-markdown'

" ack search
Plugin 'rking/ag.vim'

" splitjoin
Plugin 'AndrewRadev/splitjoin.vim'

" allow changing surrounding like double quote
Plugin 'tpope/vim-surround.git'

" allow to comment using gc or gcc key
Plugin 'tpope/vim-commentary'

call vundle#end()            " required
filetype plugin indent on    " required

" ================= All Settings ===========================

set nocompatible              " be iMproved, required
set backspace=2         " backspace in insert mode works like normal editor
syntax on               " syntax highlighting
set expandtab           " to insert space characters when tab
filetype indent on      " activates indenting for files
set autoindent          " auto indenting
set number              " line numbers
set background=dark
colorscheme dracula     " colorscheme desert
set nobackup            " get rid of anoying ~file
set nowritebackup       " get rid of annoying ~file
set tabstop=2           " tab space to 2
set softtabstop=2       " soft tab space to 2
set shiftwidth=2        " shift the content every 2 columns
set cc=80               " show column at 80
set scrolloff=10        " keep bottom / top offset at 10

" split below and right vim
set splitbelow
set splitright

set pastetoggle=<F2>    "turn on/off paste mode

" search using ag
set grepprg=ag

" To turn off error beeping and flashing in Vim
set vb t_vb=

" =================== All Mappings =========================

" Do not allow to use arrow buttons
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Move around window using ctrl - k, j, h, l
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

nmap 0 ^
nmap 4 $

" ================= Leader Mapping ===================
"
let mapleader = "\<Space>"

" open vimrc in a horizontal window
nmap <leader>vr :sp $MYVIMRC<cr>
" source vimrc
nmap <leader>so :source $MYVIMRC<cr>

" save with w
nmap <leader>w <esc>:w<cr>

" map jk and kj with escape
imap jk <esc>
imap kj <esc>

" open ctrl-p
nmap <leader>o :CtrlP<cr>

" enter visual line mode
nmap <leader><leader> V

" on visual mode, when press u, do nothing
vmap u <nop>

" ================== Extra Functions ================================

" stripping white space using <leader>q
function! <SID>StripTrailingWhitespaces()
   " Preparation: save last search, and cursor position.
   let _s=@/
   let l = line(".")
   let c = col(".")
   " Do the business:
   %s/\s\+$//e
   " Clean up: restore previous search history, and cursor position
   let @/=_s
   call cursor(l, c)
endfunction
nnoremap <leader>q :call <SID>StripTrailingWhitespaces()<CR>
" ===================================================================

" ================= show extra white space ==========================

highlight ExtraWhitespace ctermbg=white guibg=#163e59 ctermfg=black
set list listchars=tab:\ \ ,trail:·
match ExtraWhitespace /\s\+$/

" ================ ag config =======================================
let g:ag_prg = 'ag --vimgrep'
nmap <Leader>a :Ag<Space>
nmap \ :Ag<Space>
