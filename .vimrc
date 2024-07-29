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

" Set line wrap options
set nowrap
set linebreak
set breakindent

" Set search options
set hlsearch
set incsearch
set ignorecase
set smartcase
