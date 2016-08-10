" Line numbers and tabs
set number
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2

" Syntax highlighting
syntax enable
set background=dark
colorscheme solarized

" Configuring Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on

" Plugins
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized' 


" Hot keys
map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>
nnoremap <C-n> :call LineNumberToggle()<cr>

""""""" FUNCTIONS

" Window movement shortcuts
function! WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if (match(a:key,'[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

" Switch between relative and absolute line numbers
function! LineNumberToggle()
	if (&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc

