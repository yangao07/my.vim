" All system-wide defaults :are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.

call pathogen#infect()
call pathogen#helptags()
filetype off

syntax on
filetype plugin indent on     " required
runtime! debian.vim
set cursorline	
"hi CursorLine cterm=NONE ctermbg=white ctermfg=black guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=white ctermfg=darkred guibg=darkred guifg=white
let helptags="usr/share/vim/vim74/doc"
set helplang=cn
set mouse=a
set autoindent
set smartindent
set ai
set tabstop=4
set expandtab
set shiftwidth=4
set updatetime=1
set ruler
set number

"TagList WinManager NerdTree
let Tlist_Show_One_File=1
let Tlist_Show_OnlyWindow=1
let Tlist_Max_Submenu_Items=1000
let Tlist_Inc_Windith=0
let Tlist_File_Fold_Auto_Close=1
"let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer'
"let g:winManagerWindowLayout='FileExplorer|TagList,BufExplorer'
let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer'

"nmap wm :WMToggle<CR>
"nmap nt :NERDTree<CR>


"nnoremap <silent>  :TlistOpen<CR>
"nnoremap <silent>  :TlistToggle<CR> a 

"bundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle "scrooloose/syntastic"

"设置自动补全
filetype plugin indent on
autocmd filetype c set ofu=ccomplete#Complete
autocmd filetype python set ofu=pythoncomplete#Complete
autocmd filetype javascript set ofu=javascriptcomplete#CompleteJS
autocmd filetype html set ofu=htmlcomplete#CompleteTags
autocmd filetype CSS set ofu=csscomplete#CompleteCSS
autocmd filetype xml set ofu=xmlcomplete#CompleteTags
autocmd filetype php set ofu=phpcomplete#CompletePHA
set completeopt=menu,longest
inoremap <silent>  <c-x><c-O>


set softtabstop=4
"set autochdir


" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
if &t_Co > 2 || has("gui_running")
	  syntax on
	    set hlsearch
	endif
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

set foldenable
set foldcolumn=0
"setlocal foldlevel=1
set foldmethod=indent
set foldexpr=1
"autocmd! BufNewFile,BufRead * setlocal nofoldenable

let g:C_Ctrl_j='off'
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-k> <up>
inoremap <c-j> <down>


"自动补全括号、引号
"inoremap { {}<ESC>i
"inoremap [ []<ESC>i
"inoremap ( ()<ESC>i
"inoremap " ""<ESC>i
"inoremap ' ''<ESC>i

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

au BufReadPost *
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ exe "normal! g'\"" |
 \ endif

"sdcv
function! Mydict()
	let expl=system('sudo sdcv -n ' .
		\  expand("<cword>"))
	windo if
		\ expand("%")=="diCt-tmp" |
		\ q!|endif
	25vsp diCt-tmp
	setlocal buftype=nofile bufhidden=hide noswapfile
	1s/^/\=expl/
	1
endfunction
nmap F :call Mydict()<CR>

"clang
let g:clang_use_library=1
let g:clang_debug=1
let g:clang_library_path="/usr/lib"

" tlist
nmap tl :TlistToggle<CR>
"ctags
nmap <F2> <Esc>:!sudo ctags -R *<CR>
"cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cscopetag
nmap <F3> <Esc>:!cscope -Rbq <CR> :cs add ./cscope.out . <CR>
"查找本C字符(可以跳过注释)
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> :cw <CR>	
"查找本定义, 对于多条定义的函数, 需要选择定义位置,因此去掉后面直接进入定义的代码
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR>
"<CR> :cw <CR>

"查找调用本函数的函数
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :cw <CR>
"查找本字符串
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> :cw <CR>
"查找本egrep模式
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> :cw <CR>
"查找本文件
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR> :cw <CR>
"查找包含本文件的文件
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR> :cw <CR>
"查找本函数调用的函数
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> :cw <CR>

"消除查找选中
nmap <F4> :noh<CR>

"synatasti
call pathogen#infect()
let g:syntastic_check_on_open=1
highlight SyntasticErrorLine guibg=#2f0000

"for vim7.4
set backspace=indent,eol,start

"pyflake
"let g:pyflakes_use_quickfix = 0

"pydiction
let g:pydiction_location = '~/.vim/complete-dict'
"defalut g:pydiction_menu_height == 15
"let g:pydiction_menu_height = 20
