" Use the recommended default settings
source $VIMRUNTIME/defaults.vim

" Add packages
packadd! matchit
packadd! editorconfig

" Save backup files
set backup
set backupdir=~/.vim/backup//

" Save undo history
set undofile
set undodir=~/.vim/undo//

" Enable status line
set laststatus=2

" Enable line numbers
set number
set relativenumber

" Enable cursor line
set cursorline

" Set tab stops and indentation
set tabstop=4
set shiftwidth=4
set noexpandtab

" Set line wrap and break
set nowrap
set linebreak
set breakindent

" Set search and highlight
set hlsearch
set incsearch
set ignorecase
set smartcase

" Use 24-bit terminal colors
set termguicolors

" Set default background color
set background=dark

" Set default color scheme
colorscheme retrobox
