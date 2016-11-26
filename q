[1;35;40mdiff --git a/README.md b/README.md[m
[1;35;40mindex 78efb8f..08dd0cc 100644[m
[1;35;40m--- a/README.md[m
[1;35;40m+++ b/README.md[m
[36m@@ -1,8 +1,24 @@[m
[31m-##  tmux 配置[m
[32m+[m[32m## tmux 配置[m
[32m+[m
[32m+[m
[32m+[m[32m### tmux 简介[m
[32m+[m[32mtmux 是一个终端复用软件，类似的软件有screen，但是tmux 有一统江湖的趋势。[m
[32m+[m
[32m+[m[32mtmux 有如下好处。[m
[32m+[m[32m1. session管理。可以在服务器上开一个tmuxsession，比开很多窗口到服务器上去好很多。[m
[32m+[m[32m2. 终端分割，可以将很大的一个窗口分成若干小块，每一个小块都可以独立操作，可以比较好[m
[32m+[m[32m的处理一些小需求。[m
[32m+[m[32m3. 比如大部分用来写代码，一小块用来看程序的运行结果，这样写代码可以和调试代码在同一个tab中[m
[32m+[m[32m进行，而无需切换tab。[m
[32m+[m[32m4. 有很多增强性的插件，可以支持鼠标，session保存,选择复制都很方便。[m
 [m
 ### 安装[m
 [m
[32m+[m[32m下面给出了在mac和linux上的安装方式。一般用包管理器直接下载就好了，如果是mac，需[m
[32m+[m[32m要装一个reattach-to-user-namespace[m
[32m+[m
 ```[m
[32m+[m[32msudo apt-get install tmux[m
 brew install tmux[m
 brew install reattach-to-user-namespace[m
 ```[m
[36m@@ -13,8 +29,21 @@[m [mbrew install reattach-to-user-namespace[m
 2. session 恢复[m
 3. 支持鼠标滚动 scroll 。[m
 4. 支持复制到clipboard[m
[31m-[m
[32m+[m[32m5. 增强性搜索 copycat[m
 [m
 ### 配置[m
[32m+[m[32m详细参见配置文件`tmux.conf`，放在个人目录下，重命名为~/.tmux.conf即可。[m
[32m+[m
 1. 支持鼠标，鼠标点击切换panel,鼠标切换window[m
 2. 支持vim复制到系统clipboard。[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m### 参考资料[m
[32m+[m
[32m+[m[32m1. [tmux plugins](https://github.com/tmux-plugins)[m
[32m+[m[32m2. [tpm](https://github.com/tmux-plugins/tpm)[m
[32m+[m[32m3. [tmux-better-mouse-mode](https://github.com/NHDaly/tmux-better-mouse-mode)[m
[32m+[m[32m4. [tmux-yank](https://github.com/tmux-plugins/tmux-yank)[m
[32m+[m[32m5. [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect`)[m
[32m+[m[32m6. [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat)[m
[1;35;40mdiff --git a/tmux.conf b/tmux.conf[m
[1;35;40mindex c1c8806..535ac71 100644[m
[1;35;40m--- a/tmux.conf[m
[1;35;40m+++ b/tmux.conf[m
[36m@@ -46,14 +46,15 @@[m [mset -g status-bg cyan[m
 set -g default-terminal "screen-256color"[m
 [m
 # 对齐方式[m
[31m-set-option -g status-justify centre[m
[32m+[m[32mset-option -g status-justify left[m
 [m
 # 左下角[m
 # set-option -g status-left '#[bg=black,fg=green][#[fg=blue]#S#[fg=green]]'[m
 set-option -g status-left-length 20[m
[31m-set-option -g allow-rename off[m
[32m+[m
 # 窗口列表[m
[31m-setw -g automatic-rename on[m
[32m+[m[32mset-option -g allow-rename off[m
[32m+[m[32m#setw -g automatic-rename on[m
 set-window-option -g window-status-format '#[fg=yellow,bold]#I:#W#[fg=blue,dim]'[m
 set-window-option -g window-status-current-format '#[fg=green,bold][#[fg=blue]#I#[fg=blue]:#[fg=blue]#W#[fg=dim]#[fg=green,bold]]'[m
 # 右下角[m
[36m@@ -61,47 +62,39 @@[m [mset -g status-right '#[fg=green,bold][#[fg=yellow,bold]%Y-%m-%d %H:%M:%S#[fg=gre[m
 [m
 [m
 [m
[31m-# just for mac settings.[m
[31m-# install reattach-to-user-namespace first.[m
[31m-# Copy-paste integration  [m
[31m-set-option -g default-command "reattach-to-user-namespace -l zsh"[m
[31m-#[m
[31m-# Use vim keybindings in copy mode[m
[31m-setw -g mode-keys vi[m
[31m-[m
[31m-# Setup 'v' to begin selection as in Vim[m
[31m-bind-key -t vi-copy v begin-selection[m
[31m-bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"[m
[31m-[m
[31m-# Update default binding of `Enter` to also use copy-pipe[m
[31m-unbind -t vi-copy Enter[m
[31m-bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"[m
[31m-[m
[31m-# Bind ']' to use pbpaste[m
[31m-bind ] run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"[m
[31m-[m
[31m-[m
[31m-[m
 [m
 # List of plugins[m
 set -g @plugin 'tmux-plugins/tpm'[m
 set -g @plugin 'tmux-plugins/tmux-sensible'[m
 set -g @plugin 'nhdaly/tmux-better-mouse-mode'[m
[31m-set -g @plugin 'tmux-plugins/tmux-yank'[m
[32m+[m[32mset -g @plugin 'NHDaly/tmux-scroll-copy-mode'[m
 set -g @plugin 'tmux-plugins/tmux-resurrect'[m
[31m-set -g @plugin 'tmux-plugins/tmux-continuum'[m
[31m-set -g @plugin 'tmux-plugins/tmux-sidebar'[m
[31m-set -g @plugin 'tmux-plugins/tmux-copycat'[m
[32m+[m[32mset -g @plugin 'tmux-plugins/tmux-yank'[m
 [m
 [m
[31m-# for vim[m
[32m+[m[32m# setting for tmux-resurrect[m[41m [m
[32m+[m[32m# for vim resurrect[m
 set -g @resurrect-strategy-vim 'session'[m
 # for neovim[m
 set -g @resurrect-strategy-nvim 'session'[m
 [m
[32m+[m[32m#bind -n WheelUpPane copy-mode[m
[32m+[m[32mset-option -g mouse on[m
[32m+[m[32m#set -g @plugin 'tmux-plugins/tpm'[m
[32m+[m[32m#set -g @plugin 'NGDaly/tmux-scroll-copy-mode'[m
[32m+[m[32m#set -g @scroll-down-exit-copy-mode "on"[m
[32m+[m[32m#set -g @scroll-in-moused-over-pane "on"[m
[32m+[m[32m#set -g @scroll-without-changing-pane "on"[m
[32m+[m[32m#set -g @emulate-scroll-for-no-mouse-alternate-buffer "on"[m
[32m+[m[32m#set -g @prevent-scroll-for-fullscreen-alternate-buffer "on"[m
[32m+[m
[32m+[m[32m# tmux-scroll-copy-mode settings[m
[32m+[m[32mset -g @scroll-down-exit-copy-mode "on"[m
[32m+[m[32mset -g @scroll-in-moused-over-pane "on"[m
[32m+[m[32mset -g @scroll-without-changing-pane "on"[m
[32m+[m[32mset -g @emulate-scroll-for-no-mouse-alternate-buffer "on"[m
 [m
 [m
[31m-set-option -g  mouse on[m
 # Other examples:[m
 # set -g @plugin 'github_username/plugin_name'[m
 # set -g @plugin 'git@github.com/user/plugin'[m
[36m@@ -109,4 +102,3 @@[m [mset-option -g  mouse on[m
 [m
 # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)[m
 run '~/.tmux/plugins/tpm/tpm'[m
[31m-[m
