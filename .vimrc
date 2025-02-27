"
"                         ________ ++     ________
"                        /VVVVVVVV\++++  /VVVVVVVV\
"                        \VVVVVVVV/++++++\VVVVVVVV/
"                         |VVVVVV|++++++++/VVVVV/'
"                         |VVVVVV|++++++/VVVVV/'
"                        +|VVVVVV|++++/VVVVV/'+
"                      +++|VVVVVV|++/VVVVV/'+++++
"                    +++++|VVVVVV|/VVVVV/'+++++++++
"                      +++|VVVVVVVVVVV/'+++++++++
"                        +|VVVVVVVVV/'+++++++++
"                         |VVVVVVV/'+++++++++
"                         |VVVVV/'+++++++++
"                         |VVV/'+++++++++
"                         'V/'   ++++++
"                                  ++
"

" Use the recommended defaults
source $VIMRUNTIME/defaults.vim

" Add packages
packadd! matchit

" Enable line numbers
set number
set relativenumber

" Set tabstop options
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Set search options
set hlsearch
set incsearch
set ignorecase
set smartcase

" Save backup files
set backup
set backupdir=~/.vim/backup//

" Save undo history
set undofile
set undodir=~/.vim/undo//
