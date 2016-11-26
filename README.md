## tmux 配置


### tmux 简介
tmux 是一个终端复用软件，类似的软件有screen，但是tmux 有一统江湖的趋势。

tmux 有如下好处。
1. session管理。可以在服务器上开一个tmuxsession，比开很多窗口到服务器上去好很多。
2. 终端分割，可以将很大的一个窗口分成若干小块，每一个小块都可以独立操作，可以比较好
的处理一些小需求。
3. 比如大部分用来写代码，一小块用来看程序的运行结果，这样写代码可以和调试代码在同一个tab中
进行，而无需切换tab。
4. 有很多增强性的插件，可以支持鼠标，session保存,选择复制都很方便。

### 安装

下面给出了在mac和linux上的安装方式。一般用包管理器直接下载就好了，如果是mac，需
要装一个reattach-to-user-namespace

```
sudo apt-get install tmux
brew install tmux
brew install reattach-to-user-namespace
```

### 插件

1. 插件管理 tpm [tpm]()
2. session 恢复
3. 支持鼠标滚动 scroll 。
4. 支持复制到clipboard
5. 增强性搜索 copycat

### 配置
详细参见配置文件`tmux.conf`，放在个人目录下，重命名为~/.tmux.conf即可。

1. 支持鼠标，鼠标点击切换panel,鼠标切换window
2. 支持vim复制到系统clipboard。



### 参考资料

1. [tmux plugins](https://github.com/tmux-plugins)
2. [tpm](https://github.com/tmux-plugins/tpm)
3. [tmux-better-mouse-mode](https://github.com/NHDaly/tmux-better-mouse-mode)
4. [tmux-yank](https://github.com/tmux-plugins/tmux-yank)
5. [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect`)
6. [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat)
