"---------------------------
" start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

set backspace=indent,eol,start

" -----Plugin----- "

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'

""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
""""""""""""""""""""""""""""""

"""""""""" vim-quickrun""""""""""""
NeoBundleLazy 'thinca/vim-quickrun',      {'autoload': {'filetypes': ['ruby', 'python', 'perl', 'sh', 'go', 'cpp', 'c']}}
nmap <Leader>r <plug>(quickrun)
let g:quickrun_config = {}
let g:quickrun_config.perl = {'command': 'perl', 'cmdopt': '-MProject::Libs'}
let g:quickrun_config['ruby.rspec'] = {'command' : 'rspec'}
let g:quickrun_config.go = {
			\ 'command': 'go',
			\ 'exec': '%c run %s:p:t %a',
			\ 'tempfile': '%{tempname()}.go',
			\ 'hook/output_encode/encoding': 'utf-8',
			\ 'hook/cd/directory': '%S:p:h'}


" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'

" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'

" Ctrl + e でtree表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" rails等のログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" インデントに色を付けて見やすくする
"NeoBundle 'nathanaelkane/vim-indent-guides'

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
	augroup ZenkakuSpace
	autocmd!
	autocmd ColorScheme * call ZenkakuSpace()
	autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
	augroup END
	call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
	augroup InsertHook
		autocmd!
		autocmd InsertEnter * call s:StatusLine('Enter')
		autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
	if a:mode == 'Enter'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		silent exec g:hi_insert
	else
		highlight clear StatusLine
		silent exec s:slhlcmd
	endif
endfunction

function! s:GetHighlight(hi)
	redir => hl
	exec 'highlight '.a:hi
	redir END
	let hl = substitute(hl, '[\r\n]', '', 'g')
	let hl = substitute(hl, 'xxx', '', '')
	return hl
endfunction
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line ("'\"") <= line("$") |
				\   exe "normal! g'\"" |
				\ endif
endif
""""""""""""""""""""""""""""""

" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" 検索結果をハイライト表示する
set hlsearch
" 暗い背景色に合わせた配色にする
set background=dark
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
colorscheme desert
" 行番号の色
highlight LineNr ctermfg=darkyellow
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" 随時検索を行う
set incsearch

set pumheight=10
" -----tab----- "
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
" 次のタブに移動 "
nnoremap sn gt
" 前のタブに移動 "
nnoremap sp gT
" 回転 "
nnoremap sr <C-w>r
nnoremap s= <C-w>=
" swで次に移動 "
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
" 新規タブ "
nnoremap st :<C-u>tabnew<CR>
" タブ一覧 "
nnoremap sT :<C-u>Unite tab<CR>
" ssで水平分割 "
nnoremap ss :<C-u>sp<CR> 
" svで垂直分割 "
nnoremap sv :<C-u>vs<CR>
" ウィンドを閉じる "
nnoremap sq :<C-u>q<CR>
" バッファを閉じる "
nnoremap sQ :<C-u>bd<CR>
" 現在のタブで開いたバッファ一覧 "
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
" バッファ一覧"
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

colorscheme molokai

"call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
"call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
"call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
"call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
"call submode#map('bufmove', 'n', '', '>', '<C-w>>')
"call submode#map('bufmove', 'n', '', '<', '<C-w><')
"call submode#map('bufmove', 'n', '', '+', '<C-w>+')
"call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" -----Plugin----- "
call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------
