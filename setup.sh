#! /bin/bash
set -e
sudo timedatectl set-timezone Asia/Bangkok

sudo apt update
sudo apt install -y ranger qutebrowser picom awesome ksnip rofi brightnessctl xclip xsel ncal ripgrep zsh picom udiskie python3-venv tldr python3-pip fd-find wget translate-shell lxpolkit mpg123

cd ~/dotfiles
git submodule update --init --recursive
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin && sudo ln -snf /home/tawat-ki/.local/kitty.app/bin/kitty /usr/bin/kitty
ln -snf ~/dotfiles/.config/nvim ~/.config/nvim
ln -snf ~/dotfiles/.config/rofi ~/.config/rofi
ln -snf ~/dotfiles/.config/ranger ~/.config/ranger
ln -snf ~/dotfiles/.config/qt5ct ~/.config/qt5ct
ln -snf ~/dotfiles/.config/ksnip ~/.config/ksnip
ln -snf ~/dotfiles/.config/awesome ~/.config/awesome
ln -snf ~/dotfiles/.config/picom ~/.config/picom
ln -snf ~/dotfiles/.config/kitty ~/.config/kitty
ln -snf ~/dotfiles/.config/qutebrowser ~/.config/qutebrowser
ln -snf ~/dotfiles/.fonts ~/.fonts
ln -snf ~/dotfiles/.zshrc ~/.zshrc
ln -snf ~/dotfiles/.icons ~/.icons
ln -snf ~/dotfiles/.moc ~/.moc
ln -snf ~/dotfiles/.themes ~/.themes
ln -snf ~/dotfiles/.jupyter ~/.jupyter
ln -snf ~/dotfiles/.Xresources ~/.Xresources
ln -snf ~/dotfiles/.xinitrc ~/.xinitrc
ln -snf ~/dotfiles/my_startup.sh  /etc/profile.d/my_startup.sh
wget --directory-prefix  /tmp https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz

tar -xvf /tmp/nvim-linux64.tar.gz --directory=/tmp
sudo cp -r /tmp/nvim-linux64/ /opt/nvim
sudo ln -sf /opt/nvim/bin/nvim /usr/bin/nvim
mkdir -p ~/.config/

set +e
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
set -e
/usr/bin/nvim +PackerSync
