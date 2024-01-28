#!/bin/bash

srcdir="./config"

dstdir="$HOME/.config"

bakdir="$HOME/.config_bak"

mkdir -p "$bakdir"

for child in "$srcdir"/*/; do
	folder="${child%/}"
	foldername="${folder##*/}"

	bakpath="$bakdir/$foldername"

	if [ -d "$dstdir/$foldername" ]; then
		echo "moving existing $dstdir/$foldername to $bakpath"
		mv "$dstdir/$foldername" "$bakpath"
	fi

	echo "moving $folder to $dstdir/$foldername"
	mv "$folder" "$dstdir/$foldername"

done
