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
packadd! comment
packadd! editorconfig
packadd! hlyank
packadd! matchit

" Enable line numbers
set number
set relativenumber

" Set cursor options
set cursorline
set scrolloff=2

" Set indentation options
set shiftwidth=2
set softtabstop=-1
set expandtab

" Set line wrap options
set wrap
set linebreak
set breakindent

" Set search options
set hlsearch
set incsearch
set ignorecase
set smartcase

" Set status line options
set laststatus=2

" Save backup files
set backup
set backupdir=~/.vim/backup//

" Save undo history
set undofile
set undodir=~/.vim/undo//

" Set color scheme
set termguicolors
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
