## Forked by coperd <lhcwhu@gmail.com> in 2013-7-12

* I have changed much of the configuration


The Ultimate vimrc of coperd [Modified from git@github.com:amix/vimrc.git]

There are two versions:

* **Basic**: If you want something small just copy [basic.vim](https://github.com/coperd/vimrc/blob/master/vimrcs/basic.vim) into your ~/.vimrc and you will have a great basic setup
* **Awesome**: This includes a ton of useful plugins, color schemes and configurations

I would of course recommend using the awesome version.

## How to install the Awesome version?
The awesome version includes a lot of great plugins, configurations and color schemes that make Vim a lot better. To install it simply do following:

	git clone git://github.com/coperd/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh


## How to install the Basic version?
The basic version is basically just one file and no plugins. You can check out [basic.vim](https://github.com/coperd/vimrc/blob/master/vimrcs/basic.vim).

This is useful to install on remote servers where you don't need many plugins and you don't do many edits.

	git clone git://github.com/coperd/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_basic_vimrc.sh


Colors when editing a Python file:
![Screenshot 1](http://files1.wedoist.com/e952fdb343b1e617b90d256e474d0370/as/screenshot_1.png)

Opening recently opened files [mru.vim](https://github.com/vim-scripts/mru.vim):
![Screenshot 2](http://files1.wedoist.com/1967b0e48af40e513d1a464e08196990/as/screenshot_2.png)

[NERD Tree](https://github.com/scrooloose/nerdtree) plugin in a terminal window:
![Screenshot 3](http://files1.wedoist.com/b1509d7ed9e9f357e8d04797f9fad67b/as/screenshot3.png)

This vimrc even works on Windows!
![Screenshot 4](http://files1.wedoist.com/4e85163d97b81422240c822c82022f2f/as/screenshot_4.png)

Distraction free mode using [goyo.vim](https://github.com/junegunn/goyo.vim) and [vim-zenroom2](https://github.com/amix/vim-zenroom2):
![Screenshot 5](https://d2dq6e731uoz0t.cloudfront.net/a5182977c3d6c2a6cd3f9e97398ca8ca/as/zen_mode.jpg)


## How to include your own stuff?

After you have installed the setup you can create **~/.vim_runtime/my_configs.vim** to fill in any configurations that are important for you. For instance, my **my_configs.vim** looks like this:

	~/.vim_runtime (master)> cat my_configs.vim
	map <leader>ct :cd ~/Desktop/Todoist/todoist<cr>
	map <leader>cw :cd ~/Desktop/Wedoist/wedoist<cr> 

