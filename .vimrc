"
"                             ________ ++     ________
"                            /VVVVVVVV\++++  /VVVVVVVV\
"                            \VVVVVVVV/++++++\VVVVVVVV/
"                             |VVVVVV|++++++++/VVVVV/'
"                             |VVVVVV|++++++/VVVVV/'
"                            +|VVVVVV|++++/VVVVV/'+
"                          +++|VVVVVV|++/VVVVV/'+++++
"                        +++++|VVVVVV|/VVVVV/'+++++++++
"                          +++|VVVVVVVVVVV/'+++++++++
"                            +|VVVVVVVVV/'+++++++++
"                             |VVVVVVV/'+++++++++
"                             |VVVVV/'+++++++++
"                             |VVV/'+++++++++
"                             'V/'   ++++++
"                                      ++
"

" Use the recommended default options
" See `:help vimrc-intro`
source $VIMRUNTIME/defaults.vim

" Add packages
packadd! matchit

" Enable line numbers
set number
set relativenumber

" Set cursor options
set cursorline
set scrolloff=4
set sidescrolloff=4

" Disable line wrapping
set nowrap

" Enable search highlighting
set hlsearch
set incsearch

" Set search options
set ignorecase
set smartcase

" Configure split windows
set splitright
set splitbelow

" Use 24-bit terminal colors
set termguicolors

" Set dark background
set background=dark

" Set default color scheme
colorscheme retrobox
