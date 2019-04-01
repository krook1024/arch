#!/usr/bin/env bash

getNerdFont() { # Downloads and installs a nerd font given a name
	name=$1
	echo "Getting $1..."
	dir=$(mktemp -d) && cd $dir
	echo "> Temporary directory created: $dir"
	echo "> Downloading archive..."
	local url="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0"
	curl -fLo "tmp.zip" "$url/$name.zip" -# && unset url
	[[ ! -f tmp.zip ]] && {
		echo "Failed to download your file!"
		exit
	}
	echo "> Extracting archive..."
	unzip -d . "tmp.zip" >/dev/null 2>&1
	rm -f *Compatible.ttf
	rm -f *Mono.ttf
	rm -f *.zip
	echo "> Installing fonts:"
	ls *.ttf
	sudo mv -f *.ttf /usr/share/fonts/TTF/
	echo "Done! Cleaning up now..."
	rm -rf $dir
	unset dir
}

getNerdFont "$1"
