"neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
if !exists('g:neocomplete#same_filetype_lists')
    let g:neocomplete#same_filetype_lists = {}
endif
let g:neocomplete#same_filetype_lists['html'] = 'xhtml,javascript'
"let g:NeoComplCache_MaxTryKeywordLength=100
"let g:neocomplcache_enable_underbar_completion = 1

"neocomplecache
"let g:neocomplcache_enable_at_startup = 1
"let g:NeoComplCache_MaxTryKeywordLength=100
"let g:neocomplcache_enable_underbar_completion = 1
"" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"    let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"if !exists('g:neocomplcache_same_filetype_lists')
"    let g:neocomplcache_same_filetype_lists = {}
"endif
"let g:neocomplcache_same_filetype_lists['html'] = 'xhtml,javascript'

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
let g:solarized_termtrans=1

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

"vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.readonly = '⭤'

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
let g:syntastic_javascript_checkers = ['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['php', 'ruby', 'css', 'javascript', 'html', 'xml']
      \ }
nmap <C-i> ;SyntasticCheck<CR>
"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR>;SyntasticReset<CR><ESC>

"http://layzie.hatenablog.com/entry/20130122/1358811539
"Simple-Javascript-Indenter
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1

"jscomplete-vim
"autocmd FileType javascript setlocal omnifunc=jscomplete#CompleteJS
"let g:jscomplete_use = ['dom', 'moz']
"let g:nodejs_complete_config = {
      "\  'js_compl_fn': 'jscomplete#CompleteJS',
      "\  'max_node_compl_len': 15
      "\}

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

" smartchr
"inoremap <expr> = smartchr#loop('=', ' = ', ' == ', ' === ')
"inoremap <expr> > smartchr#loop('>', ' => ')

" open-browser
nmap <Leader>w <Plug>(openbrowser-open)
"nmap <Leader>w <Plug>(openbrowser-smart-search)
vmap <Leader>w <Plug>(openbrowser-smart-search)

" previm
nnoremap <silent> <F7> :PrevimOpen<CR>
"ctrlp
let g:ctrlp_dotfiles = 1
let g:ctrlp_clear_cache_on_exit = 0 " 終了時にキャッシュをクリアしない
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 'tj'
let g:ctrlp_extensions = ['dir', 'line', 'mixed']
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_mruf_max = 500 " MRUの最大記録数
