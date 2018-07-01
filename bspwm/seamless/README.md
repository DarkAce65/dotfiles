# bspwm dotfiles
---
### Screenshots
<img src="screenshots/warm.png?raw=true" width="33%"><img src="screenshots/cool.png?raw=true" width="33%"><img src="screenshots/mono.png?raw=true" width="33%">

### Dependency list
- [urxvt](https://wiki.archlinux.org/index.php/rxvt-unicode) - Terminal
- [zim](https://github.com/eriner/zim) - Shell
- [bspwm](https://github.com/baskerville/bspwm) - Window manager
    - [sxhkd](https://github.com/baskerville/sxhkd) - Hotkey daemon for bspwm
- [lemonbar](https://github.com/LemonBoy/bar) - Status bar
- [rofi](https://github.com/DaveDavenport/rofi) - Dmenu
- [feh](https://github.com/derf/feh) - For desktop wallpaper
- [compton](https://github.com/chjj/compton) - For transparency, shadows, and animations

##### Extras
- vim with [pathogen](https://github.com/tpope/vim-pathogen) and [lightline](https://github.com/itchyny/lightline.vim) - Terminal editor
    - [vimtex](https://github.com/lervag/vimtex) with [mupdf](https://mupdf.com/) - LaTeX editor
- [neofetch](https://github.com/dylanaraps/neofetch) - Sysinfo script
- xorg-xbacklight - Backlight control

### Installation
Copy the following files and folders to their respective destinations
- **.config** folder, **.vimrc**, **.zimrc**, and **.zshrc** > ~/
- **.Xresources** will be overwritten by custom themes
- images > /usr/share/backgrounds/

### Themes
- Ctrl + Backspace cycles between the three themes
- To set the default theme, add the -s <number> parameter to the bspwmrc on line 36

ex. `...theme.sh -s 0`, `...theme.sh -s 1`, or `...theme.sh -s 2`

### Credits
- landscape.jpg - [ggiuliafilippini](https://ggiuliafilippini.deviantart.com/art/Flat-Mountains-Landscape-543137208)
- skyline.png - [The Hamster Alliance](http://www.hamsteralliance.com/)
- mono.png - [unscenemedia](http://unscenemedia.deviantart.com/art/Low-Poly-Dual-Screen-Wallpaper-580474565)
