# dotfiles


```bash
# install apt dep
sudo apt install ripgrep zsh tmux curl xclip jq lsof gawk stow -y
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

```bash
curl -fsSL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

```bash
curl -s https://ohmyposh.dev/install.sh | sudo bash -s
```
