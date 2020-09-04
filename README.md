# arch-post-intaller
installs my dotfiles and key programs after a minimal arch linux install

## instructions
1. login root
2. pacman -Syyu
3. pacman -Sy opendoas neovim
4. nvim /etc/doas.conf
5. add "permit nopass :wheel"
6. `git clone https://github.com/beffiom/arch-post-installer`
7. `cd arch-post-installer`
8. `. install.sh`
9. install yay
10. `. aur-install.sh`
