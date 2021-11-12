# vim-plug

`vim-plug` is a vim plugin manager. 

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Add a section use to install plugin at `~/vimrc`, below is my installed plugin:

```
call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()
```

> `nerdtree` plugin need type `:NERDTree` to launch.

Then use `:PlugInstall` to install plugin.

# Vimium

```
`ge` : edit address;
`gi` : edit textfield;
```

## copy text

```
1. `/`: enter search mode;
2. `return`
3. `v`: enter visual mode select more related text;
4. `cmd + c`
```

[more shortcut](https://www.zhihu.com/question/23483616)

# Shortcut

```
:%s/s1/s2 => 将全部s1替换成s2
```

# Copy

选中某段文本后使用`y`，可以在vim文件中进行`p`复制。
选中某段文本后使用`"+y`，可以复制到系统的剪切板。

在`~/.vimrc` 加入 `set clipboard=unnamed` 可以实现y, p, command+c, command+v 混用。

# iterm2 单词回退设置

[ref](https://blog.csdn.net/skyyws/article/details/78480132)

# References

[http://wsztrush.github.io/%E5%B7%A5%E5%85%B7/2015/06/10/VIM.html](http://wsztrush.github.io/%E5%B7%A5%E5%85%B7/2015/06/10/VIM.html)
