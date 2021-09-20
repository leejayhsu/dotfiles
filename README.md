# dotfiles

### config.lua
This is for [LunarVim](https://www.lunarvim.org)
To set up the symlink, do (this assumes you cloned this to your home directory), and you have already installed LunarVim:
```shell
ln -sf ~/dotfiles/config.lua ~/.config/lvim
```

### requirements
required for yaml lsp

```
npm install --global yarn
```

```
brew install ripgrep
```
```
npm install --save-dev --save-exact prettier
```
```
brew install shellcheck
```
```
cargo install shellharden
```
then add this to .zshrc
```
export PATH="/Users/lhsu/.cargo/bin:$PATH"
```
(install go first)
```
go install mvdan.cc/sh/v3/cmd/shfmt@latest
```
