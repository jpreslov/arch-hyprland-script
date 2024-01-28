#!/bin/bash
exclude=(alacritty hypr sway nvim zsh)
for file in "$HOME/config/"*; do
    [[ " ${exclude[*]} " == *" $(basename -- "$file") "* ]] || rm -rf "$file"
done

rm -rf $HOME/config/zsh/.zsh_history
