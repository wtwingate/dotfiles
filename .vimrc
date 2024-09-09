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
packadd! comment
packadd! editorconfig
packadd! matchit

" Save backup files
set backup
set backupdir=~/.vim/backup//,.,/tmp

" Save undo history
set undofile
set undodir=~/.vim/undo//,.,/tmp

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

" Enable status line
set laststatus=2
