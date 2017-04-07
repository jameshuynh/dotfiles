set guifont=Inconsolata\ for\ Powerline:h18
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

" allow navigate with tmux
Plugin 'christoomey/vim-tmux-navigator'

" syntastic check
" Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'

" enable repeating supported plugin maps
Plugin 'tpope/vim-repeat'

" manage clipboard
Plugin 'svermeulen/vim-easyclip'

" Vim airline for status bar
Plugin 'vim-airline/vim-airline'

" Vim airline theme
Plugin 'vim-airline/vim-airline-themes'

" Live Coding
Plugin 'metakirby5/codi.vim'

" Auto save
Plugin 'vim-scripts/vim-auto-save'

" Vim Rails
Plugin 'tpope/vim-rails'

" Vim Tmux Runner
Plugin 'christoomey/vim-tmux-runner'

" Vim Rspec
Plugin 'thoughtbot/vim-rspec'

" Auto Completion
Plugin 'ajh17/VimCompletesMe'

" Dracula Theme
Plugin 'dracula/vim'

" Function navigation
Plugin 'tacahiroy/ctrlp-funky'

call vundle#end()            " required
filetype plugin indent on    " required

" ================= All Settings ===========================

set nocompatible        " be iMproved, required
set backspace=2         " backspace in insert mode works like normal editor
syntax on               " syntax highlighting
set expandtab           " to insert space characters when tab
filetype indent on      " activates indenting for files
set autoindent          " auto indenting
set relativenumber      " line numbers
set number
set numberwidth=4       " number column space
set background=dark
colorscheme dracula     " colorscheme dracula
set synmaxcol=80        " max color at 80
set nobackup            " get rid of anoying ~file
set nowritebackup       " get rid of annoying ~file
set noswapfile          " get rid of annoying swapfile
set tabstop=2           " tab space to 2
set softtabstop=2       " soft tab space to 2
set shiftwidth=2        " shift the content every 2 columns
set cc=80               " show column at 80
set scrolloff=10        " keep bottom / top offset at 10
set incsearch           " do incremental searching
set hlsearch
set ruler               " show the cursor position all the time
set laststatus=2        " Always display the status line
set lazyredraw          " Wait to redraw
set ttyfast
set ignorecase
set smartcase

" Enable true color for vim, yay!
" let &t_8f="\e[38;2;%ld;%ld;%ldm"
" let &t_8b="\e[48;2;%ld;%ld;%ldm"
" set guicolors
set termguicolors
" End

" split below and right vim
set splitbelow
set splitright

set pastetoggle=<F2>    "turn on/off paste mode

" search using ag
set grepprg=ag

" To turn off error beeping and flashing in Vim
set vb t_vb=

" Clear background terminal color option
set t_ut=

set clipboard=unnamed " make clipboard shared between vim and other app

" prevent ag search to flash the search result
" set t_ti= t_te=
set shellpipe=>

" =================== Auto Cmd ============================

autocmd Filetype help nmap <buffer> q :q<CR>

" =================== All Mappings =========================

" Do not allow to use arrow buttons
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Move around window using ctrl - k, j, h, l
nmap <silent> <c-k> <c-w>k<CR>
nmap <silent> <c-j> <c-w>j<CR>
nmap <silent> <c-h> <c-w>h<CR>
nmap <silent> <c-l> <c-w>l<CR>

nmap 0 ^
nmap 4 $

nmap k gk
nmap j gj

" tab to trigger auto complete
" inoremap <Tab> <c-p>
" autocomplete setup
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview

" Y should work like D
map Y y$

" imap <Tab> <C-P>

set shell=zsh


" ================= Leader Mapping ===================
"
let mapleader = "\<Space>"

" open vimrc in a horizontal window
nmap <leader>vr :sp $MYVIMRC<cr>
" source vimrc
nmap <leader>so :source $MYVIMRC<cr>

nmap <leader>pi :PluginInstall<cr>

" split horizontal
nmap <leader>sp :sp<cr>
nmap <leader>vp :vsp<cr>
nmap <leader>ccl :ccl<cr>
nmap <leader>qq :wq<cr>
nmap <leader>sa <esc>ggVG
nmap <leader>- :wincmd _<cr>:wincmd \|<cr>
nmap <leader>= :wincmd =<cr>
nmap <leader>h :nohlsearch<cr>

" tmux runner
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb' }<cr>
nnoremap <leader>osr :VtrOpenRunner {'orientation': 'h', 'percentage': 50 }<cr>
nnoremap <leader>ap :VtrAttachToPane<cr>
nnoremap <leader>sl :VtrSendLinesToRunner<cr>
vnoremap <leader>sl :VtrSendLinesToRunner<cr>
nnoremap <leader>sc :VtrSendCommand<cr>
nnoremap <leader>ft :VtrFocusRunner<cr>

" save with w
nmap <leader>w <esc>:w<cr>

nnoremap <leader>i <esc>:!ctags_index<cr>

" map jk and kj with escape

" imap <esc> <nop> -- to extreme
inoremap kk <esc>
inoremap jj <esc>

" open ctrl-p
nmap <leader>o :CtrlP<cr>

" enter visual line mode
nmap <leader><leader> V

" on visual mode, when press u, do nothing
vmap u <nop>

" open easyclip paste
cmap <c-v> <plug>EasyClipCommandModePaste
imap <c-v> <plug>EasyClipInsertModePaste

nmap <c-q> :echoe hello<cr>

"" RSpec.vim mappings
let g:rspec_command = "VtrSendCommandToRunner! rspec {spec}"
map <Leader>a :call RunCurrentSpecFile()<CR>
map <Leader>t :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

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

" ================ ag config =======================================
let g:ag_prg = 'ag --vimgrep'
let g:ag_mapping_message=0
nmap \ :Ag!<Space>
" =============== syntastic ========================================
" let g:syntastic_auto_jump=0
" let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_ruby_checkers=['rubocop', 'mri']
" let g:syntastic_javascript_checkers=['eslint']
" let g:ale_lint_on_save = 1
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'ruby': ['rubocop', 'mri'],
      \   'vim' : ['vint'],
      \   'html' : ['tidy']
      \}
highlight ALEErrorSign ctermbg=black guibg=#3b7593 guifg=white ctermfg=black
highlight ALEWarningSign ctermbg=black guibg=#3b7593 guifg=white ctermfg=black
let g:ale_sign_error = '-'
let g:ale_sign_warning = '#'
let g:ale_statusline_format = [' E•%d', 'W•%d ', ' ⬥ ok ']
let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
nmap <silent> <c-m> <plug>(ale_previous)
nmap <silent> <c-n> <plug>(ale_next)
" ================= show extra white space =========================
highlight ExtraWhitespace ctermbg=black guibg=#454960 guifg=#f197e3 ctermfg=black
set list listchars=tab:\ \ ,trail:·
" highlight NonText guifg=#4a4a59
highlight SpecialKey guibg=#454960 guifg=white
match ExtraWhitespace /\s\+$/
highlight LineNr ctermfg=grey ctermbg=white guibg=#444756 guifg=#cccccc
" ================ easyclip =====================================
" let g:EasyClipAutoFormat = 1
let g:EasyClipYankHistorySize = 10
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 0
let g:EasyClipShareYanks = 1
let g:EasyClipShareYanksDirectory = '~/.vim/easyclip'
let g:EasyClipShareYanksFile = 'yanks'
let g:EasyClipUsePasteToggleDefaults = 0
let g:EasyClipEnableBlackHoleRedirect = 0
let g:EasyClipUseSubstituteDefaults = 1
" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_tomorrow'
" let g:airline_left_sep=''
" let g:airline_right_sep=''

nmap <leader>pf <plug>EasyClipToggleFormattedPaste
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste
nmap P <plug>EasyClipSwapPasteForward
nmap N <plug>EasyClipSwapPasteBackwards
nmap <leader>p :IPaste <cr>
" ============= SplitJoin ====================
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_trailing_comma = 0
"============== Ctrlp =======================
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe,*.so,*.dat
let g:ctrlp_custom_ignore = {
      \ 'dir': '\.git$\|\.yardoc\|node_modules\|log\|tmp\|dist\|uploads$',
      \ 'file': '\v\.(exe|so|dll|jpg|png|gif)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
" function! SetupCtrlP()
"   if exists("g:loaded_ctrlp") && g:loaded_ctrlp
"     augroup CtrlPExtension
"       autocmd!
"       autocmd FocusGained  * CtrlPClearCache
"       autocmd BufWritePost * CtrlPClearCache
"     augroup END
"   endif
" endfunction
" if has("autocmd")
"   autocmd VimEnter * :call SetupCtrlP()
" endif

" let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
" let g:ctrlp_use_caching = 0

" ============= Auto Save ======================
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
" ============= My Script ======================

function! JSWrapIgnoreUnusedVariable()
  augroup JSWrapIgnoreUnusedVariable
    call append(line('.') - 1, "/*eslint-disable no-unused-vars*/")
    call append(line('.'), "/*eslint-disable no-unused-vars*/")
  augroup END
endfunction

map <leader>igl :call JSWrapIgnoreUnusedVariable()<cr>

" ============== Change Hash Syntax ===========
function! s:ChangeHashSyntax(line1,line2)
  let l:save_cursor = getpos(".")
  silent! execute ':' . a:line1 . ',' . a:line2 . 's/\([^:]\):\([a-z0-9_]\+\)\s\+=>/\1\2:/g'
  call setpos('.', l:save_cursor)
endfunction

command! -range=% ChangeHashSyntax call <SID>ChangeHashSyntax(<line1>,<line2>)
nmap <leader>ch <esc>:ChangeHashSyntax<cr>
nmap <leader>rt <esc>:retab<cr>

" ============== ctrl-p funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
