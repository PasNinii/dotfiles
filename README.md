# dotfiles


```bash
# install apt dep
sudo apt install ripgrep tmux curl xclip jq lsof gawk stow -y
```

```bash
# setup tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
# setup fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```
