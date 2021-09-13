function! ChangeBackground()

	if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
		set termguicolors background=dark
		color gruvbox-material
	else
		color default
		set background=light
		hi! Visual ctermfg=None ctermbg=253
		hi! ColorColumn ctermbg=255
		hi! link Search Todo
		hi! Comment ctermfg=7
	endif

endf

call ChangeBackground()

if has('nvim')
	autocmd Signal SIGUSR1 call ChangeBackground()
end
