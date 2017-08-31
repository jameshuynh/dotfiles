" cal dein#add('rking/ag.vim') " Full Text Search
" Author: James
" repo: http://github.com/jameshuynh/dotfile

" Setup dein  ---------------------------------------------------------------{{{
if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
  call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
  call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
endif

language en_US

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
call dein#begin(expand('~/.config/nvim'))

call dein#add('mxw/vim-jsx')
call dein#add('godlygeek/tabular') " Tabular
call dein#add('plasticboy/vim-markdown') "Mark down
call dein#add('AndrewRadev/splitjoin.vim') " Split & Join
call dein#add('tpope/vim-surround.git')
call dein#add('tpope/vim-commentary')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('w0rp/ale') " Syntactic Check
call dein#add('tpope/vim-repeat')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('metakirby5/codi.vim')
call dein#add('vim-scripts/vim-auto-save')
call dein#add('tpope/vim-rails')
call dein#add('christoomey/vim-tmux-runner')
call dein#add('thoughtbot/vim-rspec')
call dein#add('junegunn/vim-emoji')
call dein#add('ElmCast/elm-vim')
call dein#add('ianks/vim-tsx')
call dein#add('leafgarland/typescript-vim')
call dein#add('posva/vim-vue')
call dein#add('prettier/vim-prettier')
call dein#add('ap/vim-css-color')
call dein#add('itmammoth/doorboy.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('junegunn/gv.vim')
call dein#add('mattn/emmet-vim')
call dein#add('svermeulen/vim-easyclip')
call dein#add('vim-ruby/vim-ruby')

call dein#add('Shougo/neocomplete')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')

" call dein#add('ternjs/tern_for_vim')

" deoplete stuff
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/deol.nvim')

call dein#add('tpope/vim-endwise')
call dein#add('rakr/vim-one')

call dein#add('junegunn/fzf', { 'build': './install' })
call dein#add('junegunn/fzf.vim', { 'depends': 'junegunn/fzf' })

call dein#add('scrooloose/nerdtree')

" replace in multiple files
call dein#add('brooth/far.vim')
call dein#add('henrik/vim-reveal-in-finder')

if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif

call dein#end()
filetype plugin indent on

"}}}

let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#bracket_spacing = 'true'
" autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync

" ================= All Settings ===========================
filetype off            " required
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
colorscheme one  " colorscheme solarized

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
" set lazyredraw          " Wait to redraw
set ttyfast
set smartcase
set termguicolors
set splitbelow
set splitright
set nofoldenable
set pastetoggle=<F2>    "turn on/off paste mode
set grepprg=ag
" To turn off error beeping and flashing in Vim
set vb t_vb=
" Clear background terminal color option
set t_ut=
set clipboard+=unnamedplus " make clipboard shared between vim and other app
" prevent ag search to flash the search result
" set t_ti= t_te=
set shellpipe=>

let g:elm_format_autosave = 1
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

" copy current files path to clipboard
nmap cp :let @+= expand("%") <cr>

" nmap 0 ^
" nmap 4 $

nmap k gk
nmap j gj

" tab to trigger auto complete
" inoremap <Tab> <c-p>
" autocomplete setup
" set complete=.,b,u,]
" set wildmode=longest,list:longest
" set completeopt=menu,preview

" Y should work like D
map Y y$

" imap <Tab> <C-P>

set shell=zsh

let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}
let g:elm_setup_keybindings = 1
" ================= Leader Mapping ===================
"
let mapleader = "\<Space>"

" open vimrc in a horizontal window
nmap <leader>vr :sp $MYVIMRC<cr>
" source vimrc
nmap <leader>so :source $MYVIMRC<cr>

nmap <leader>pi :PluginInstall<cr>

" Show all git commits
nmap <leader>gc :GV<cr>

" Show all git commits
nmap <leader>rf :Reveal<cr>

" Show all git commits related to the current file
nmap <leader>gcf :GV!<cr>

" close everything except the current focusing
nmap <leader>ol :only<cr>

silent! nunmap! <Leader>p
nmap <Leader>p :PrettierAsync<cr>
map <C-t> :NERDTreeToggle<CR>

" toggle relative number
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nmap <leader>rn :call NumberToggle()<cr>

" toggle ALE
map <leader>at :ALEToggle<CR>

" split horizontal
nmap <leader>sp :sp<cr>
nmap <leader>vp :vsp<cr>
nmap <leader>ccl :ccl<cr>
nmap <leader>qq :wq<cr>
nmap <leader>sa <esc>ggVG
nmap <leader>ca <esc>:%y+<cr>
nmap <leader>- :wincmd _<cr>:wincmd \|<cr>
nmap <leader>= :wincmd =<cr>
nmap <leader>h :nohlsearch<cr>

nmap <leader>of :! open .<cr>

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
nmap <c-p> :Files<cr>

"" RSpec.vim mappings
let g:rspec_command = "VtrSendCommandToRunner! rspec {spec}"
map <Leader>a :call RunCurrentSpecFile()<CR>
map <Leader>t :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

" Tabular leader
if exists(":Tabularize")
  nmap <Leader>l= :Tabularize /=<CR>
  vmap <Leader>l= :Tabularize /=<CR>
  nmap <Leader>l: :Tabularize /:\zs<CR>
  vmap <Leader>l: :Tabularize /:\zs<CR>
endif

nmap <leader>ch <esc>:ChangeHashSyntax<cr>
nmap <leader>rt <esc>:retab<cr>

" ========== ELM
nnoremap <Leader>m :call elm#Make()<CR>
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

let g:deoplete#enable_at_startup = 1

" ================ ag config =======================================
" let g:ag_prg = 'ag --vimgrep'
" let g:ag_mapping_message=0
" =============== syntastic ========================================
" let g:syntastic_auto_jump=0
" let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_ruby_checkers=['rubocop', 'mri']
" let g:syntastic_javascript_checkers=['eslint']
" let g:ale_lint_on_save = 1
let g:ale_linters = {
      \   'typescript': ['tslint'],
      \   'javascript': ['eslint'],
      \   'ruby': ['rubocop', 'mri'],
      \   'vim' : ['vint'],
      \   'html' : ['tidy']
      \}
highlight ALEErrorSign ctermbg=yellow guibg=#3b7593 guifg=white ctermfg=white
highlight ALEWarningSign ctermbg=yellow guibg=#3b7593 guifg=white ctermfg=white
" let g:ale_sign_error = '⨉'
let g:ale_sign_error = emoji#for('small_red_triangle', '', 0)
" let g:ale_sign_warning = '⬥ '
" let g:ale_sign_warning = emoji#for('warning')
let g:ale_sign_warning = emoji#for('small_orange_diamond')
" let g:ale_statusline_format = [' E•%d', 'W•%d ', ' ⬥ ok ']
let g:ale_statusline_format = ['⨉ %d', '⬥ %d']
let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_sign_gui_color = '#ffffff'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight SignColumn guibg=NONE
nmap <silent> <c-m> <plug>(ale_previous)
nmap <silent> <c-n> <plug>(ale_next)
" ================= show extra white space =========================
highlight ExtraWhitespace ctermbg=black guibg=NONE guifg=#bcc7c2 ctermfg=NONE
set list listchars=tab:\ \ ,trail:·
highlight SpecialKey guibg=#bcc7c2 guifg=white
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
match ExtraWhitespace /\s\+$/
highlight LineNr ctermfg=grey ctermbg=none guibg=NONE guifg=#333333
highlight CursorLineNr ctermfg=grey ctermbg=none guibg=NONE guifg=NONE
" ================ easyclip =====================================
let g:EasyClipAutoFormat = 0
let g:EasyClipYankHistorySize = 10
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 0
" let g:EasyClipShareYanks = 1
" let g:EasyClipShareYanksDirectory = '~/.vim/easyclip'
" let g:EasyClipShareYanksFile = 'yanks'
let g:EasyClipUsePasteToggleDefaults = 0
" let g:EasyClipEnableBlackHoleRedirect = 0
let g:EasyClipUseSubstituteDefaults = 1
" airline
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark'
let g:airline_theme='one'
" let g:airline_left_sep=''
" let g:airline_right_sep=''

" nmap <leader>pf <plug>EasyClipToggleFormattedPaste
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste
nmap P <plug>EasyClipSwapPasteForward
nmap N <plug>EasyClipSwapPasteBackwards
" nmap <leader>p :IPaste <cr>
" ============= SplitJoin ====================
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_trailing_comma = 0
"============== Ctrlp =======================
" set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe,*.so,*.dat
let g:ctrlp_custom_ignore = {
      \ 'dir': '\.git$\|\.yardoc\|node_modules\|log$\|tmp\|dist\|uploads$',
      \ 'file': '\v\.(exe|so|dll|jpg|png|gif)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
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
let g:deoplete#enable_at_startup = 1

" fzf actions
let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--no-color', fzf#vim#with_preview(), <bang>0)

" Snipppets -----------------------------------------------------------------{{{

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory="~/.config/nvim/MyNeoSnippets"

" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
" map <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

let g:neosnippet#enable_auto_clear_markers=0
nmap <leader>nse :NeoSnippetEdit -horizontal -split<cr>
nmap <leader>nsl ::NeoSnippetSource ~/.config/nvim/MyNeoSnippets/*<cr>
"}}}
"
"
let g:ruby_indent_assignment_style = 'hanging'
let g:ruby_indent_block_style = 'do'
let g:ruby_indent_access_modifier_style = 'normal'
silent! unmap \
nmap \ :Ag<Space>


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:tern#command=["/Users/james/.config/nvim/repos/github.com/ternjs/tern_for_vim/node_modules/tern/bin/tern"]
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
