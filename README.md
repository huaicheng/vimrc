## Huaicheng's vimrc ##

Project: https://github.com/huaicheng/vimrc.git

Contact: <lhcwhu@gmail.com>

**Note: This project is forked from git@github.com:amix/vimrc.git, but has been changed greatly**

### Some basic settings I use ###
  * cscope: autoload cscope.out file, short keys
  * colorscheme: solarized, well, your terminal needs to use solarized color too to make vim look good; otherwise it's really UGLY
  * 80 line marker, auto-wrap line, ruler ..
  * customized statusline w/o plugin

### Vundle managed plugins ###
  * tagbar: ok, I have abandoned taglist ..
  * nerdtree: to be honest, I seldomly use it
  * YouCompleteMe & YCM-Generator: for this pair, you still have to compile and generate conf files for your projects manually
  * indentLine: organize code 
  * syntastic: grammer checking and more
  * DrawIt: draw ascii graphs
  * vimtex: write Latex files

There are two versions: [[awesome]] and [[basic]] 

## How to install the Awesome version?
To install it simply do following:

	git clone git://github.com/huaicheng/vimrc.git ~/.vim_runtime
	bash ~/.vim_runtime/install_awesome_vimrc.sh


## How to install the Basic version?

	git clone git://github.com/huaicheng/vimrc.git ~/.vim_runtime
	bash ~/.vim_runtime/install_basic_vimrc.sh


Feedbacks are always welcome.