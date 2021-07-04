set nocompatible

source ~/.vimrc.plug

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=light
colorscheme onehalflight

set cursorline
set laststatus=2

set noshowmode
let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1
