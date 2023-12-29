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

" Set tab and indentation
set tabstop=4
set shiftwidth=4
set noexpandtab

" Use 24-bit terminal colors
set termguicolors

" Set default color scheme
let g:gruvbox_italic=1
colorscheme gruvbox
