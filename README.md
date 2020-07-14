# arch-post-intaller
installs my dotfiles and key programs after a minimal arch linux install

## instructions
1. doas pacman -Syyu
2. doas pacman -Sy opendoas nvim
3. doas nvim /etc/doas.conf
4. add "permit nopass :wheel"
5. `git clone https://github.com/beffiom/arch-post-installer`
6. `cd arch-post-installer`
7. `. install.sh`
8. install yay
9. `. aur-install.sh`
