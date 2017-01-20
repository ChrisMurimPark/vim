" Leader
:let mapleader=' '

" Line numbers and tabs
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Full stack config tab
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

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
Bundle 'scrooloose/nerdtree'
call vundle#end()

" Hot keys
map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>
map <leader>nt :NERDTreeToggle<cr>
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
		set number
	else
		set relativenumber
	endif
endfunc

