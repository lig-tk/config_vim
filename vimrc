" ***********************************
" __     ___
" \ \   / (_)_ __ ___
"  \ \ / /| | '_ ` _ \
"   \ V / | | | | | | |
"    \_/  |_|_| |_| |_|
"
" UPDATE: 2016-05-25
" ***********************************
if !&compatible
  set nocompatible
endif

filetype off
filetype plugin indent off

set fileformats=unix,dos,mac
set fileencoding=utf-8
set fileencodings=utf-8,sjis,japan,iso-2022-jp

let g:netrw_liststyle=3
let g:netrw_home='~/.vim/tmp/ETC'
set backupdir=~/.vim/tmp/BAK
set directory=~/.vim/tmp/SWP
set undodir=~/.vim/tmp/UND
set viminfo='50,\"1000,:0,n~/.vim/tmp/ETC/.viminfo'

set clipboard=unnamed,autoselect

set rtp+=$HOME/.vim/
runtime! rc/*.vim

set number
set ruler
set cmdheight=4
set laststatus=2
set title
set linespace=1
set showcmd
set wildmenu
set wildmode=list:longest,full

" カラー設定:
set t_Co=256
syntax on
set background=dark
colorscheme hybrid_material

set whichwrap=h,l

set hidden
set confirm

set list
set listchars=eol:$,tab:>-,trail:_,extends:<

augroup cch
	autocmd! cch
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
augroup END
set cursorcolumn
set cursorline
hi clear CursoeColumn
hi clear CursorLine
hi CursorLine gui=underline
highlight CursorColumn ctermbg=236 guibg=black
highlight CursorLine ctermbg=236 guibg=black
set fillchars=vert:\|
set foldmethod=marker
hi Folded gui=bold term=standout ctermfg=Blue guibg=blue guifg=black
hi FoldColumn gui=bold term=standout ctermfg=Blue guibg=Grey guifg=black
" tab & line end string display on

set showmatch
set backspace=indent,eol,start

" tab
set tabstop=4
" set softtabstop=2
" set expandtab
set smarttab
set shiftwidth=4
set shiftround
set nowrap
function! s:toggle_indent()
	if &tabstop == 2
		setlocal nowrap tabstop=1 shiftwidth=4 noexpandtab
	else
		setlocal nowrap tabstop=2 shiftwidth=2 expandtab
	endif
endfunction
nnoremap <silent> <Space><Tab> :<C-u>call <SID>toggle_indent()<CR>

" indent
set autoindent
set cindent
set nosmartindent


" Enable folding.
set foldenable
set foldmethod=marker
set foldcolumn=5


" WINDOW
set splitbelow
set splitright
" ウィンドウ分割時にウィンドウサイズを調節する。Shiftキー ＋ 矢印キー
nnoremap <silent> <S-Left>  :5wincmd <<CR>
nnoremap <silent> <S-Right> :5wincmd ><CR>
nnoremap <silent> <S-Up>    :5wincmd -<CR>
nnoremap <silent> <S-Down>  :5wincmd +<CR>
noremap gn :tabnew<CR>
noremap gh gT
noremap gl gt
set showtabline=2
set guioptions-=e


" SEARCH
set ignorecase
set wrapscan
set hlsearch
" インクリメンタルサーチを行う
set incsearch
set grepprg=grep\ -nH
" 検索結果ハイライト解除
nnoremap <ESC><ESC> :nohlsearch<CR>
" 検索結果に移動した時、その位置を画面の中央に変更
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <silent> <S-Left>  :5wincmd <<CR>
nnoremap <silent> <S-Right> :5wincmd ><CR>
nnoremap <silent> <S-Up>    :5wincmd -<CR>
nnoremap <silent> <S-Down>  :5wincmd +<CR>
set scrolloff=3


au BufNewFile,BufRead *.ejs setf html