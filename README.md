# my.vim
## Configuration
###1. install vim, enable python and xterm_clipboard（+python, +xterm_clipboard）
```
sudo apt-get install vim-gtk-py2
```
###2. install python-dev and other dependencie
```
sudo apt-get install python-dev ctags cscope llvm clang cmake
```
###3. cp libclang.so /usr/lib/llvm => /usr/lib
```
sudo cp /usr/lib/llvm-3.8/lib/libclang.so.1 /usr/lib/libclang.so
```
###4. clone .vim directory
```
git clone https://github.com/yangao07/my.vim.git
mv my.vim ~/.vim
```
###5. vim command :BundleInstall
```
vim 
:BundleInstall
```
###6. install YouCompleteMe
```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```
