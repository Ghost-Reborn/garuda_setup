
# Git config

printf "Enter git username: "
read git_username
git config --global user.name "$git_username"

printf "Enter git email: "
read git_email
git config --global user.email "$git_email"

# Save password locally
printf "Save passworrds as plain text [y/n]: "
read choice
if [ $choice == 'y' ]
then
    git config --global credential.helper store
else
    git config --global credental.helper
fi

printf "Syncing sources... \n\n"
sudo reflector --latest 4 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy
printf "Removing snapper... \n\n"
sudo pacman -R snapper snap-pac snapper-support
printf "Predator fan service... \n\n"
git clone https://github.com/JafarAkhondali/acer-predator-turbo-and-rgb-keyboard-linux-module acer
cd acer
sudo ./install.sh
sudo ./install_openrc.sh
sudo ./install_service.sh

printf "Firefox and Telegram... \n\n"
sudo pacman -S firefox telegram-desktop
