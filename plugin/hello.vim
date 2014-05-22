function! Hello()
	echo "hello, world."
endfunction
command! -nargs=0 Hello call Hello()
