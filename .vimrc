set nocompatible
set fileformats=unix,dos,mac
set vb t_vb=
set backspace=indent,eol,start

set nobackup
set writebackup
set history=100
set ignorecase
set smartcase
set wrapscan
set noincsearch
set autoindent
set cindent
set smartindent

set title
set number
set ruler
set showcmd
set laststatus=2
set showmatch
set matchtime=2
set hlsearch
set wildmenu

set textwidth=0
set wrap
set ambiwidth=double

syntax on
set t_Co=256

set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
highlight Comment ctermfg=DarkCyan

set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab 

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2

"http://d.hatena.ne.jp/yuroyoro/20101104/1288879591
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END

if has("autocmd")
    " ファイルタイプ別インデント、プラグインを有効にする
    filetype plugin indent on
    " カーソル位置を記憶する
    autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal g`\"" |
  \ endif
endif

set hidden
set shortmess+=I
set clipboard=unnamed
au BufEnter * execute ":lcd " . expand("%:p:h") 

map j gj
map k gk
nnoremap <S-h> gT
nnoremap <S-l> gt
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap : ;
noremap ; :

nnoremap <Space>n :new
nnoremap <Space>v :vnew
nnoremap <Space>t :tabnew
nnoremap <Space>te :tabnew<CR>

"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

nnoremap ,s<Space> :source $MYVIMRC<CR>
inoremap <expr><CR> pumvisible() ? "\<C-y>\<CR>X\<BS>" : "\<CR>X\<BS>"

filetype plugin on

autocmd FileType ruby setl tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType php,inc :set dictionary=~/.vim/dict/php.dict
autocmd FileType javascript :set dictionary=~/.vim/dict/javascript.dict

"pathoge.vim
call pathogen#runtime_append_all_bundles()

"neocomplecache
let g:neocomplcache_enable_at_startup = 1

let g:NeoComplCache_MaxTryKeywordLength=100
let g:neocomplcache_enable_underbar_completion = 1
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" NERD_tree
let g:NERDTreeShowHidden = 1
"let g:NERDChristmasTree = 1
"let g:NERDTreeShowFiles = 1
nnoremap ,t :NERDTree<CR>

"unite.vim
nnoremap <Space>f :Unite file<CR>
nnoremap <Space>u :Unite buffer<CR>
"let g:unite_enable_split_vertically=1
let g:unite_winwidth=40

"NERD_commenter.vim
let g:NERDCreateDefaultMappings = 0
let NERDShutUp = 1
"let NERDSpaceDelims = 1
map ,c<space> <plug>NERDCommenterToggle
vmap ,s<space> <Plug>NERDCommenterSexy
vmap ,b<space> <Plug>NERDCommenterMinimal

"vimshell
"nnoremap <Space>s :VimShellTab<CR>
nnoremap si :VimShell<CR>
nnoremap st :VimShellTab<CR>
nmap <buffer> sv <Plug>(vimshell_split_switch)
"nmap <buffer> <Space>s <Plug>(vimshell_split_switch)
let g:vimshell_prompt = '$ '
let g:vimshell_user_prompt = '"[" . $USER . "@" . hostname() . ": " . getcwd() . "]"'
"let g:vimshell_split_command = "vsplit"
"https://github.com/eagletmt/dotfiles/blob/master/dot.vimrc
augroup MyVimShell
    autocmd!
    autocmd FileType vimshell nunmap <buffer> q
    autocmd FileType vimshell nunmap <buffer> <C-n>
    autocmd FileType vimshell nunmap <buffer> <C-p>
    autocmd FileType vimshell nunmap <buffer> <C-l>
    autocmd FileType vimshell nnoremap <buffer> q :close<CR>
augroup END

"vimfiler
"let g:vimfiler_as_default_explorer = 1

autocmd BufNewFile *.php,*.inc 0r ~/.vim/template/template.php
autocmd BufNewFile *.html,*.tpl 0r ~/.vim/template/template.html
autocmd BufNewFile *.py,*.tpl 0r ~/.vim/template/template.py

"colorscheme lucius
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

"jslint.vim
"let $JS_CMD='node'
"nnoremap cn :cn<CR>
augroup MyGroup
    autocmd! MyGroup
    autocmd FileType javascript call s:javascript_filetype_settings()
    autocmd FileType javascript nnoremap <buffer> s :call jslint#check()<CR>
augroup END

function! s:javascript_filetype_settings()
    autocmd BufLeave     <buffer> call jslint#clear()
    autocmd BufWritePost <buffer> call jslint#check()
    autocmd CursorMoved  <buffer> call jslint#message()
endfunction

"vim-powerline
"let g:Powerline_symbols = 'fancy'

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
highlight HankakuSpace cterm=underline ctermfg=darkgray guibg=darkgray
match HankakuSpace / /
