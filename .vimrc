if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('~/.vim/dein')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " TOML を読み込み、キャッシュしておく
  let s:toml      = '~/.vim/dein.toml'
  let s:lazy_toml = '~/.vim/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp,ucs-2le,ucs-2

scriptencoding utf-8

set vb t_vb=
set visualbell
set noerrorbells
set fileformats=unix,dos,mac
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
set wrap
set ambiwidth=double

syntax on
syntax enable
set t_Co=256

"set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
"highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
"highlight Comment ctermfg=DarkCyan

set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

set undodir=~/.vimundo

"http://d.hatena.ne.jp/yuroyoro/20101104/1288879591
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
    autocmd!
    autocmd WinLeave * setlocal nocursorline
    autocmd WinEnter,BufRead * setlocal cursorline
augroup END

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
"au BufEnter * execute ":lcd " . expand("%:p:h") 

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

nnoremap <C-m> za

nnoremap ,s<Space> :source $MYVIMRC<CR>
inoremap <expr><CR> pumvisible() ? "\<C-y>\<CR>X\<BS>" : "\<CR>X\<BS>"

"http://deris.hatenablog.jp/entry/2013/05/15/024932
nnoremap /  /\v

augroup Markdown
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

augroup Dict
  autocmd!
  autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType php,inc setlocal dictionary+=~/.vim/dict/php.dict
  autocmd FileType javascript setlocal dictionary+=~/.vim/dict/javascript.dict
augroup END

function! HighLightZenkakuSpace()
    syntax match ZenkakuSpace /　/ display containedin=ALL
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=lightblue
endf

function! HighLightHankakuSpace()
    syntax match HankakuSpace / / display containedin=ALL
    highlight HankakuSpace cterm=underline ctermfg=darkgray guibg=darkgray
endf

augroup highlightSpace
  autocmd!
  autocmd BufNew,BufRead * call HighLightZenkakuSpace()
  "autocmd BufNew,BufRead * call HighLightHankakuSpace()
augroup END

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces cterm=underline guibg=darkgray ctermfg=darkgray
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+/
augroup END

augroup CommentOutOptionsDisable
  autocmd!
  autocmd Filetype * set formatoptions-=ro
augroup END

for rc in glob('~/.vim/rc/*', 1, 1)
  execute "source " . rc
endfor
