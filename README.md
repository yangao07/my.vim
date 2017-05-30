# my.vim
## Configuration (For C/C++ and Python)
### 1. install vim, enable python and xterm_clipboard（+python3/+python, +xterm_clipboard）
```
sudo apt-get install vim-gtk3
```
### 2. install python3-dev and other dependencie
```
sudo apt-get install python3-dev python-dev ctags cscope llvm clang cmake
```
### 3. cp libclang.so /usr/lib/llvm => /usr/lib
```
sudo cp /usr/lib/llvm-VERSION/lib/libclang.so.1 /usr/lib/libclang.so
```
### 4. clone .vim directory
```
git clone https://github.com/yangao07/my.vim.git
mv my.vim ~/.vim
```
### 5. vim command :BundleInstall
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
vim
:BundleInstall
```
### 6. install YouCompleteMe
#### NOTE: modify install.py 
#### #!/usr/bin/evn python => #!/usr/bin/evn python3
```
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```
