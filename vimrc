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
let helptags="/usr/share/vim/vim80/doc"
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
"let g:winManagerWindowLayout='NERDTree|TagList,BufExplorer'

nmap nt :NERDTreeToggle<CR>
nmap wm :WMToggle<CR>



"nnoremap <silent>  :TlistOpen<CR>
"nnoremap <silent>  :TlistToggle<CR> a 

"bundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle "scrooloose/syntastic"
Bundle "Valloric/YouCompleteMe"
"Bundle "bling/vim-airline" 

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
set background=dark

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
hi Search cterm=NONE ctermfg=black ctermbg=yellow
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
inoremap <c-n> <down>


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

"clang
let g:clang_use_library=1
let g:clang_debug=1
let g:clang_library_path="/usr/lib"
"let g:clang_library_path="/home/yangao/.vim/bundle/YouCompleteMe/third_party/ycmd"
let g:clang_complete_copen=1

" tlist
nmap tl :TlistToggle<CR>
"ctags
"nmap <F2> <Esc>:! ctags -R *<CR>
"for echofunc.vim
nmap <F2> <Esc>:! ctags -R --fields=+lS<CR>
"ctags -I __THROW --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --fields=+lS  -R -f ~/.vim/systags /usr/include /usr/local/include
"system tags
nmap <F5> <Esc>:set tags+=~/.vim/systags<CR>
nmap <F6> <Esc>:set tags=./tags<CR>
" echofunc
let g:EchoFuncKeyNext=''
let g:EchoFuncShowOnStatus=1
"cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cscopetag
nmap <F3> <Esc>:!cscope -Rbq <CR> :cs add ./cscope.out . <CR>
"查找本C字符(可以跳过注释)
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> :cw <CR>	
"查找本定义, 对于多条定义的函数, 需要选择定义位置,因此去掉后面直接进入定义的代码
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap fc :cclose<CR>
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

"synatastic
call pathogen#infect()
let g:syntastic_check_on_open=1
"highlight SyntasticErrorLine guibg=#2f0000
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
"whether to show balloons
"let g:syntastic_enable_balloons=1


"for vim7.4
set backspace=indent,eol,start

"选中搜索
vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" grep总是生成文件名
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set iskeyword+=:
autocmd BufEnter *.tex set sw=2

"TaskList
nmap td :TaskList<CR>

"Errors
nmap eo :lopen<CR>
nmap ec :lclose<CR>
nmap E :Errors<CR>
nmap en :lnext<CR>zO
nmap ep :lprevious<CR>zO
"YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_confirm_extra_conf=0
let g:ycm_always_populate_location_list=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_complete_in_comments=1
let g:ycm_auto_hover=''
highlight YcmErrorSection ctermbg=black
highlight YcmErrorline ctermbg=blue
"colorscheme
set t_Co=256  
"statusline
"Format the statusline
"Nice statusbar
set laststatus=2
set ruler
set statusline+=%{EchoFuncGetStatusLine()}
"\ %F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %parse_SAM_resultH:%M\")}   "状态行显示的内容
"set statusline=%{EchoFuncGetStatusLine()}\ [%F%m%r%h%w]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LN=%L]
"
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
hi StatuslineBufNr     cterm=none    ctermbg=cyan   ctermfg=black   gui=none guibg=#840c0c guifg=#ffffff
hi StatuslineFlag      cterm=none    ctermbg=white  ctermfg=red     gui=none guibg=#bc5b4c guifg=#ffffff
hi StatuslinePath      cterm=none    ctermbg=cyan   ctermfg=black gui=none guibg=#8d6c47 guifg=black
"hi StatuslineFileName  cterm=none    ctermbg=blue   ctermfg=white   gui=none guibg=#d59159 guifg=black
hi StatuslineFileEnc   cterm=none    ctermbg=yellow ctermfg=black   gui=none guibg=#ffff77 guifg=black
hi StatuslineFileType  cterm=bold    ctermbg=black  ctermfg=white   gui=none guibg=#acff84 guifg=black
"hi StatuslineTermEnc   cterm=none    ctermbg=yellow ctermfg=black   gui=none guibg=#77cf77 guifg=black
"hi StatuslineChar      cterm=none    ctermbg=black  ctermfg=red     gui=none guibg=#66b06f guifg=black
"hi StatuslineSyn       cterm=none    ctermbg=green  ctermfg=black   gui=none guibg=#60af9f guifg=black
"hi StatuslineRealSyn   cterm=none    ctermbg=cyan   ctermfg=black   gui=none guibg=#5881b7 guifg=black
hi StatusLine          cterm=none    ctermbg=blue   ctermfg=white   gui=none guibg=#3f4d77 guifg=#729eb0 
hi StatuslineTime      cterm=none    ctermbg=cyan   ctermfg=black   gui=none guibg=#3a406e guifg=#000000
hi StatuslineSomething cterm=reverse ctermfg=white  ctermbg=darkred gui=none guibg=#c0c0f0 guifg=black
hi StatusLineNC                                                     gui=none guibg=#304050 guifg=#70a0a0


"set statusline+=%2*%-3.3n%0*/ " buffer number
"set statusline+=%f/ " file name
"set statusline+=%h%1*%m%r%w%0* " flag
"set statusline+=[
"if v:version >= 600
"    set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
"    set statusline+=%{&encoding}, " encoding
"endif
"set statusline+=%{&fileformat}] " file format
"set statusline+=%= " right align
"set statusline+=%2*0x%-8B/ " current char
"set statusline+=%-14.(%l,%c%V%)/ %<%P " offset
