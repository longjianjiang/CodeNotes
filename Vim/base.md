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

# References

[http://wsztrush.github.io/%E5%B7%A5%E5%85%B7/2015/06/10/VIM.html](http://wsztrush.github.io/%E5%B7%A5%E5%85%B7/2015/06/10/VIM.html)