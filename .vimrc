"
"                            ________ ++     ________
"                           /VVVVVVVV\++++  /VVVVVVVV\
"                           \VVVVVVVV/++++++\VVVVVVVV/
"                            |VVVVVV|++++++++/VVVVV/'
"                            |VVVVVV|++++++/VVVVV/'
"                           +|VVVVVV|++++/VVVVV/'+
"                         +++|VVVVVV|++/VVVVV/'+++++
"                       +++++|VVVVVV|/VVVVV/'+++++++++
"                         +++|VVVVVVVVVVV/'+++++++++
"                           +|VVVVVVVVV/'+++++++++
"                            |VVVVVVV/'+++++++++
"                            |VVVVV/'+++++++++
"                            |VVV/'+++++++++
"                            'V/'   ++++++
"                                     ++
"
"        _      ________   __  _  ____  _   ________  ______  _____
"       | | /| / /  _/ /  / / ( )/ __/ | | / /  _/  |/  / _ \/ ___/
"       | |/ |/ // // /__/ /__|/_\ \   | |/ // // /|_/ / , _/ /__
"       |__/|__/___/____/____/ /___/   |___/___/_/  /_/_/|_|\___/
"
"
" Made with love by William Wingate
"
" Use the recommended default settings
" See `:help defaults.vim-explained`
source $VIMRUNTIME/defaults.vim

" Add packages
packadd! matchit

" General options
set number
set relativenumber
set nowrap
set hlsearch
set incsearch
set ignorecase
set smartcase

" Status line
set laststatus=2

" Save backup files
set backup
set backupdir=~/.vim/backup//

" Save undo history
set undofile
set undodir=~/.vim/undo//
