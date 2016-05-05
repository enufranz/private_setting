if has('vim_starting')
	if &compatible
		set nocompatible               " Be iMproved
	endif

	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	NeoBundle 'Shougo/vimproc', {
		\ 'build' : {
			\ 'windows' : 'make -f make_mingw32.mak',
			\ 'cygwin' : 'make -f make_cygwin.mak',
			\ 'mac' : 'make -f make_mac.mak',
			\ 'unix' : 'make -f make_unix.mak',
		\ },
	\ }
	NeoBundle 'VimClojure'
	NeoBundle 'Shougo/vimshell'
	NeoBundle 'Shougo/neomru.vim'
	NeoBundle 'Shougo/unite.vim'
	NeoBundle 'Shougo/unite-outline'
	NeoBundle 'ujihisa/unite-colorscheme'
	NeoBundle "Shougo/neocomplete.vim"
	NeoBundle "thinca/vim-quickrun"
	NeoBundle 'vim-scripts/SearchComplete'
	NeoBundle 'Lokaltog/vim-easymotion'
	NeoBundle 'itchyny/lightline.vim'
call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"--------------------------------------
"	settings about shortcuts 
"-------------------------------------

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ubd :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ufr :<C-u>Unite file_rec/async<CR>
nnoremap <silent> ,ufm :<C-u>Unite file_mru<CR>
nnoremap <silent> ,ug :<C-u>Unite grep<CR>
nnoremap <silent> ,uo :<C-u>Unite outline<CR>
nnoremap <silent> ,vsc :<C-u>VimShellCreate<CR>

"Easy Motion
"Cited from  http://haya14busa.com/mastering-vim-easymotion/
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)

"For lightline
set laststatus=2
let g:lightline = { 'colorscheme': 'wombat' }
if !has('gui_running')
	set t_Co=256
endif

"Other settings
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

"Search by astar in select-mode
vnoremap * "zy:let @/ = @z<CR>n

"Indent for programming
augroup vimrc-cpp
	autocmd!
	autocmd FileType c call s:cpp()
	autocmd FileType cpp call s:cpp()
augroup END

"For programming
function! s:cpp()
	setlocal cindent
	setlocal cinoptions=g-1
endfunction
