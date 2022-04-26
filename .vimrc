" PRVim - Programming Ready Vim
" PRVim is Vim with special config to make Vim 'programming ready', like an IDE.
let PRVIM_version="0.3"

" Make LET-s
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
let home_dir = $HOME
let prvim_dir = home_dir.'/.prvim'
let mapleader=','
let g:sesion_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
let no_buffers_menu=1
let g:CSApprox_loaded = 1
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1
let start=line('.')

" Add plug.vim
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob(home_dir . '/.prvim'))
  silent execute '!mkdir '.prvim_dir
endif
silent execute '!echo '.PRVIM_version.'>'.prvim_dir.'/installed'
silent execute '!echo '.PRVIM_version.'>'.prvim_dir.'/.installed'

" Make SET-s
set number
set mouse=a
set nocompatible
set tabstop=4
set shiftround
set shiftwidth=4
set softtabstop=4
set expandtab
set laststatus=2
set ttyfast
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set ruler
set wildmenu
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10
set gcr=a:blinkon0
set scrolloff=3
set modeline
set modelines=10
set title
set titleold="Terminal"
set titlestring=%F
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/
set undodir=~/.vim/undodir
set undofile
set lazyredraw
set display+=lastline
set encoding=utf-8 nobomb
set foldmethod=syntax
set clipboard=unnamedplus

" To make syntax before saving and VIM-ing file again
filetype indent on

" Add and configure plugins
call plug#begin()
" ALE
Plug 'dense-analysis/ale'
" vim-easy-align
Plug 'junegunn/vim-easy-align'
" NERDTree
Plug 'scrooloose/nerdtree'
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeIgnore=['node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
" FZF
Plug 'junegunn/fzf.vim'
" Vim-Startify
Plug 'mhinz/vim-startify'
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['      Latest files']                   },
            \ { 'type': 'dir',       'header': ['      Latest files in this directory'] },
            \ { 'type': 'sessions',  'header': ['      Sessions']                       },
            \ { 'type': 'commands',  'header': ['      Utility commands']               },
            \ ]
let g:startify_commands = [
            \ ['Update plugins',       'PlugInstall'],
            \ ['Check health',         'CheckHealth'],
            \ ['Check plugins health', 'PlugStatus'],
            \ ]
let g:startify_custom_header = [
            \ ' _____  _______      ___           ',
            \ '|  __ \|  __ \ \    / (_)          ',
            \ '| |__) | |__) \ \  / / _ _ __ ___  ',
            \ '| |___/|  _  / \ \/ / | | |_ ` _ \ ',
            \ '| |    | | \ \  \  /  | | | | | | |',
            \ '|_|    |_|  \_\  \/   |_|_| |_| |_|',
            \ ]
" DelimitMate
Plug 'raimondi/delimitmate'
" CSS-Color
Plug 'ap/vim-css-color'
" Airline
Plug 'bling/vim-airline'
" NERDTree-Git-Plugin
Plug 'xuyuanp/nerdtree-git-plugin'
" Healthcheck
Plug 'rhysd/vim-healthcheck'
" CtrlP and CtrlP addons
Plug 'vim-scripts/ctrlp.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'tacahiroy/ctrlp-funky'
Plug 'davidegx/ctrlp-smarttabs'
Plug 'tacahiroy/ctrlp-ssh'
Plug 'okcompute/vim-ctrlp-session'
let g:ctrlp_map = ''
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" EmacsCommandLine
Plug 'houtsnip/vim-emacscommandline'
" DevIcons
Plug 'ryanoasis/vim-devicons'
" TSLime
Plug 'jgdavey/tslime.vim'
" JSDoc
Plug 'heavenshell/vim-jsdoc'
" Move
Plug 'matze/vim-move'
" CSS3-syntax
Plug 'hail2u/vim-css3-syntax'
" Emmet
Plug 'mattn/emmet-vim'
" Lua-Ftplugin
Plug 'xolox/vim-lua-ftplugin'
" Lua-Inspect
Plug 'xolox/vim-lua-inspect'
" Misc
Plug 'xolox/vim-misc'
" Session
Plug 'xolox/vim-session'
" Snippets
Plug 'honza/vim-snippets'
" PHP-CS-Fixer
Plug 'stephpy/vim-php-cs-fixer'
" Requirements.txt
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
" Javascript
Plug 'pangloss/vim-javascript'
" JSDoc
Plug 'heavenshell/vim-jsdoc'
" GDScript 3
Plug 'calviken/vim-gdscript3'
" Haskell
Plug 'vim-scripts/haskell.vim'
" JSONNet
Plug 'google/vim-jsonnet'
" JQuery
Plug 'itspriddle/vim-jquery'
" Twig
Plug 'evidens/vim-twig'
" Typescript
Plug 'leafgarland/typescript-vim'
" Yats
Plug 'HerringtonDarkholme/yats.vim'
" Vue
Plug 'posva/vim-vue'
" Vue-plugin
Plug 'leafOfTree/vim-vue-plugin'
" Bash support
Plug 'vim-scripts/bash-support.vim'
" Golang
Plug 'jnwhiteh/vim-golang'
" Protobuf
Plug 'uarun/vim-protobuf'
" EditorConfig
Plug 'editorconfig/editorconfig-vim'
" Python PEP8 indent
Plug 'hynek/vim-python-pep8-indent'
" Blockle
Plug 'jgdavey/vim-blockle'
" EasyMotion
Plug 'skwp/vim-easymotion'
" Beautify
Plug 'alpaca-tc/beautify.vim'
" PLSQL
Plug 'vim-scripts/plsql.vim--Lysyonok'
" Rainbow CSV
Plug 'mechatroner/rainbow_csv'
" DBEXT
Plug 'vim-scripts/dbext.vim'
" EX Taglist
Plug 'exvim/ex-taglist'
" SQLUtilities
Plug 'vim-scripts/SQLUtilities'
" SQLComplete
Plug 'vim-scripts/SQLComplete.vim'
" PGFormatter
Plug 'darold/pgformatter'
" Project
Plug 'shemerey/vim-project'
" Ruby Debugger
Plug 'astashov/vim-ruby-debugger'
" Perl support
Plug 'vim-scripts/perl-support.vim'
" Buffet
Plug 'bagrat/vim-buffet'
" Gitgutter
Plug 'airblade/vim-gitgutter'
" NERDCommenter
Plug 'scrooloose/nerdcommenter'
" Repeat
Plug 'tpope/vim-repeat'
" Yoink
Plug 'svermeulen/vim-yoink'
" Abolish
Plug 'tpope/vim-abolish'
" CSS Color
Plug 'ap/vim-css-color'
" Autoformat
Plug 'chiel92/vim-autoformat'
" Fish
Plug 'dag/vim-fish'
" Splitjoin
Plug 'andrewradev/splitjoin.vim'
"" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'sjl/badwolf'
Plug 'arcticicestudio/nord-vim'
Plug 'chase/vim-ansible-yaml'
call plug#end()

" Make MAP-s
map <leader>nn :NERDTreeToggle<CR>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<CR>
map <leader>z :Goyo<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>j :CtrlP<CR>
map <C-b> :CtrlPBuffer<CR>
map <C-t> :call g:TU.run()<CR>
map <F7>  :call g:RubyDebugger.step()<CR>
map <F5>  :call g:RubyDebugger.next()<CR>
map <F8>  :call g:RubyDebugger.continue()<CR>

" Make XMAP-s
xmap y <plug>(YoinkYankPreserveCursorPosition)

" Make OMAP-s

" Make NMAP-s
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
nmap <c-=> <plug>(YoinkPostPasteToggleFormat)
nmap y <plug>(YoinkYankPreserveCursorPosition)
nmap <expr> <c-p> yoink#canSwap() ? '<plug>(YoinkPostPasteSwapForward)' : '<Plug>(ctrlp)'

" Make NNOREMAP-s
nnoremap bash_example i#!/usr/bin/env bash<ESC>o<ESC>ofunction run(){<ESC>o<ESC>o}<ESC>o<ESC>run<ESC>ki<S-TAB>
nnoremap bash_run :!chmod +x % && source %
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <silent> <leader>sh :terminal<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap m d
nnoremap mm dd
nnoremap M D
nnoremap x d
nnoremap xx dd
nnoremap X D

" Make INOREMAP-s
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Make XNOREMAP-s
xnoremap m d
xnoremap x d

" Make ONOREMAP-s
onoremap ie :exec "normal! ggVG"<cr>
onoremap iv :exec "normal! HVL"<cr>

" Make CNOREABBREV-s
cnoreabbrev W! w!
cnoreabbrev Q! Q!
cnoreabbrev Qal! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Make IF-s
if has("gui_running")
	if has("gui_mac") || has("gui_macvim")
		set guifont=Menlo:h12
		set transparency=7
	endif
else
	let g:CSApprox_loaded = 1
	let g:indentLine_enabled = 1
	let g:indentLine_concealcursor = 0
	let g:indentLine_char = '┆'
	let g:indentLine_faster = 1
	if $COLORTERM == 'gnome-terminal'
		set term=gnome-256color
	else
		if $TERM == 'xterm'
			set term=xterm-256color
		endif
	endif
endif
if &term =~ '256color'
	set t_ut=
endif
if exists('$SHELL')
	set shell=$SHELL
else
	set shell=/bin/sh
endif

" Settings
set background=dark
colorscheme gruvbox
