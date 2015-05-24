set nocompatible

call plug#begin()
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
call plug#end()

set noshowmode
set laststatus=2

set background=dark
colorscheme base16-default
