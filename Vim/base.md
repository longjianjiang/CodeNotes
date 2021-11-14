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

光标移动
⌃ + a 移动到行首 （ahead）
⌃ + e 移动到行末 （end）
⌃ + f 光标向后移动一个字符（after）
^ + b 光标向前移动一个字符（before）

文字删除
^ + k 删除光标后面所有字符（有剪切功能）
^ + u 删除整行字符(有剪切功能)
^ + w 向前删除一个单词
^ + q 删除整行字符
^ + y （粘贴）
^ + h 删除光标之前的字符


# References

[http://wsztrush.github.io/%E5%B7%A5%E5%85%B7/2015/06/10/VIM.html](http://wsztrush.github.io/%E5%B7%A5%E5%85%B7/2015/06/10/VIM.html)
