"---*----*----*----*----*----*-----*------*----

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2022 Apl 18
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
set nobackup		" do not keep a backup file, use versions instead
else
set backup		" keep a backup file (restore to previous version)
if has('persistent_undo')
set undofile	" keep an undo file (undo changes after closing)
endif
endif

if &t_Co > 2 || has("gui_running")
" Switch on highlighting the last used search pattern.
set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
packadd! matchit
endif
" ---*------*------*------*------*-------*---
""" plugin　設定 (plugin manegerはdein.vimを使用,ゴリラのvim講座を参考)
" dein.vim settings {{{
if &compatible
    set nocompatible        " Be iMproved
endif

" install dir {{{
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_dir)
        call mkdir(s:dein_dir)
    endif
    if !isdirectory(s:dein_repo_dir)
        let s:output_file = s:dein_dir . '/installer.sh'
        execute '!curl -o '.s:output_file.' https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh'
        execute '!sh' s:output_file  s:dein_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" execute 'set runtimepath+=' . s:dein_repo_dir

" begin settings {{{
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " .toml file (プラグインのリスト)
    let s:rc_dir = expand('~/.vim')
    if !isdirectory(s:rc_dir)
        call mkdir(s:rc_dir,'p')
    endif
    let s:toml = s:rc_dir . '/dein.toml'

    " read toml and cache
    call dein#load_toml(s:toml, {'lazy':0})

    " end settings
    call dein#end()
    call dein#save_state()
endif
" }}}

" Required:
filetype plugin indent on
syntax enable

" plugin installation check {{{
if dein#check_install()
    call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
    call map(s:removed_plugins, "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
endif
" }}}

" ---*------*------*------*------*-------*---
" True color 対応!!
if (has("termguicolors"))
    set termguicolors
endif

" カラースキーマを変更(現在はnight-owl)
" set background=dark
" let g:material_theme_style='palenight'
" let g:airline_theme='material'
syntax on
colorscheme night-owl

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字/小文字を区別しない
set ignorecase

" 小文字で検索すると大文字と小文字を無視して検索
set smartcase

" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan

" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch

" 検索結果をハイライト表示
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
" タイトルを表示
set title

" 行番号の表示
set number

" 相対的行番号の表示
set relativenumber

" カーソルライン(横)を表示する
set cursorline

" 対応する括弧やブレースを表示
set showmatch matchtime=1

" 対応する括弧を強調表示
set showmatch

" ステータスラインを表示(数字は表示している行数？)
set laststatus=2

" コマンドライン補完の候補を表示する
set wildmenu

" 折り畳み機能(現在はindent)
set foldmethod=indent

"----------------------------------------
" 入力設定
"----------------------------------------
" オートインデント
set autoindent

" インデントを自動で整える
set smartindent

" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab

" tabキーを押下時の文字数を指定した文字数にする(現在は４文字)
set tabstop=4

" 自動的にインデントを入力する場合の作業幅を設定する(現在は4文字)
set shiftwidth=4

" 連続した空白に対してtabやbackspaceを押した時のカーソルの移動幅
set softtabstop=4

" Makefileのみtabがスペースでない
au Filetype make set noexpandtab

" 行末 → 次の行の行頭、行頭 → 前の行の行末
set whichwrap=h,l,<,>,[,]

" *-*-*-*-* *-*-*-* *-*-*-*-*
"----------------------------------------
" 詳細設定
"----------------------------------------
" Undo/Redo 永続化
if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    exe 'set undodir=' .. undo_path
    set undofile
endif

" Undo可能な数の最大値
set undolevels=50

" yでコピーした時にクリップボードに入る
set guioptions+=a

" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect

"---*----*----*----*----*----*-----*------*----

