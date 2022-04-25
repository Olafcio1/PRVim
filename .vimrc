" PRVim - Programming Ready Vim
" PRVim is Vim with special config to make Vim 'programming ready', like an IDE.

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set number
set mouse=a
set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
filetype indent on
set laststatus=2

nnoremap bash_example i#!/usr/bin/env bash<ESC>o<ESC>ofunction run(){<ESC>o<ESC>o}<ESC>o<ESC>run<ESC>ki<S-TAB>
nnoremap bash_run :!chmod +x % && source %

call plug#begin()
" ALE
Plug 'dense-analysis/ale'
" vim-easy-align
Plug 'junegunn/vim-easy-align'
" NERDTree
Plug 'scrooloose/nerdtree'
" FZF
Plug 'junegunn/fzf.vim'
" Vim-Startify
Plug 'mhinz/vim-startify'
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   Latest files']                   },
            \ { 'type': 'dir',       'header': ['   Latest files in this directory'] },
            \ { 'type': 'sessions',  'header': ['   Sessions']                       },
            \ { 'type': 'commands',  'header': ['   Utility commands']               },
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
            \ '|  ___/|  _  / \ \/ / | | |_ ` _ \ ',
            \ '| |    | | \ \  \  /  | | | | | | |',
            \ '|_|    |_|  \_\  \/   |_|_| |_| |_|',
            \ ]
" tabbar
Plug 'humiaozuzu/tabbar'
" DelimitMate
Plug 'raimondi/delimitmate'
" Vim-CSS-Color
Plug 'ap/vim-css-color'
" Vim-Airline
Plug 'bling/vim-airline'
" NERDTree-Git-Plugin
Plug 'xuyuanp/nerdtree-git-plugin'
" vim-healthcheck
Plug 'rhysd/vim-healthcheck'
" CtrlP and CtrlP addons
Plug 'vim-scripts/ctrlp.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'tacahiroy/ctrlp-funky'
Plug 'davidegx/ctrlp-smarttabs'
Plug 'tacahiroy/ctrlp-ssh'
Plug 'okcompute/vim-ctrlp-session'
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
call plug#end()
