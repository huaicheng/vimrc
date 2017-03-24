## Huaicheng's vimrc ##

[This Project](https://github.com/huaicheng/vimrc.git)

[Contact Me](lhcwhu@gmail.com)

*__Note__: This project is forked from [here](git@github.com:amix/vimrc.git),
  but has been changed greatly*

### Some basic settings I use ###

* cscope: autoload cscope.out file, short keys
* colorscheme: solarized, well, your terminal needs to use solarized color
too to make vim look good; otherwise it's really UGLY
* 80 line marker, auto-wrap line, ruler ..
* customized statusline w/o plugin

### Vundle managed plugins ###

* tagbar: ok, I have abandoned taglist ..
* nerdtree: to be honest, I seldomly use it
* YouCompleteMe & YCM-Generator: for this pair, you still have to compile and
generate conf files for your projects manually
* indentLine: organize code 
* syntastic: grammer checking and more
* DrawIt: draw ascii graphs
* vimtex: write Latex files
* vim-markdown: more powerful rendering than default vim
* vim-syntax-extra: fancy highlight for at least my C code
* tabular: text alignment

There are two versions: [awesome]() and [basic]()

## How to install the Awesome version?
To install it simply do following:

	git clone git://github.com/huaicheng/vimrc.git ~/.vim_runtime
	bash ~/.vim_runtime/install_awesome_vimrc.sh


## How to install the Basic version?

	git clone git://github.com/huaicheng/vimrc.git ~/.vim_runtime
	bash ~/.vim_runtime/install_basic_vimrc.sh

TODO:
* [ ] vim startup time tuning
* [ ] remove unused settings
* [ ] beautify tab related stuff

Feedbacks are always welcome.
