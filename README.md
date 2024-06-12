Since some programs still use the old gnome-terminal the best way to get around the problem is to symlink it to xterm:

mkdir ~/.local/bin
ln -s /usr/bin/xterm ~/.local/bin/gnome-terminal
