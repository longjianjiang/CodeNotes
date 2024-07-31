# zsh

安装oh-my-zsh:

```
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
```

切换shell：

```
chsh -s /bin/zsh
```

# Xcode

手动安装Command Tools，去官网下载安装；

# Homebew

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

# ruby

`sudo gem install fastlane -NV` 需要新版本的ruby，所以需要安装rvm来安装一个新版本的ruby。

安装rvm：

```
curl -L get.rvm.io | bash -s stable
```

安装指定版本的ruby：

```
rvm list known
rvm install 2.6.3
rvm use 2.6.3 --default
rvm list
rvm remove 2.6.3
```

# Pod

```
sudo gem install cocoapods
```

# 隐藏文件

```
defaults write com.apple.finder AppleShowAllFiles -bool true;
KillAll Finder
```

# zsh 环境变量

```
vim $HOME/.zshrc
export PATH="$PATH:/YOUR_FLUTTER_DIR/flutter/bin"
```

重启终端后，生效。

# 更新zshrc

更新完zshrc，执行 `source ~/.zshrc` 刷新。

# pb

[install](https://stackoverflow.com/questions/21775151/installing-google-protocol-buffers-on-mac)

[pb convert objc](https://developers.google.com/protocol-buffers/docs/reference/objective-c-generated)

xxx

# 备忘录

操作步骤
找到备忘录存储的路径“/Users/xxx/Library/Group Containers/group.com.apple.notes”，xxx是用户名。但是在该目录下没有找到对应的备忘录内容文件。其实这些备忘录内容是被存储在sqllist数据库。

所以，我们想要批量将旧电脑上的备忘录拷贝到新电脑上，只需要将旧电脑上的group.com.apple.notes目录全部拷贝到新电脑上，然后重新打开备忘录即可。
拷贝命令为：“cd /Users/zdns/Library/Group\ Containers; scp -r xxx@192.168.1.3:"/Users/xxx/Library/Group\ Containers/group.com.apple.notes" .”。
