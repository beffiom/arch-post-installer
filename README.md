# arch-post-intaller
installs my dotfiles and key programs after a minimal arch linux install

## instructions
1. login root
2. pacman -Syyu
3. pacman -Sy opendoas neovim
4. nvim /etc/doas.conf
5. add "permit nopass :wheel"
6. add user to wheel group (usermod -aG wheel [username]
7. logout root + login user
8. install yay
    * cd ~/.config
    * wget https://aur.archlinux.org/yay.git
    * cd yay
    * makepkg -si
9. `git clone https://github.com/beffiom/arch-post-installer`
10. `cd arch-post-installer`
11. `. install.sh`
