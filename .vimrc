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

" Enable cursor line
set cursorline

" Disable line wrapping
set nowrap

" Enable search highlighting
set hlsearch
set incsearch

" Set search options
set ignorecase
set smartcase

" Enable 24-bit terminal colors
set termguicolors

" Set default color scheme
colorscheme gruvbox
