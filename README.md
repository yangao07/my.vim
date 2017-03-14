# my.vim
## Configuration (For C/C++ and Python)
### 1. install vim, enable python and xterm_clipboard（+python, +xterm_clipboard）
```
sudo apt-get install vim-gtk-py2
```
### 2. add vim alias in ~/.bashrc
```
alias vim='vim-gtk-py2'
```
### 3. install python-dev and other dependencie
```
sudo apt-get install python-dev ctags cscope llvm clang cmake
```
### 4. cp libclang.so /usr/lib/llvm => /usr/lib
```
sudo cp /usr/lib/llvm-3.8/lib/libclang.so.1 /usr/lib/libclang.so
```
### 5. clone .vim directory
```
git clone https://github.com/yangao07/my.vim.git
mv my.vim ~/.vim
```
### 6. vim command :BundleInstall
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
vim
:BundleInstall
```
### 7. install YouCompleteMe
```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```
