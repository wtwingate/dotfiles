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
"

" Use the recommended defaults
source $VIMRUNTIME/defaults.vim

" Add packages
packadd! matchit

" Save undo history
set undofile
set undodir=~/.vim/undo//

" Save backup files
set backup
set backupdir=~/.vim/backup//

" Set line options
set number
set wrap
set linebreak
set breakindent

" Set cursor options
set cursorline
set scrolloff=1

" Set tab options
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Set search options
set hlsearch
set incsearch
set ignorecase
set smartcase
