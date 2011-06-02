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
highlight Comment ctermfg=DarkCyan
set wildmenu

set textwidth=0
set wrap

syntax on
set t_CO=256
colorscheme wombat256


highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
highlight HankakuSpace cterm=underline ctermfg=darkgray guibg=darkgray
match HankakuSpace / /

set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

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

":hi clear CursorLine
"highlight CursorLine ctermbg=lightgray
                   
"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

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

"pathoge.vim
call pathogen#runtime_append_all_bundles()

map tl gt
map th gT


map gl <C-w>l
map gh <C-w>h
map <C-h> gT
map <C-l> gt
"map <Space> <PageDown>

map j gj
map k gk

noremap : ;
noremap ; :

nnoremap <Space>n :new
nnoremap <Space>v :vnew
nnoremap <Space>t :tabnew
nnoremap <Space>te :tabnew<CR>

inoremap <expr><CR> pumvisible() ? "\<C-y>\<CR>X\<BS>" : "\<CR>X\<BS>"


autocmd FileType php,inc :set dictionary=~/.vim/dict/php.dict
autocmd FileType javascript :set dictionary=~/.vim/dict/javascript.dict

filetype plugin on

"neocomplecache
let g:neocomplcache_enable_at_startup = 1
"let g:NeoComplCache_DictionaryFileTypeLists = {
"            \ 'default' : '',
"            \ 'vimshell' : $HOME.'/.vimshell_hist',
"            \ 'php' : $HOME.'/.vim/dict/PHP.dict',
"            \ 'inc' : $HOME.'/.vim/dict/PHP.dict',
"            \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
"            \ 'scheme' : $HOME.'/.gosh_completions'
"            \ }

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


autocmd BufNewFile *.php,*.inc 0r ~/.vim/template/template.php
autocmd BufNewFile *.html,*.tpl 0r ~/.vim/template/template.html
autocmd BufNewFile *.py,*.tpl 0r ~/.vim/template/template.py
