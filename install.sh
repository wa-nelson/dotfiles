#!/bin/bash

prompt() {
    printf "%s" "$1"
    read -r response
}

yes() {
    if [ "$1" = "y" ]; then
        return 0
    else
        return 1
    fi
}


prompt "Apply symbolic links? "

if yes "$response"; then
		dir=~/.local/dotfiles                    # dotfiles directory

		# list of files/folders to symlink in homedir
		files=""
		files+=".Xresources" 
		files+=".aliases" 
		files+=".bashrc" 
		files+=".vimrc" 
		files+=".config/compton.conf" 
		files+=".config/tmux/.tmux-themes" 
		files+=".config/tmux/.tmux.conf" 
		files+=".config/.colors" 
		files+=".config/i3" 
		files+=".config/i3status" 
		files+=".config/rofi" 
		files+=".config/nvim" 
		files+=".config/kitty" 
		files+=".config/mpd" 
		files+=".config/ncmpcpp" 
		files+=".config/tmux" 

		##########
		# change to the dotfiles directory
		echo -n "Changing to the $dir directory ..."
		cd $dir
		echo "done"

		for file in $files; do
		    echo "Creating symlink to $file in home directory."
		    ln -s $dir/$file ~/$file
		done
fi

packages=""

prompt "Install general software? "

if yes "$response"; then
		packages+="rofi tmux mosh make gcc libxcb-xrm-dev compton build-essential libjsoncpp-dev feh neofetch pandoc pandoc-citeproc ncmpcpp mpd neovim syncthing htop fonts-font-awesome "
fi

prompt "Install AMD drivers? "

if yes "$response"; then
	packages+="firmware-linux firmware-linux-nonfree libdrm-amdgpu1 xserver-xorg-video-amdgpu mesa-vulkan-drivers libvulkan1 vulkan-tools vulkan-utils vulkan-validationlayers "
fi

prompt "Install i3-gaps and polybar? "

if yes "$response"; then
		packages+="libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev xutils-dev libxcb-shape0-dev autoconf cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2"

		# Install packages
		sudo apt install $packages &&

		# i3-gaps on debian
		cd /tmp &&
		git clone https://www.github.com/Airblader/i3 i3-gaps &&
		cd i3-gaps &&
		autoreconf --force --install &&
		mkdir build &&
		cd build &&
		../configure --prefix=/usr --sysconfdir=/etc &&
		make &&
		sudo make install &&


		# polybar on debian
		git clone https://github.com/jaagr/polybar.git &&
		cd polybar &&
		git checkout 3.4.1 &&
		./build.sh &&
		cd .. &&
		rm -rf polybar
else
		sudo apt install $packages
fi

