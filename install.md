# Arch Linux Setup – Befehle zum Kopieren

# Basis-Setup nach Installation mit archinstall
sudo pacman -Syu
sudo pacman -S base-devel git wget cmake tar ttf-dejavu

# Multilib aktivieren
sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf
sudo pacman -Sy

# Yay (AUR Helper) installieren
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~ && rm -rf yay

# LibreWolf installieren
yay -S librewolf

# Weitere Programme
sudo pacman -S claws-mail keepassxc rofi nano ranger mpv lm_sensors libreoffice-fresh xcompmgr steam lutris lxappearance

# Gaming Support
yay -S arch-gaming-meta

# Fenstermanager & Tools
sudo pacman -S xorg-server xorg-xinit xorg-xrandr
sudo pacman -S libx11 libxft libxinerama

# DWM, st, slstatus direkt von GitHub installieren
cd ~
git clone https://git.suckless.org/dwm
cd dwm
sudo make clean install
cd ~
git clone https://git.suckless.org/st
cd st
sudo make clean install
cd ~
git clone https://git.suckless.org/slstatus
cd slstatus
sudo make clean install

# ly installieren (Login-Greeter)
yay -S ly
sudo systemctl enable ly.service

# Audio: PipeWire & WirePlumber
sudo pacman -S pipewire pipewire-pulse wireplumber
systemctl --user enable --now pipewire pipewire-pulse wireplumber

# Terminal-Tools & Dateimanager
sudo pacman -S zathura zathura-pdf-mupdf chafa

# Bildvorschau in ranger mit chafa aktivieren
mkdir -p ~/.config/ranger/
wget -O ~/.config/ranger/scope.sh https://raw.githubusercontent.com/ranger/ranger/dev/ranger/ext/scope.sh
chmod +x ~/.config/ranger/scope.sh

# PDF Vorschau in ranger aktivieren
# In scope.sh innerhalb 'pdf)' block ergänzen:
# pdftoppm -f 1 -l 1 -png "$FILE_PATH" "${CACHE_PATH%.*}" > /dev/null 2>&1
# [ -f "$preview_image" ] && exit 6

# Printing Support
sudo pacman -S cups system-config-printer
sudo systemctl enable --now cups.service

# WLAN-Drucker Brother HL-L3240CDW (lokale IP vorausgesetzt)
sudo lpadmin -p Brother_Drucker -E -v "ipp://<IP-ADRESSE>/ipp/print" -m everywhere

# Druck-Test über Terminal (PDF)
lp -d Brother_Drucker ~/Downloads/test.pdf

# Konfiguration: Bash-Prompt mit Farben
# In ~/.bashrc:
# export PS1="\[\e[38;5;179m\][\u\[\e[38;5;8m\]@\[\e[38;5;179m\]\h] \[\e[38;5;7m\][\W] \[\033[0m\]"

# Ranger Farben & Cursor-Zeile hervorheben
mkdir -p ~/.config/ranger/colorschemes
# Datei ~/.config/ranger/colorschemes/sand256.py erstellen mit:
# if context.selected:
#     attr |= reverse
#     return fg, bg, attr

# slstatus mit Multi-Monitor-Support patchen
# in slstatus.c ersetzen:
# XStoreName(...) durch Xinerama-Loop
# in dwm.c Funktion updatestatus():
# for (m = mons; m; m = m->next) drawbar(m);
