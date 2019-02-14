set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set number
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Change default split orientation
set splitbelow
set splitright


" Terminal Commands
nnoremap ,s <C-w>s
nnoremap ,v <C-w>v 
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Map shortcut keys
nnoremap , :

" Map keys for copying to clipboard
vnoremap ,y  "+y
nnoremap ,Y  "+yg_
nnoremap ,y  "+y
nnoremap ,yy  "+yy

" " Paste from clipboard
nnoremap ,p "+p
nnoremap ,P "+P
vnoremap ,p "+p
vnoremap ,P "+P

" Remap keys for easy motion
map <Space><Space> <Plug>(easymotion-prefix)
hi EasyMotionTarget         ctermbg=none  ctermfg=82
hi EasyMotionTarget2First   ctermbg=none  ctermfg=82
hi EasyMotionTarget2Second  ctermbg=none  ctermfg=82

" Custom ignore for CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" VIM Plug - use :PlugInstall to install plugins
" Specify directory for plugins 
" some plugins from Vundle etc require ":source %" before installing
call plug#begin('~/.local/share/nvim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'BrainDeath0/Hypsteria'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'HerringtonDarkholme/yats.vim',      { 'for': ['typescript', 'typescriptreact'] }
Plug 'mhartington/nvim-typescript',       { 'do': './install.sh', 'for': ['typescript', 'typescriptreact'] }

call plug#end()
