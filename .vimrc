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

" Use the recommended default options
" See `:help vimrc-intro`
source $VIMRUNTIME/defaults.vim

" Add packages
packadd! matchit

" Save backup files
set backup
set backupdir=~/.vim/backup//,.,/tmp

" Save undo history
set undofile
set undodir=~/.vim/undo//,.,/tmp

" Set line numbers
set number

" Set indent options
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Set search options
set hlsearch
set incsearch
set ignorecase
set smartcase
