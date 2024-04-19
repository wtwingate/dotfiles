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

" Enable 24-bit terminal colors
set termguicolors

" Set default color scheme
let g:gruvbox_italic=1
colorscheme gruvbox
