# vim-plug

`vim-plug` is a vim plugin manager. 

Add a section use to install plugin at `~/.vimrc`, below is my installed plugin:

```
call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
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

# References

[http://wsztrush.github.io/%E5%B7%A5%E5%85%B7/2015/06/10/VIM.html](http://wsztrush.github.io/%E5%B7%A5%E5%85%B7/2015/06/10/VIM.html)
