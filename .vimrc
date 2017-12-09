" Leader
:let mapleader=' '

" Line numbers and tabs
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

call plug#begin('~/.vim/plugged')
" Plugins
Plug 'altercation/vim-colors-solarized' 
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
call plug#end()

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

