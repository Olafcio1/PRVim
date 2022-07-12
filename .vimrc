" Checks for needed things
if (empty(glob('~/.vim/.setupdone')))
   silent !echo "Please see https://github.com/christoomey/vim-tmux-navigator\#add-a-snippet to make TMUX navigator work."
   silent !echo -n "[click any key to continue]"
   silent !read -s -n 1
   silent !touch $HOME"/.vim/.setupdone"
endif
if !has("autocmd")
   !echo "Please update to newer version of Vim, autocmd is required to make PRVim work."
   q
endif
if has("win16") || has("win32") || has("win64") || has("win98")
   !echo "Windows is not supported by PRVim. Please install Git Bash or WSL(1/2) to run PRVim."
endif



" Vim-Plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
   silent !mkdir -p ~/.vim/autoload
   silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.vim/autoload/plug.vim
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
   \| PlugInstall --sync | source $MYVIMRC
\| endif



" Vim-Plug plugins & theirs' configurations
call plug#begin()
" Color schemes {
"" gruvbox
Plug 'morhetz/gruvbox'
" }

" Icons {
"" vim-devicons
Plug 'ryanoasis/vim-devicons'
" }

" Snippets {
"" vim-snipmate
Plug 'garbas/vim-snipmate' |
"" vim-snippets
	\ Plug 'honza/vim-snippets'
""" Configuration of them all
let g:snipMate = {'snippet_version': 1}
" }

" CSS {
" vim-css3-syntax
Plug 'hail2u/vim-css3-syntax'
"" vim-css-color
Plug 'ap/vim-css-color'
" }

" CSV {
"" csv
Plug 'chrisbra/csv.vim'
" }
Plug 'tpope/vim-fugitive'

" Ruby {
"" vim-byebug-breakpoints
Plug 'kmewhort/vim-byebug-breakpoints'
" }

" Bash {
"" bash-support
Plug 'vim-scripts/bash-support.vim'
" }

" PHP {
"" phpcomplete
Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
" }

" Javascript {
"" vim-javascript
Plug 'pangloss/vim-javascript'
"" vim-jsdoc
Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }
" }

" Python {
"" vim-python-pep8-indent
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
" }

" HTML {
"" emmet-vim
Plug 'mattn/emmet-vim'
" }

" Misc - files tree ("Project" tab in JetBrains's IDEs) {
"" nerdtree
Plug 'preservim/nerdtree' |
"" nerdtree-git-plugin
	\ Plug 'Xuyuanp/nerdtree-git-plugin' |
"" vim-nerdtree-syntax-highlight
	\ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
"" nerdtree-visual-selection
	\ Plug 'PhilRunninger/nerdtree-visual-selection' |
"" nerdtree-project
	\ Plug 'scrooloose/nerdtree-project-plugin'
""" Configuration of them all
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
function! IsNerdTreeEnabled()
	return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction
if !IsNerdTreeEnabled()
	autocmd VimEnter * silent NERDTreeCWD | wincmd p
endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
	\ && b:NERDTree.isTabTree()) | q | endif
" }

" Misc - autocomplete {
"" supertab
Plug 'ervandew/supertab'
let g:SuperTabCrMapping = 0
let g:SuperTabDefaultCompletionType = "context"
"" AutoComplPop
Plug 'vim-scripts/AutoComplPop'
"" jedi-vim
Plug 'davidhalter/jedi-vim'
let g:jedi#use_tabs_not_buffers = 1
if has('unix')
	let g:jedi#environment_path = "/usr/bin/python3"
elseif has('macunix')
	let g:jedi#environment_path = "/usr/local/bin/python3"
endif
"" coc
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
let g:coc_global_config="$HOME/.config/coc/coc-settings.json"
" }

" Misc {
"" ale
Plug 'dense-analysis/ale' |
	\ let g:ale_linters = {'c': ['ccls', 'clang'], 'cpp': ['clang'], 'javascript': ['eslint'], 'php': ['php'], 'python': ['pyls', 'flake8'], 'vim': ['vint']} |
	\ let g:ale_fixers = {'*': ['trim_whitespace'], 'c': ['clang-format'], 'cpp': ['clang-format'], 'css': ['prettier'], 'javascript': ['prettier'], 'json': ['prettier'], 'php': ['prettier'], 'python': ['black'], 'scss': ['prettier'], 'yaml': ['prettier']} |
"" typescript
	\ Plug 'leafgarland/typescript-vim' |
"" tsuquyomi
	\ Plug 'Quramy/tsuquyomi' |
"" vim-js-indent
	\ Plug 'jason0x43/vim-js-indent' |
"" vim-js-pretty-template
	\ Plug 'Quramy/vim-js-pretty-template' |
"" vim-go
	\ Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } |
	\ map <C-.> :cnext<CR> |
	\ map <C-,> :cprevious<CR> |
	\ nnoremap <leader>a :cclose<CR> |
	\ let g:go_list_type = "quickfix" |
	\ let g:go_highlight_fields = 1 |
	\ let g:go_highlight_functions = 1 |
	\ let g:go_highlight_function_calls = 1 |
	\ let g:go_highlight_extra_types = 1 |
	\ let g:go_highlight_operators = 1 |
	\ let g:go_fmt_autosave = 1 |
	\ let g:go_fmt_command = "goimports" |
	\ let g:go_auto_type_info = 1 |
"" php
	\ Plug 'stanangeloff/php.vim' |
"" phpactor
	\ Plug 'phpactor/phpactor' |
"" vim-php-cs-fixer
	\ Plug 'stephpy/vim-php-cs-fixer'
"" vim-checkhealth
Plug 'rhysd/vim-healthcheck'
"" startify
Plug 'mhinz/vim-startify'
function s:utilitycommands()
	return [
		\ { 'line': 'Update plugins', 'cmd': 'PlugInstall' },
		\ { 'line': 'Check editor health', 'cmd': 'CheckHealth' },
		\ ]
endfunction
let g:startify_session_dir = '~/.vim/session'
let g:startify_lists = [ 
	\ { 'type': 'files',                       'header': ['    Recent files']              },
	\ { 'type': 'dir',                         'header': ['    Recent files in '.getcwd()] },
	\ { 'type': 'sessions',                    'header': ['    Saved sessions']            },
	\ { 'type': function('s:utilitycommands'), 'header': ['    Utility commands']          },
	\ ]
let g:startify_custom_header = [
	\ ' _____  _______      ___           ',
	\ '|  __ \|  __ \ \    / (_)          ',
	\ '| |__) | |__) \ \  / / _ _ __ ___  ',
	\ '| |___/|  _  / \ \/ / | | |_ ` _ \ ',
	\ '| |    | | \ \  \  /  | | | | | | |',
	\ '|_|    |_|  \_\  \/   |_|_| |_| |_|',
	\ ]
"" vim-polyglot
Plug 'sheerun/vim-polyglot'
"" nerdcommenter
Plug 'preservim/nerdcommenter'
"" promptline
Plug 'edkolev/promptline.vim'
"" vim-gitgutter
Plug 'airblade/vim-gitgutter'
"" tagbar
Plug 'preservim/tagbar'
"" vim-repeat
Plug 'tpope/vim-repeat'
"" vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'
"" fzf
Plug 'junegunn/fzf.vim'
"" vim-dispatch
Plug 'tpope/vim-dispatch'
"" vim-move
Plug 'matze/vim-move'
let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'S'
"" vim-signature
Plug 'kshenoy/vim-signature'
"" vim-misc
Plug 'xolox/vim-misc'
"" vim-latex
Plug 'vim-latex/vim-latex', { 'for': 'latex' }
"" vim-json
Plug 'leshill/vim-json', { 'for': 'json' }
"" vim-addon-mw-utils
Plug 'MarcWeber/vim-addon-mw-utils'
"" tlib_vim
Plug 'tomtom/tlib_vim'
"" command-t
Plug 'wincent/command-t'
"" vim-autopairs
Plug 'LunarWatcher/auto-pairs'
"" vim-airline
Plug 'vim-airline/vim-airline'
"" vim-airline-themes
Plug 'vim-airline/vim-airline-themes'
" }

" C++ {
"" vim-fswitch
Plug 'derekwyatt/vim-fswitch'
"" vim-protodef
Plug 'derekwyatt/vim-protodef'
" }
call plug#end()



" Another configuration
"" Selecting with Shift
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

"" AutoCMD for file with specified types
autocmd FileType java let b:dispatch = 'javac %'
autocmd FileType python setlocal completeopt-=preview
autocmd FileType go nmap <F10>  <Plug>(go-test)<Plug>(go-run)

"" PRVim settings (configurable)
colorscheme gruvbox
set mouse=a

"" Complete menu
set omnifunc=syntaxcomplete#Complete
autocmd FileType go set omnifunc=go#complete#Complete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
	\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
	\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-p> pumvisible() ? '<C-p>' :
	\ '<C-p><C-r>=pumvisible() ? "\<lt>Up>" : ""<CR>'

"" Misc settings, not configurable
set nocompatible
set encoding=utf-8 nobomb
scriptencoding utf-8
set fileformats=unix,mac,dos
let mapleader=","
let maplocalleader=",,"
set formatoptions=
set formatoptions+=c
set formatoptions+=q
set formatoptions+=n
set formatoptions+=2
set formatoptions+=l
set formatoptions+=1
au FocusLost * :wa
if has('filetype')
	filetype indent plugin on
	set fileformat=unix
endif
syntax on
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set smartindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
if has('mouse')
  set mouse=a
endif
set cmdheight=2
set number
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set shiftwidth=4
set softtabstop=4
set expandtab
set ruler
set showcmd
set mousehide
set cursorline
set showmatch
map Y y$
nnoremap <C-L> :nohl<CR><C-L>
nmap <leader>w :w!<CR>
map <C-F> /
map <C-f> /
map <silent> <CR> :noh<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <F4> :tabclose<CR>
imap <F4> :tabclose<CR>
vmap <F4> :tabclose<CR>
map <C-Home>	:1<CR>
imap <C-Home>	:1<CR>
vmap <C-Home>	:1<CR>
map <C-End>		:$<CR>
imap <C-End>	:$<CR>
vmap <C-End>	:$<CR>
map <Home>		<ESC>^
imap <Home>		<ESC>^
vmap <Home>		<ESC>^
map <End>		<ESC>$
imap <End>		<ESC>$
vmap <End>		<ESC>$
map <C-Y>		<ESC>dd<ESC>
map <C-y>		<ESC>dd<ESC>
vmap <C-Y>		<ESC>dd<ESC>v
vmap <C-y>		<ESC>dd<ESC>v
imap <C-Y>		<ESC>dd<ESC>i
imap <C-y>		<ESC>dd<ESC>i
map <S-e>		:NERDTreeToggle<CR>:echo "Toggled NERDTree."<CR>
map <S-E>		:NERDTreeToggle<CR>:echo "Toggled NERDTree."<CR>
map <C-B> :NERDTreeFromBookmark 
map <C-b> :NERDTreeFromBookmark 
map <S-F> :NERDTreeFind<CR>
map <S-f> :NERDTreeFind<CR>
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste
ino <C-j> <C-r>=snipMate#TriggerSnippet()<CR>
snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<CR>
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>
nmap <silent> <leader>a <Plug>(ale_next_wrap)
map <leader>ss :setlocal spell!<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
map <leader>cc :botright cope<CR>
map <leader>co ggVGy:tabnew<CR>:set syntax=qf<CR>pgg
map <leader>n :cn<CR>
map <leader>p :cp<CR>
map <S-Y> :source ~/.vimrc<CR>
map <S-y> :source ~/.vimrc<CR>
autocmd VimEnter * tab all
autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'
function Eval_line( )
 :let start=line('.')
 :exe "!eval" getline(start)
endfunction
map <F3> :call Eval_line()<CR>
filetype plugin indent on
autocmd BufEnter * :cd %:p:h
autocmd BufReadPost * 
\ if line("'\"") > 0 && line("'\"") <= line("$") | 
\   exe "normal g`\"" | 
\ endif
set guifont=Courier_N_CE_/_Latin_2:h10:cEASTEUROPE
map <F2> :set number!<Bar>set number?<CR>
imap <F2> :set nu!<CR>
set autowrite
set hls
set wrap
set textwidth=0
set splitbelow
set splitright
set wildmode=longest,list
vnoremap > >gv
vnoremap < <gv
set tabstop=3
set shiftwidth=3
set noexpandtab
set lcs=eol:\ ,tab:·\ ,trail:@
set display+=lastline
set whichwrap=b,s,<,>,h,l
set incsearch
set background=dark
set undodir=~/.vim/undodir
set undofile
set shiftround
set shiftwidth=4
set tabstop=4
set complete-=i
set lazyredraw
set display+=lastline
set encoding=utf-8 nobomb
set linebreak
set scrolloff=1
set sidescrolloff=5
set wrap
set laststatus=2
set wildmenu
set tabpagemax=50
set cursorline
set noerrorbells
set visualbell
set title
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set autoread
set backspace=indent,eol,start
set confirm
set dir=~/.vim/cache
set formatoptions+=j
set hidden
set nomodeline
set noswapfile
set nrformats-=octal
set wildignore+=.pyc,.swp
let mapleader=","
set spelllang=en_us
set ttyfast
set esckeys
set nostartofline
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set t_Co=256
let g:molokai_original=0
hi link javascriptType Keyword
hi link colorColumn FoldColumn
hi link LineNr Comment
hi link OverLeength Error
if has('gui_running')
	" Font
	set gfn:Monaco:h14
	set transp=0
	" Toolbar and scrollbars
	set guioptions-=T       " Remove toolbar
	set guioptions-=L       " Left scroll bar
	set guioptions-=r       " Right scroll bar
	set guioptions-=b       " Bottom scroll bar
	set guioptions-=h       " Only calculate bottom scroll size of current line
	set shortmess=atI       " Don't show the intro message at start and
	                        " truncate msgs (avoid press ENTER msgs).
endif
set laststatus=2
set numberwidth=5
set report=0
set showmode
set showcmd
set showmatch
set scrolloff=5
set sidescrolloff=7
set sidescroll=1
if has('title') && (has('gui_running') || &title)
	set titlestring=
	set titlestring+=%f
	set titlestring+=%h%m%r%w
	set titlestring+=\ -\ %{v:progname}
	set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif
set wildchar=<TAB>
set wildmode=list:longest
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif
set wildignore+=*/coverage
set diffopt=filler
set diffopt+=iwhite
set foldmethod=manual
set foldnestmax=3
set nofoldenable
set listchars=tab:▹\ ,trail:·,nbsp:⚋
set fillchars=fold:-
set list
set noerrorbells
set copyindent
map <C-q> :qa<CR>
map <C-Q> :qa<CR>
map <C-S> :wall!<CR>:echo "Saved! (to quit click F10)"<CR>
map <C-s> :wall!<CR>:echo "Saved! (to quit click F10)"<CR>
