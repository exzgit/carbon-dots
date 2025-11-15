#!/bin/env bash

sudo pacman -Rns wofi
sudo pacman -Rns dolphin

echo "installing default packages required"
sudo pacman -S --needed git base-devel
sudo pacman -S --noconfirm rofi nvim hyprland kitty swww nautilus firefox cava btop fastfetch
sudo pacman -S --noconfirm nerd-fonts chafa brightnessctl swaync libnotify flameshot xdg-desktop-portal xdg-desktop-portal-gtk
sudo pacman -S --noconfirm waybar pavucontrol libreoffice-fresh


echo "installing lazy vim"
git clone https://github.com/LazyVim/starter ~/.config/nvim

echo "installing aur helper"
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd ..
rm -rf yay

echo "installing discord"
yay -S --noconfirm discord

echo "copied .bashrc & .bashrc_profile"
cp .bashrc $HOME/.bashrc

echo "cipied .config"
mkdir -p ~/.config
for d in .config/*; do
  name="$(basename "$d")"
  mkdir -p "$HOME/.config/$name"
  cp -r "$d/"* "$HOME/.config/$name"/
done

echo "copied binary executable"
for d in bin/*; do
  name="$(basename "$d")"
  sudo cp -r "$d" "/usr/bin/$name"
done

mkdir -p ~/Pictures
cp -rf ./Wallpapers ~/Pictures/

echo "clean cache"
source ~/.bashrc

sysclean
hyprctl reload

echo "done"
echo "please reboot system!!!"
