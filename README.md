# A Guide to Windows Managers in Linux

## Introduction

This is intended to be a simple guide to help anyone get started with a WM in linux. I personally use Arch along with i3-gaps. While setting up everything from scratch, it seemed like a monumental challenge to install and get started with. For any suggestions, edits or questions start a new [issue](https://github.com/Brutuski/linux-wm-guide/issues).

The example config files shown here are from my own dotfiles. A complete set of all dotfiles can be found [here](https://github.com/Brutuski/Dotfiles). They are formatted and commented to make things easier to understand.

Packages and programs mentioned here are available for all linux distros. The configs provided here are verified to work on <img src="https://raw.githubusercontent.com/Brutuski/linux-wm-guide/master/.image_resources/arch_logo.png" alt="drawing" width="28"/> Arch but should work on most distros. Some features might require tweaking to work on other distros.


## What is a Windows Manager(wm)?

As the name implies, it is a software that manages the placement and movements of windows. Nothing more.

Some of the different kinds of WM are: 
+ Stacking WM: allow for overlapping floating windows. Some examples of stacking WM are:
    + [cwm](https://github.com/mariusae/cwm)
    + [2bwm](https://github.com/venam/2bwm)
+ Tiling WM: windows are opened in full screen more. Every subsequent window splits the screen space. Some of the popular tiling WM are:
    + [i3](https://github.com/i3/i3) and it's various forks
    + [bspwm](https://github.com/baskerville/bspwm)
    + [herbsluftwm](https://github.com/herbstluftwm/herbstluftwm)
+ Dynamic WM: dynamically change between tiling and floating modes. Some of the popular dynamic WM are:
    + [awesome](https://github.com/awesomeWM/awesome)
    + [dwm](https://github.com/hluk/dwm)
    + [spectrwm](https://github.com/conformal/spectrwm)
+ Composite WM: all windows are drawn and buffered individually with additonal effects such as 3D animations, blurr, fading etc. Some of the popular composite WM are:
    + Windows WM
    + OS X WM

We will be focusing on tiling WM here, in particular i3-wm.
It is very minimal and does not come with any added modules. All further configuration is left to the user's discretion.


## Difference between DE and WM

A full Desktop Experience comes with a Windows Manager and other modules like a network manager, filemanager and so on.

A WM however lacks such modules and typically is only capable of handling window placements for the most part.

Some distros come with full Desktop Experiences by default. For example:
+ [Ubuntu](https://ubuntu.com/) and [Fedora](https://getfedora.org/) come with [Gnome DE](https://www.gnome.org/).
+ [Elementary OS](https://elementary.io/) comes with [Pantheon DE](https://wiki.archlinux.org/index.php/Pantheon).
+ [Linux Mint](https://www.linuxmint.com/) comes with [KDE](https://kde.org/).

Distros like [Arch](https://www.archlinux.org/) however come with no GUI. It is left upto the user to choose and install what they please.

An extensive list of WM is available on the [archwiki](https://wiki.archlinux.org/index.php/window_manager)


## My setup

After having extensively used Ubuntu 18.04, I changed over to my current setup: 
+ *Arch OS* 
+ *i3-gaps WM*
+ *lightDM* - Display Manager
+ *Polybar* - Bar to show different information
+ *Rofi* - Program launcher
+ *Nautilus* - GUI filemanager
+ *Ranger* - Terminal filemanager
+ *Dunst* - Notification daemon
+ *i3-lock* - for lockscreen


## Installation

After having installed the desired OS, (Links top get started with installing [Arch](https://wiki.archlinux.org/index.php/Installation_guide) and [Ubuntu](https://ubuntu.com/desktop)) open up the terminal. On arch you are already on the terminal after a fresh install. On Ubuntu you can either press `Ctrl + Alt + Enter` or simply open it from the Gnome App launcher.

To install i3-gaps simply enter:
+ on Arch: `sudo pacman -S i3-gaps`
+ on Ubuntu i3-gaps first need some dependencies and then it is installed from source
```
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool libxcb-shape0-dev 
```

``` 
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install
```

For further information refer to the [i3-gaps wiki](https://github.com/Airblader/i3/wiki/Installation)

After Installation, restart your PC and once logged in you will be prompted by the i3 setup.


## Additional Requirements and Recommendations

Install a Display Manager like [LightDM](https://github.com/canonical/lightdm). This displays the X server where necessary and runs a greeter allowing the user to login. More information and options for DM is available on [arch wiki](https://wiki.archlinux.org/index.php/display_manager)

To display information on a bar, there are several different programs available. Two of the most popular ones are [i3status](https://github.com/i3/i3status) and [Polybar](https://github.com/polybar/polybar).
I personally use polybar, there are numerous modules available for both.

A progam launcher is needed as well. [d-menu](https://github.com/stilvoid/dmenu) is a very popular program launcher. Also highly customizable. [rofi](https://github.com/davatorium/rofi) is the other popular alternative and extremely customizable.

Having no full DE and only a WM means your background will be black. [Feh](https://github.com/derf/feh) is a program that can very easily set background images.

Another essential program would be filemanagers. Some popular graphical filemanagers are [nautilus](https://github.com/GNOME/nautilus), [thunar](https://github.com/xfce-mirror/thunar).

Terminal based filemanagers are also available, [ranger](https://github.com/ranger/ranger) and [nnn](https://github.com/jarun/nnn)


## Common Keybidings

i3 uses either  the `Alt` key (referred to as `Mod1`) or the `Win`  key(referred to as `Mod4` in the i3 config) as a `MOD` key. This is configured by the user during initial setup. Can be changed later any time by editing the following line in the config
```
set $mod Mod<num>
```

Some common and default shortcuts to get started with are:

+ Open terminal: `Mod + enter`
+ Open dmenu: `Mod + d`
+ Reload i3 config: `Mod + shift + r`
+ Closing windows: `Mod + shift + q`
+ Switching to Workspace: `Mod + <num>`
+ Shifting window to Workspace: `Mod + shift + <num>`
+ Toogle window to floating: `MOD + shift + space`

All these shortcuts can be customized by editing `.config/i3/config`

A full list of all i3 options can be found in the comprehensive [i3 user documentation](https://i3wm.org/docs/userguide.html)


## Editing Configurations

i3 config is located at `.config/i3`

Open it with any editor to edit it. With vim for example `vim .config/i3/config` or using any preferred editor.

Default [i3 config looks like this](https://gist.github.com/Brutuski/91e5a861edfa4ee1b57af33a39aa0934)

Some useful tips to get started:
+ To comment out a line, type `#` before it.

+ To set a custom keybinding
    ```
    bindsym $mod+z exec <program name>

    ```
+ To always execute a custom script on startup, starting polybar for example 
    ```
    exec_always --no-startup-id $HOME/.config/polybar/launch.sh

    ```
+ To switch between multiple keyboard layouts, US and German for example (necessary drivers required)
    ```
    exec_always setxkbmap -layout us,de
    ```
+ To start a particular program in floating mode always
    ```
    for_window [class="<program_name"] floating enable
    ```

## How to procede further

+ Install polybar to show information from various modules. A lot more modules for it can be found [here](https://github.com/TiagoDanin/Awesome-Polybar) and [here](https://github.com/polybar/polybar-scripts).

+ Install Rofi to launch programs. Rofi's look and functions can be customized by editing the config (located at `.config/rofi/config`). Rofi can also be used for other functionalities, as a powermenu [for example](https://raw.githubusercontent.com/Brutuski/linux-wm-guide/master/.image_resources/Powermenu.png) or as a [window switch]() as well

+ Install [feh](https://github.com/derf/feh), a lightweight image viewer. Feh also sets wallpapers: `feh --bg-scale /path/to/image.file`

+ Install [i3-lock](https://github.com/i3/i3lock) to use as lockscreen

+ Install [Dunst](https://github.com/dunst-project/dunst) to be use as a notification daemon. Dunst is highly configurable and lightweight. My config is included [here](https://github.com/Brutuski/linux-wm-guide/blob/master/.configs/dunstrc)


### Disclaimer

I am not a pro user, so there might be some errors in this guide. If you find any, please point them out and open an issue [here](https://github.com/Brutuski/linux-wm-guide/issues). 

My setup is also geared towards being a programmer and IT person. You might want to make your own customizations as per your requirements. 

I started using Ubuntu to learn more about computers and as a hobby as well. After distro hopping I eventually settled on Arch linux. While [arch wiki](https://wiki.archlinux.org/) is hands down the most comprehensive set of documentation and guides for anything linux related, it can however be jarring to someone just getting started.
With this guide I hope to share what I have learnt after all the trial and errors and give a beginner a boost.

### License

This Project is licensed under the MIT License - see the [LICENSE](https://github.com/Brutuski/linux-wm-guide/blob/master/LICENSE) file for more details.


