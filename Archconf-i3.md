#### CAMBIAR IDIOMA DEL TECLADO
Añadir a ~/.config/i3/config
`exec "setxkbmap -layout es"`
***

#### CONFIGURAR EL TOUCHPAD
Navegar hasta /etc/X11/xorg.conf.d
Crear el fichero 30-touchpad.conf en
`sudo nano 30-touchpad.conf`
Anadir:
```
Section "InputClass"
	Identifier			"devname"
	Driver				"libinput"
	Option "Tapping"		"on"
	Option "NaturalScrolling"	"true"
EndSection
```
Reiniciar para que surta efecto.

Ver en : <https://www.youtube.com/watch?v=jaSk_zcx-4I>
***

#### SOLUCIONAR DESAJUSTE DE HORA ENTRE LINUX Y WINDOWS
`sudo timedatectl set-timezone UTC`
***

#### INSTALAR DMENU
`sudo pacman -S dmenu`
***

#### INSTALAR PAQUETE PARA CONTROLAR EL BRILLO DEL PORTÁTIL
`sudo pacman -S brightnessctl`
***

#### INSTALAR LANZADOR DE APLICACIONES "ROFI"
`sudo pacman -S rofi`
***

#### INSTALAR MANUALMENTE PAQUETES AUR
1. Descargar el paque desde la web de Archlinux pulsando sobre **«download snapshot»** o usando **wget** desde la terminal: 
`wget -c https://aur.archlinux.org/amdgpu-pro-installer.git`
2. Descomprimir el archivo descargado con:
`tar xzf amdgpu-pro-installer.tar.gz`
3. Entramos en la carpeta que se ha creado al descomprimir:
`cd amdgpu-pro-installer`
4. Construimos el paquete con **makepkg** pasando los parámetros:
	- -i para instalar el paquete
	- -S para instalar las dependencias si son necesarias
	- -c > para limpiar los archivos y directorios sobrantes
`makepkg -csi`
makepkg buscará el PKGBUILD dentro de directorio para instalarlo.
***

#### INSTALAR PAQUETES AUR CON YAY
1. Instalar **yay** y **git**:
`sudo pacman -S yay`
Si no funciona desde pacman construirlo así:
`sudo pacman -S git`
`git clone https://aur.archlinux.org/yay.git`
`cd yay`
`makepkg -si`
2. Escribir **yay** en lugar de **pacman**:
	- -S   > para instalar el paquete
	- -Syu > para actualizar el paquete
	- -Rns > para borrar el paquete y todos los archivos relacionados
`yay -S amdgpu-pro-libgl`
makepkg buscará el **PKGBUILD** dentro de directorio para instalarlo.
***

#### CONFIGURAR EL CONTROLADOR GRÁFICO OPEN-SOURCE AMDGPU
1. Instalar los siguientes paquetes:
- Para la aceleración 2D con Xorg:
`sudo pacman -S xf86-video-amdgpu`
- Para el soporte Vulkan(gráficos 3D multiplataforma):
`sudo pacman -S vulkan-radeon`
- Para la aceleración de vídeo:
`sudo pacman -S libva-mesa-driver`
`sudo pacman -S mesa-vdpau`
2. Crear un archivo de configuración:
`sudo nano /etc/X11/xorg.conf.d/20-amdgpu.conf`
Añadiendo `Option "TearFree"	"true"` se soluciona el**"TEAR FREE RENDERING"**

```
Section "Device"
     Identifier		"AMD"
     Driver		"amdgpu"
     Option "TearFree"	"true"
EndSection
```
Ver en: <https://wiki.archlinux.org/index.php/AMDGPU>
***

#### INSTALAR Y HABILITAR TRIM PARA EL SSD
`sudo pacman -S util-linux`
Habilitar trim semanalmente:
`sudo systemctl enable fstrim.timer`
`sudo systemctl start fstrim.timer`
Verificar con:
`sudo fstrim -v /`
***

#### CONFIGURAR EL AUDIO CON ALSA
`sudo pacman -S pulseaudio`
`sudo pacman -s pulseaudio-alsa`
`sudo pacman -s alsa-utils`
Abrir canales desde `alsamixer`
Reiniciar para que la configuración surta efecto.
***

#### FORZAR A PACMAN A ACTUALIZAR LA LISTA DE PAQUETES
`sudo pacman -Syyu`
***

#### INSTALAR FEH PARA LA GESTIONAR LAS IMÁGENES Y LOS FONDOS
`sudo pacman -S feh`
***

#### INSTALAR PICOM PARA LA GESTIÓN VISUAL DE LAS VENTANAS
`sudo pacman -S picom`
***

#### INSTALAR PCMANFM COMO GESTOR DE ARCHIVOS
`sudo pacman -S pcmanfm`
***

#### INSTALAR LXAPPEARANCE PARA GESTIONAR LOS THEMES
`sudo pacman -S lxappearance`
***

#### CONFIGURACIÓN DEL FIREWALL CON GUFW
`sudo pacman -S gufw`
Verificar el estado:
`sudo ufw status`
Activar el firewall:
`sudo gufw`
Verificar el estado:
`sudo ufw status`
***

#### INSTALAR VIM
`sudo pacman -S vim`
***

#### INSTALAR PACMAN-CONTRIB PARA LAS ACTULIZACIONES DEL SISTEMA
`sudo pacman -S pacman-contrib`
Para revisar las actualizaciones disponibles usar:
`checkupdates`
Para listar cuantas actualizaciones hay usar:
`checkupdates | wc -l`
***

#### PONER LAS CARPETAS DE USUARIO EN INGLÉS
`LC_ALL=C xdg-user-dirs-update --force`
`xdg-user-dirs-update`
***

#### INSTALAR MAN
`sudo pacman -S man-db`
En español:
`sudo pacman -S man-pages-es`
***

#### INSTALAR POLYBAR
1. <https://aur.archlinux.org/packages/polybar/>
2.`tar xzf polybar.tar.gz`
3. `CD polybar`
4. `makepkg -csi`
***

#### PERSONALIZAR P7ZIP PARA DESCROMPRIMIR ZIPS
`sudo pacman -S p7zip`
- Uso: <https://wiki.archlinux.org/index.php/P7zip>
- Extraer creando la carpeta: 
`7z x <archive name>`
- Extraer sin crear la carpeta a mogollón:
`7z e <archive name>`
***

#### CAMBIAR EL THEME A ROFI
`rofi-theme-selector`
***

#### INSTALAR DUNST PARA LAS NOTIFICACIONES
`sudo pacman -S dunst`
***

#### QUITAR MENSAJE DEL NOTEBOOK HONOR:
_failed load/save screen backlight brigthness of backlight acpi_video_
`sudo vim /etc/default/grub`
- Añadir al final de **GRUB_CMDLINE_LINUX_DEFAULT=**:
`GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 acpi_backlight=vendor quiet"`
- Generar grub:
`grub-mkconfig -o /boot/grub/grub.cfg`
***

#### INSTALAR LA SHELL ZSH
`sudo pacman -S zsh zsh-completions`
`zsh`
- Seleccionar estas opciones:
1-1-0-2-1-3-1-v-0-4-0-0
- Usar la wiki de Archlinux para configurarla:
<https://wiki.archlinux.org/index.php/Zsh>
- Prompts theme:
Añadir al -zshrc:
```
autoload -Uz promptinit
promptinit
```
- Recargar zsh:
`source .zshrc`
- Ver los themes del prompt:
`prompt -l`
- Elegir un theme:
`prompt fade 'blue'` por ejemplo.
*** 

#### INSTALAR CURL GIT WGET
`sudo pacman -S curl git wget`
***

#### INSTALAR OH-MY-ZSH FRAMEWORK
`sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
`Y`
- Actualizar el framework:
`omz update`
NOTA: Se hace una copia del viejo .zshrc por si las moscas.
- Configurar el theme:
`cd .oh-my-zsh`
`cd themes`
Ver previsualizaciones de los temas aquí:
<https://github.com/ohmyzsh/ohmyzsh/wiki/Themes>
`cd ..`
`sudo vim .zshrc`
- Cambiar el nombre del tema en: ZSH_THEME="robbyrussell"
- Recargar zsh:
`source .zshrc`
- Configurar plugins:
`cd .oh-my-zsh`
`cd plugins`
Información sobre los plugins aquí:
<https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins>
`cd ..`
`sudo vim .zshrc`
- Introducir el nombre del plugin en:
plugins=(git _archlinux_)
- Recargar zsh:
`source .zshrc`
- Instalar el plugin Highlightin
`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
`sudo vim .zshrc`
- Introducir el nombre del plugin en:
plugins=(git _archlinux_ _zsh-syntax-highlighting_)
- Recargar zsh:
`source .zshrc`
- Instalar el plugin Autosuggestions:
`git clone https://github.com/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zzsh-autosuggestions`
`sudo vim .zshrc`
- Introducir el nombre del plugin en:
plugins=(git _archlinux_ _zsh-syntax-highlighting_ _zsh-autosuggestions_)
- Recargar zsh:
`source .zshrc`
***

#### INSTALAR LA POWERLEVEL10K
- Instalar las fonts necesarias (yain es uno de los alias que usa el plugin **archlinux**:
`sudo pacman -S ttf-font-awesome`
`yain nerd-fonts-noto-sans-mono`
`N`
`yain ttf-dejavu ttf-meslo-nerd-font-powerlevel10k`
`N`
- Cambiar la letra de urxvt en .Xresources por MesloLGS NF.
`reboot`
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
`sudo vim .zshrc`
- Cambiar el nombre del tema por: ZSH_THEME="powerlevel10k/powerlevel10k"
- Recargar zsh:
`source .zshrc`
- Seleccionar:
y-y-y-y-3-1-2-1-1-2-1-2-2-1-n-1-y-
- Actualizar el theme de powerlevel10k desde on-my-zsh:
`git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull`
***

#### CONFIGURAR EL RENDERIZADO DE LAS FUENTES
1. Crear el archivo local.conf en /etc/fonts:
`cd /etc/fonts`
`sudo vim local.conf`
2. Añadir dentro lo diguiente:
```
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <match target="font">
  <edit name="autohint" mode="assign">
    <bool>true</bool>
  </edit>
  <edit name="hinting" mode="assign">
    <bool>true</bool>
  </edit>
  <edit mode="assign" name="hintstyle">
    <const>hintslight</const>
  </edit>
  <edit mode="assign" name="lcdfilter">
   <const>lcddefault</const>
 </edit>
</match>
</fontconfig>
```
3. Añadir  .Xresources lo siguiente:
```
Xft.dpi: 96
Xft.antialias: true
Xft.hinting: true
Xft.rgba: rgb
Xft.autohint: true
Xft.hintstyle: hintfull
Xft.lcdfilter: lcddefault
```
4. Correr en la terminal_
`xrdb -merge ~/.Xresources`

Ver:
<https://wiki.manjaro.org/index.php/Improve_Font_Rendering>
<https://wiki.archlinux.org/index.php/Font_configuration>
***

#### ADMINISTRAR NUESTROS ARCHIVOS DE CONFIGURACIÓN (DOTFILES) CON GNU STOW
<https://www.youtube.com/watch?v=HCIftbDYs10>
`pacin stow`
***

#### INSTALAR LSD (UN LS CON VITAMINAS)
`sudo pacman -S lsd`
Añadir los siguientes alias a la zsh:
`alias ls='lsd'`
`alias l='ls -l'`
`alias la='ls -a'`
`alias lla='ls -la'`
- Recargar zsh:
`source .zshrc`
***

#### INSTALAR BAT (UN CAT CON VITAMINAS)
`pacman -S bat`
Añadir EL siguiente alias a la zsh:
`alias cat='bat'`
`alias catn='/user/bin/cat'`
- Recargar zsh:
`source .zshrc`
***

#### INSTALAR FZF
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
`y-y-y`
- Recargar zsh:
`source .zshrc`
***

#### PERSONALIZAR LA TERMINAL URXVT
- Instalar urxvt y xsel para manejar el portapapeles:
`sudo pacman -S rxvt-unicode xsel`
- Elegir un esquema de color en <https://terminal.sexy/>
- Modificar el archivo .Xresources (Está en Github)
- Subir los cambios a Github:
`cd .dotfiles`
`git add .`
`git commit -m "Updated configuration"`
`git push`
***

#### INSTALAR Y CONFIGURAR NEOVIM
`sudo pacman -S neovim`
`sudo pacman -S pythom-pynvim`
`pacin awesome-terminal-fonts`
- Instalar powerline fonts:
<https://github.com/powerline/fonts>
- Generar un archivo de configuración de nvim en:
<https://vim-bootstrap.com/>
- Crear el árbol de directorios:
`cd .config`
`mkdir nvim`
`touch init.vim`
- Copiar el archivo descargado al directorio de nvim:
`cd ..`
`cd ..`
`mv ~/Downloads/generate.vim ~/.config/nvim/init.vim`
- En la sección vim-airline añadir:
`let g:airline_powerline_fonts = 1`
***

#### INSTALAR TMUX
`sudo pacman -S tmux`
- Crear un archivo en $HOME
`touch tmux.conf`
- Añadir lo siguiente:
```
# Setting the prefix from C-b to C-a
set -g prefix C-a

# Free the original Ctrl-b prefix keybinding
unbind C-b

#setting the delay between prefix and command
set -s escape-time 5

# Set the base index for windows to 1 instead of 0
set -g base-index 1
# Set the base index for panes to 1 instead of 0
set -g pane-base-index 1

# Set bind key to reload configuration file
bind r source-file ~/.tmux.conf \; display ​"Reloaded!"

# splitting panes with | and -
bind | split-window -h
bind - split-window -v

# Enable mouse support
set -g mouse on

# Set vi as the default editor
set -g status-keys vi

# set the status line's colors
set -g status-style fg=white,bg=blue

# Set different background color for active window
# set -g window-status-current-bg magenta

```
***

#### INSTALAR TREE PARA REPRESENTAR AŔBOLES DE DIRECTORIOS
`pacin tree`
***

#### INSTALAR TTY-CLOCK
`yain tty-clock-borderless`
***

#### INSTALAR COOL-RETRO-TERM
`pacin cool-retro-term`
***

#### INSTALAR ICONOS PAPIRUS
`pacin papirus-icon-theme`
***

#### INSTALAR CURSORES Y TEMAS GTK
Descargar los cursores y poner la carpeta descomprimida en ~/.iconos
Descargar los temas gtk y poner la carpeta descomprimida en ~/.themes (crearla si no existe)
NOTA: ver la siguiente sección.
***

#### CONFIGURAR LIGHDM
- Instalar Lightdm configuration
`pacin lightdm-gtk-greeter-settings`
- Copiar el tema que queremos usar en /usr/share/themes
- Si lighdm no tiene permiso para leer la ruta usar:
`sudo chmod 555 -R /usr/share/themes/Sweet-Dark`
- Seleccionar un tema para los iconos.
- Poner el wallpaer en: /usr/share/pixmaps/scooter.jpg
- Poner la imagen de usuario en: /var/lib/AccountsService/icons/archlinuxlogo.png
- Configurar si es necesario la multipantalla.
- Ajustar el resto de opciones.
***

#### INSTALAR PYTHON-PIP
`pacin python-pip`
***

#### INSTALAR PYWAL Y COLORZ PARA AUTOLORIZE
- Instalar **pywal**:
`sudo pip3 install pywal`
- Instalar **colorz**:
`pip3 install --user colorz`
Introducir por consola:
`wal -n -i $HOME/Pictures/Wallpapers/chalckhear.jpg --backend colorz`
Mirar como aplicarla en distintos sitios en su wiki:
<https://github.com/dylanaraps/pywal/wiki/Customization>
***









#### MODIFICAR APLICACIONES POR DEFECTO
Editar el archivo
`.config/mimeapps.list`
***

#### INSTALAR ICONOS NUMIX
git clone https://github.com/numixproject/numix-icon-theme-circle.git
git clone https://github.com/numixproject/numix-icon-theme.git
sudo mv numix-icon-theme-circle/Numix-Circle/ /usr/share/icons
sudo mv numix-icon-theme-circle/Numix-Circle-Light /usr/share/icons
sudo mv numix-icon-theme/Numix /usr/share/icons
sudo mv numix-icon-theme/Numix-Light /usr/share/icons
gtk-update-icon-cache /usr/share/icons/Numix-Circle/
gtk-update-icon-cache /usr/share/icons/Numix-Circle-Light/
gtk-update-icon-cache /usr/share/icons/Numix/
gtk-update-icon-cache /usr/share/icons/Numix-Light/
***

#### INSTALAR NUMIX FOLDER
git clone https://github.com/numixproject/numix-folders
sudo cp -r ~/numix-folders /opt
cd /opt/numix-folders
sudo chmod +x /opt/numix-folders/numix-folders
sudo nano /opt/numix-folders/numix-folders.desktop
sustituir Exec=numix-folders por:
Exec=/opt/numix-folders/numix-folders
sudo cp /opt/numix-folders/numix-folders.desktop /usr/share/applications
sudo ln -s /opt/numix-folders/numix-folders /usr/bin/numix-folders
Abrir con:
sudo numix-folders
***
