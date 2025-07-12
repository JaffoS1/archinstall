# Mein Arch Linux Setup

---

### Basis-Setup nach Installation mit `archinstall`
```bash
sudo pacman -Syu
sudo pacman -S base-devel git wget cmake tar ttf-dejavu
```

### Multilib aktivieren
```bash
sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf
sudo pacman -Sy
```

### Fenstermanager & Tools
```bash
sudo pacman -S xorg-server xorg-xinit xorg-xrandr
sudo pacman -S libx11 libxft libxinerama
```

### DWM, st, slstatus direkt von suckless.org
```bash
cd ~
git clone https://git.suckless.org/dwm && cd dwm && sudo make clean install
cd ~
git clone https://git.suckless.org/st && cd st && sudo make clean install
cd ~
git clone https://git.suckless.org/slstatus && cd slstatus && sudo make clean install
```

### Ly (Login-Greeter)
```bash
yay -S ly
sudo systemctl enable ly.service
```

### Yay (AUR Helper) installieren
```bash
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~ && rm -rf yay
```

### LibreWolf installieren
```bash
yay -S librewolf
```
### Gaming-Support (Metapaket)
```bash
yay -S arch-gaming-meta
```

### Weitere Programme
```bash
sudo pacman -S claws-mail keepassxc rofi nano ranger mpv lm_sensors \
  libreoffice-fresh xcompmgr steam lutris lxappearance
```

### Audio: PipeWire & WirePlumber
```bash
sudo pacman -S pipewire pipewire-pulse wireplumber
systemctl --user enable --now pipewire pipewire-pulse wireplumber
```

### Terminal-Dateimanager mit Vorschau (ranger)
```bash
sudo pacman -S zathura zathura-pdf-mupdf chafa
mkdir -p ~/.config/ranger/
wget -O ~/.config/ranger/scope.sh https://raw.githubusercontent.com/ranger/ranger/dev/ranger/ext/scope.sh
chmod +x ~/.config/ranger/scope.sh
```

#### PDF-Vorschau in `ranger`
```bash
# In scope.sh innerhalb 'pdf)' block ergänzen:
pdftoppm -f 1 -l 1 -png "$FILE_PATH" "${CACHE_PATH%.*}" > /dev/null 2>&1
[ -f "$preview_image" ] && exit 6
```

### Drucker einrichten
```bash
sudo pacman -S cups system-config-printer
sudo systemctl enable --now cups.service
sudo lpadmin -p Brother_Drucker -E -v "ipp://<IP-ADRESSE>/ipp/print" -m everywhere
```

#### Druck-Test
```bash
lp -d Brother_Drucker ~/Downloads/test.pdf
```

### Ranger Farbschema + Cursorzeile hervorheben
```bash
mkdir -p ~/.config/ranger/colorschemes
nano ~/.config/ranger/colorschemes/sand256.py
```
```python
if context.selected:
    attr |= reverse
    return fg, bg, attr
```

### slstatus mit Multi-Monitor-Patch (statusallmons)
```c
// in slstatus.c XStoreName(...) durch Xinerama-Loop ersetzen
// in dwm.c Funktion updatestatus():
for (m = mons; m; m = m->next)
    drawbar(m);
```

### Git Push
```bash
git add README.md
git commit -m "README aktualisiert"
git push
```

---
