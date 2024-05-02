" Use MonoLisa as default GUI font
set guifont=MonoLisa:h16

" Set background color based on system appearance
func! ChangeBackground()
	if (v:os_appearance == 1)
		set background=dark
		colorscheme catppuccin_mocha
	else
		set background=light
		colorscheme catppuccin_latte
	endif
	" redraw!
endfunc

augroup MACVIM
	autocmd!
	autocmd OSAppearanceChanged * call ChangeBackground()
augroup END
