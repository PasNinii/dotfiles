# dotfiles


```bash
# install apt dep
sudo apt install ripgrep tmux curl xclip jq lsof gawk stow -y
```

```bash
# setup tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

# Install neovim
```bash
```bash
# https://github.com/neovim/neovim/releases
# Download latest stable app image
# Architecture can be x86_64, arm64, etc.
uname -m

# app image
chmod u+x nvim-linux-x86_64.appimage && ./nvim-linux-x86_64.appimage --appimage-extract
sudo mv squashfs-root / && cd /squashfs-root
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

# kitty
curl -Lo ~/.config/kitty/catppuccin-mocha.conf \
  https://github.com/catppuccin/kitty/raw/main/themes/mocha.conf
# Then in ~/.config/kitty/kitty.conf:
# include catppuccin-mocha.conf
#
# Reload with Ctrl+Shift+F5 (or restart Kitty).
```


