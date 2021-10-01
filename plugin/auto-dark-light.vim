function! ChangeBackground()

	if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
		if expand(g:auto_dark_light_dark_tgc)
			set termguicolors
		end
		set background=dark
		exe 'color '.g:auto_dark_light_dark_theme
	else
		if expand(g:auto_dark_light_light_tgc)
			set termguicolors
		end
		set background=light
		exe 'color '.g:auto_dark_light_light_theme
		" hi! Visual ctermfg=None ctermbg=253
		" hi! ColorColumn ctermbg=255
		" hi! link Search Todo
		" hi! Comment ctermfg=7
	endif

endf

call ChangeBackground()

if has('nvim')
	autocmd Signal SIGUSR1 call ChangeBackground()
end
