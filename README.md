# dotfiles-ubuntu
```bash
sudo apt install ranger qutebrowser picom kitty awesome ksnip rofi brightnessctl xclip xsel ncal ripgrep zsh picom udiskie python3-venv tldr python3-pip
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.config/rofi ~/.config/rofi
ln -s ~/dotfiles/.config/ranger ~/.config/ranger
ln -s ~/dotfiles/.config/qt5ct ~/.config/qt5ct
ln -s ~/dotfiles/.config/ksnip ~/.config/ksnip
ln -s ~/dotfiles/.config/awesome ~/.config/awesome
ln -s ~/dotfiles/.config/picom ~/.config/picom
ln -s ~/dotfiles/.config/kitty ~/.config/kitty
ln -s ~/dotfiles/.config/qutebrowser ~/.config/qutebrowser
ln -s ~/dotfiles/.fonts ~/.fonts
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.icons ~/.icons
ln -s ~/dotfiles/.moc ~/.moc
ln -s ~/dotfiles/.themes ~/.themes
ln -s ~/dotfiles/.jupyter ~/.jupyter
ln -s ~/dotfiles/.Xresources ~/.Xresources
ln -s ~/dotfiles/.xinitrc ~/.xinitrc
```
```bash
curl -L "https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage" -o "/tmp/nvim.appimage"
chmod +x "/tmp/nvim.appimage"
sudo mv "/tmp/nvim.appimage" "/usr/bin/nvim"
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
/usr/bin/nvim +PackerSync
```
