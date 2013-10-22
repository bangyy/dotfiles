"----------------------------------------
"" plugin - NeoBundle
"----------------------------------------
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  set shortmess+=I
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/scrooloose/nerdcommenter.git'
"NeoBundle 'git://github.com/msanders/snipmate.vim.git'
"NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'git://github.com/vim-scripts/YankRing.vim.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'git://github.com/mileszs/ack.vim.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/othree/html5.vim.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'git://github.com/othree/eregex.vim.git'
NeoBundle 'git://github.com/tpope/vim-repeat.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/leafgarland/typescript-vim.git'
NeoBundle 'git://github.com/kana/vim-smartchr.git'
NeoBundle 'git://github.com/rhysd/accelerated-jk.git'
NeoBundle 'git://github.com/vim-scripts/Align.git'
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'git://github.com/jiangmiao/simple-javascript-indenter.git'
NeoBundle 'git://github.com/jelera/vim-javascript-syntax.git'
NeoBundle 'git://github.com/teramako/jscomplete-vim.git'
NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
NeoBundle 'git://github.com/Shougo/neosnippet.git'
NeoBundle 'git://github.com/vim-scripts/snipmate-snippets.git'

filetype plugin indent on

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
set splitright

set textwidth=0
"http://d.hatena.ne.jp/WK6/20120606/1338993826
autocmd FileType text setlocal textwidth=0
set wrap
set ambiwidth=double

syntax on
syntax enable
set t_Co=256

set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
highlight Comment ctermfg=DarkCyan

set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=2
set expandtab
set smarttab

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp,ucs-2le,ucs-2

"http://d.hatena.ne.jp/yuroyoro/20101104/1288879591
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
    autocmd!
    autocmd WinLeave * setlocal nocursorline
    autocmd WinEnter,BufRead * setlocal cursorline
augroup END

" ファイルタイプ別インデント、プラグインを有効にする
filetype plugin indent on
" カーソル位置を記憶する
augroup CursorPos
    autocmd!
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
augroup END

set hidden
set clipboard=unnamed
au BufEnter * execute ":lcd " . expand("%:p:h") 

source $VIMRUNTIME/macros/matchit.vim

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

"filetype plugin on

augroup Dict
  autocmd!
  autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType php,inc setlocal dictionary+=~/.vim/dict/php.dict
  autocmd FileType javascript setlocal dictionary+=~/.vim/dict/javascript.dict
augroup END

"pathoge.vim
"call pathogen#runtime_append_all_bundles()

"neocomplecache
let g:neocomplcache_enable_at_startup = 1

let g:NeoComplCache_MaxTryKeywordLength=100
let g:neocomplcache_enable_underbar_completion = 1
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
if !exists('g:neocomplcache_same_filetype_lists')
    let g:neocomplcache_same_filetype_lists = {}
endif
let g:neocomplcache_same_filetype_lists['html'] = 'xhtml,javascript'

" NERD_tree
"let g:NERDTreeShowHidden = 1
"let g:NERDChristmasTree = 1
"let g:NERDTreeShowFiles = 1
"nnoremap ,t :NERDTree<CR>

"unite.vim
nnoremap <Space>f :Unite file<CR>
nnoremap <Space>u :Unite buffer<CR>
nnoremap <Space>o :Unite outline<CR>
"let g:unite_enable_split_vertically=1
let g:unite_enable_start_insert=1
let g:unite_winwidth=40

"NERD_commenter.vim
let g:NERDCreateDefaultMappings = 0
let NERDShutUp = 1
"let NERDSpaceDelims = 1
map ,c<space> <plug>NERDCommenterToggle
" C-_ map works as C-/
" http://vim.1045645.n5.nabble.com/How-to-map-Ctrl-td1192843.html
map <C-_> <plug>NERDCommenterToggle
vmap /s <Plug>NERDCommenterSexy
vmap /b <Plug>NERDCommenterMinimal

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
let g:vimfiler_as_default_explorer = 1
command! Vf VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
augroup MyVimFiler
    autocmd!
    autocmd FileType vimfiler nunmap <buffer> <C-l>
    autocmd FileType vimfiler nunmap <buffer> <C-j>
    autocmd FileType vimfiler nunmap <buffer> <S-l>
    autocmd FileType vimfiler nunmap <buffer> <S-h>
augroup END

augroup Template
  autocmd!
  autocmd BufNewFile *.php,*.inc 0r ~/.vim/template/template.php
  autocmd BufNewFile *.html,*.tpl 0r ~/.vim/template/template.html
  autocmd BufNewFile *.py,*.tpl 0r ~/.vim/template/template.py
augroup END

"colorscheme solarized
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

"jslint.vim
"let $JS_CMD='node'
"nnoremap cn :cn<CR>
augroup MyJsLint
    autocmd!
    autocmd FileType javascript call s:javascript_filetype_settings()
    autocmd FileType javascript nnoremap <buffer> s :call jslint#check()<CR>
augroup END

function! s:javascript_filetype_settings()
    autocmd BufLeave     nnoremap <buffer> call jslint#clear()
    autocmd BufWritePost nnoremap <buffer> call jslint#check()
    autocmd CursorMoved  <nnoremap buffer> call jslint#message()
endfunction

"accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"vim-powerline
let g:Powerline_symbols = 'fancy'

"align.vim
let g:Align_xstrlen=3

"vim-fugitive.git
nnoremap <silent> <Space>gb :Gblame<CR>
nnoremap <silent> <Space>gd :Gdiff<CR>
nnoremap <silent> <Space>gs :Gstatus<CR>
nnoremap <silent> <Space>gl :Glog<CR>
nnoremap <silent> <Space>ga :Gwrite<CR>
nnoremap <silent> <Space>gc :Gcommit<CR>
nnoremap <silent> <Space>gC :Git commit --amend<CR>

"syntastic
" このようにするとjshintを必ず使ってチェックしてくれるようになる
let g:syntastic_mode_map = {
            \ 'mode': 'active',
            \ 'active_filetypes': ['javascript', 'php', 'ruby', 'css'],
            \ 'passive_filetypes': ['html', 'xml']
            \ }
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checker = "jshint"

"http://layzie.hatenablog.com/entry/20130122/1358811539
"Simple-Javascript-Indenter
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1

"http://layzie.hatenablog.com/entry/20130122/1358811539
"jscomplete-vim
" DOMとMozilla関連とES6のメソッドを補完
let g:jscomplete_use = ['dom', 'moz', 'es6th']

" neosnippet.vim
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'
set completeopt-=preview

"function! HighLightZenkakuSpace()
    "syntax match ZenkakuSpace /　/ display containedin=ALL
    "highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=lightblue
"endf

"function! HighLightHankakuSpace()
    "syntax match HankakuSpace / / display containedin=ALL
    "highlight HankakuSpace cterm=underline ctermfg=darkgray guibg=darkgray
"endf

"augroup highlightSpace
  "autocmd!
  "autocmd BufNew,BufRead * call HighLightZenkakuSpace()
  "autocmd BufNew,BufRead * call HighLightHankakuSpace()
"augroup END

"augroup highlightHankakuSpace
  "autocmd!
  "autocmd VimEnter,ColorScheme * highlight HankakuSpace cterm=underline ctermfg=darkgray guibg=darkgray
  "autocmd VimEnter,WinEnter * match HankakuSpace / /
"augroup END

augroup highlightZenkakuSpace
  autocmd!
  autocmd VimEnter,ColorScheme * highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=lightblue
  autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
augroup END
