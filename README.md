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
./nvim.appimage --appimage-extract
sudo mv squashfs-root / && cd /squashfs-root
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

```
```
```
```
```
