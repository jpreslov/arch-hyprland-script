#!/bin/bash

export FONTS_DIR=/usr/share/fonts
export JBM_DIR=$FONTS_DIR/jetbrainsmono

# Necessary installs
sudo pacman -S alacritty neovim tmux zsh unzip exa firefox

# Get font for terminal
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip -P $FONTS_DIR
sudo mkdir -p $JBM_DIR
sudo unzip $FONTS_DIR/JetBrainsMono.zip -d $FONTS_DIR/jetbrainsmono/
fc-cache -v

# Get starship for a decent ZSH prompt
curl -sS https://starship.rs/install.sh | sh

# Tmux
echo "set -g prefix C-a" >> ~/.tmux.conf
echo "set -g default-shell /usr/bin/zsh"
tmux source-file ~/.tmux.conf

# Extract .config tarball
tar -xvzf ./backup/config.tar.gz

bash ./move.sh

# Check if user is in video group 
groups "$USER" | grep -q "\\bvideo\\b"

# Add user to video group if not already a member
if [ $? -ne 0 ]; then
  sudo usermod -a -G video "$USER"
  echo "Added $USER to the video group"
fi

# Move zsh files
# mv $HOME/.zsh/zsh/.zshrc $HOME/ && exec zsh 
