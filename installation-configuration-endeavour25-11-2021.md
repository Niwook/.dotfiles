jue 25 nov 2021 10:13:46

# INSTALACIÓN DE ENDEAVOUROS CON XFCE

## CONOCER MD5 Y SHA
```
md5sum filename
shasum filename
shasum -a 256 filename
shasum -a 512 filename
```

## INSTALAR YAY SI NO ESTÁ INSTALADO
`sudo pacman -S yay`
Si no funciona:
`sudo pacman -S git`
`git clone https://aur.archlinux.org/yay.git`
`cd yay`
`makepkg -si`
***

## NSTALACIÓN DE LOS DRIVER DE NVIDIA 390XX
### INSTALAR CONTROLADOR NOUVEAU
`sudo nvidia-installer-dkms -n`
### INSTALAR LOS DRIVERS 390XX
`yay -S nvidia-390xx-dkms`
### INSTALAR LOS CONTROLADORES PROPIETARIOS
`sudo nvidia-installer-dkms --force`
### REINICIAR PARA QUE SE INSTALEN
`sudo systemctl reboot`
***

## MODIFICAR EL GRUB
### INSTALAR OS-PROBER
`sudo pacman -S --needed os-prober`
### MODIFICAR EL GRUB
`sudo nano /etc/default/grub`
### MODIFIRCAR LA VARIABLE:
`GRUB_DISABLE_OS_PROBER=false`
### REGENERAR EL GRUB
`sudo grub-mkconfig -o /boot/grub/grub.cfg`
### MOSTRAR INFORMACIÓN CUANDO SE INICIA EL SISTEMA
`sudo nano /etc/default/grub`
Quitar **quiet** de GRUB_CMDLINE_LINUX_DEFAULT:
`sudo grub-mkconfig -o /boot/grub/grub.cfg`
***

## INSTALAR GNOME-DISK-UTILITY
`sudo pacman -S gnome-disk-utility`
***

## LIMPIAR LOS LOSG DE SYSTEMD JOURNAL DE MÁS DE 7 DÍAS
Listar las tareas que tenemos:
`crontab -l`
Crear una tarea nueva:
`crontab -e`
Rellenar con:
`00 16 * * 4 sudo journalctl --vacuum-time=7d`
***

## CREAR GRUPO DE ADMINISTRACIÓN
`sudo groupadd gniwook`
`sudo usermod -g gniwook niwook`
`sudo nano /etc/sudoers`
Añadir al final del archivo:
`niwook ALL=(ALL) NOPASSWD: ALL`
***

## PERSONALIZAR CARPETAS DEL HOME
`LC_ALL=C xdg-user-dirs-update --force`
`xdg-user-dirs-update`
`echo "enabled=False" > ~/.config/user-dirs.conf`
`xdg-user-dirs-update --set DOCUMENTS ~/Niwook`
`xdg-user-dirs-update --set PUBLICSHARE ~/Koowin`
Eliminar carpetas inutilizadas.
Crear la carpeta **Niwook** en el HOME.
***

## INSTALAR REDSHIFT
`sudo pacman -S redshift`
- Crear el archivo: **~/.config/redshift.conf**
- Copiar esta configuración:
```
; Global settings for redshift
[redshift]
; Set the day and night screen temperatures
temp-day=6500
temp-night=3500

; Enable/Disable a smooth transition between day and night
; 0 will cause a direct change from day to night screen temperature.
; 1 will gradually increase or decrease the screen temperature.
transition=1

; Set the screen brightness. Default is 1.0.
;brightness=0.9
; It is also possible to use different settings for day and night
; since version 1.8.
brightness-day=1.0
brightness-night=0.9
; Set the screen gamma (for all colors, or each color channel
; individually)
gamma=0.9
;gamma=0.8:0.7:0.8
; This can also be set individually for day and night since
; version 1.10.
;gamma-day=0.8:0.7:0.8
;gamma-night=0.6

; Set the location-provider: 'geoclue2' or 'manual'
; type 'redshift -l list' to see possible values.
; The location provider settings are in a different section.
location-provider=manual

; Set the adjustment-method: 'randr', 'vidmode'
; type 'redshift -m list' to see all possible values.
; 'randr' is the preferred method, 'vidmode' is an older API.
; but works in some cases when 'randr' does not.
; The adjustment method settings are in a different section.
adjustment-method=randr

; Configuration of the location-provider:
; type 'redshift -l PROVIDER:help' to see the settings.
; ex: 'redshift -l manual:help'
; Keep in mind that longitudes west of Greenwich (e.g. the Americas)
; are negative numbers.
[manual]
lat=37.4862
lon=-2.7770

; Configuration of the adjustment-method
; type 'redshift -m METHOD:help' to see the settings.
; ex: 'redshift -m randr:help'
; In this example, randr is configured to adjust screen 1.
; Note that the numbering starts from 0, so this is actually the
; second screen. If this option is not specified, Redshift will try
; to adjust _all_ screens.
; [randr]
; screen=1
```
***

## HABILITAR TRIM PARA EL SSD
`sudo systemctl enable fstrim.timer`
`sudo systemctl start fstrim.timer`
Verificar con:
`sudo fstrim -v /`
***

## MONTAR AUTOMÁTICAMENTE LAS PARTICIONES Y DARLES PERMISO DE ESCRITURA
- Abrir la aplicación "Discos" y "Editar las opciones de montaje..."
- Identificar como LABEL=xxx. Esto cambia el Punto de montaje a /mnt/xxx
- Reiniciar la computadora
`sudo chmod 667 /mnt/xxx` (usar si el sistema no lo hace automáticamente)
***

## REPARAR LA CONEXIÓN A INTERNET DESPUÉS DE ACTUALIZAR
`sudo nano '/usr/lib/modprobe.d/r8168.conf'`
Comentar la línea agregando ‘#’
#blacklist r8169
Guardar y salir.
`sudo modprobe r8169`
Si lo anterior funciona, tener en cuenta que esto es solo una solución temporal
que se revertirá cuando se actualice r8168.

Arreglar permanentemente, desinstalar **r8168**:
`sudo pacman -R r8168`
***

## AJUSTAR HORA ENTRE LINUX Y WINDOWS
`sudo timedatectl set-local-rtc 1`
***

## ACTIVAR CORTAFUEGOS GUFW AUTOMÁTICAMENTE AL INICIAR EL SISTEMA
`sudo systemctl start ufw.service`
`sudo systemctl enable ufw.service`
`systemctl enable --now ufw.service`
`sudo ufw status`
***

## ACTIVAR NUMLOCK
En el archivo **~/.config/xfce4/xfconf/xfce-perchannel-xml/keyboards.xml**,
asegúrese de que los siguientes valores estén establecidos como verdadero (true):

<property name="Numlock" type="bool" value="true"/>
<property name="RestoreNumlock" type="bool" value="true"/>
***

## INSTALAR ICONOS NUMIX
```
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
```
***

## INSTALAR NUMIX FOLDER
`git clone https://github.com/numixproject/numix-folders`
`sudo cp -r ~/numix-folders /opt`
`cd /opt/numix-folders`
`sudo chmod +x /opt/numix-folders/numix-folders`
`sudo nano /opt/numix-folders/numix-folders.desktop`
sustituir **Exec=numix-folders** por:
`Exec=/opt/numix-folders/numix-folders`
`sudo cp /opt/numix-folders/numix-folders.desktop /usr/share/applications`
`sudo ln -s /opt/numix-folders/numix-folders /usr/bin/numix-folders`
Abrir con:
`sudo numix-folders`

## PERSONALIZAR Y OPTIMIZAR FIREFOX
- Sincronización
- Idioma
- Iconos
- Buscadores
- Certificados Digitales
***

## INSTALAR FUENTES
Copiar la carpeta fonts en: **~/.local/share/fonts** #Crearla si no existe
Desactivar las fuentes noto sans de idiomas que no uso.
***

## CREAR UN .FACE PARA XFCE
Crear una imagen de 200x200px
Darle una resolución de entre 90px y 100px
Guadarla en /home como .face **/home/.face**
***

## LIMPIAR EL ARRANQUE DEL F12
`sudo efibootmgr`
`sudo efibootmgr -b 0003 -B` Donde 0003 es lo que queremos eliminar
***

## INSTALAR Y DESINSTALAR SOFTWARE
`sudo pacman -S inkscape`
`sudo pacman -S gimp`
`sudo pacman -S gimp-plugin-gmic`
`sudo pacman -S gpick`
`sudo pacman -S htop`
`sudo pacman -S vlc`
`sudo pacman -S scribus`
`sudo pacman -S code`
`sudo pacman -S okular`
`yay -S qimgv`
`sudo pacman -S audacious`
`sudo pacman -S cool-retro-term`
`sudo pacman -S telegram-desktop`
`sudo pacman -S gtk3-demos`
    `gtk3-widget-factory`
`sudo pacman -S gnome-calculator `
`sudo pacman -R galculator`
`sudo pacman -S libreoffice-fresh libreoffice-fresh-es`
`sudo pacman -S krita`


***

## INSTALAR TEMA HIPSTER
- Abrir Visual Studio Code.
- Ir al panel de extensiones.
- Pulsar sobre los tres puntos de la parte superior derecha del panel.
- Pulsar sobre: **Instalar desde VSIX**
- Indicar donde está el archivo **ModoNoob.vscode-hipster-theme-1.0.2.vsix**
- Pulsar sobre configurar tema y elegir hipster del menú.
***

## REPARAR APPIMAGE DE ENVE O CUALQUIERA QUE FALLE
<https://www.maoxuner.cn/post/2021/09/navicat-with-glib2-70/>

1. Si appimagentool no está instalado, instalarlo desde yay:
`yay -S appimagetool-bin`
2. Extraer el archivo appimage
`./enve.AppImage --appimage-extract`
> Si extracción finaliza con el siguiente error, intentar montar el archivo de imagen de la aplicación y luego copiar la fuente de la aplicación al directorio **squashfs-root**.
> ./enve.AppImage –appimage-extract qt.qpa.xcb: QXcbConnection: XCB error: 3 (BadWindow), sequence: 471, resource id: 12928710, major code: 40 (TranslateCoords), minor code: 0 /tmp/.mount_whnQrp/AppRun: symbol lookup error: /usr/lib/libgio-2.0.so.0: undefined symbol: g_module_open_full:
```
# create app source mount point
mkdir src
# mount appimage file(read only)
sudo mount -o loop your-path/navicat15-premium-en.AppImage src
# copy all source file(writable)
cp -r src squashfs-root
# umount appimage file
sudo umount src
rmdir src
```
3. Encuentra tu paquete de archivo **glib2-2.68.4-1-x86_64.pkg.tar.zst**. Si tienes suerte, habrá uno en: **/var/cache/pacman/pkg/glib2-2.68.4-1-x86_64.pkg.tar.zst**. O descárguelo del repositorio de paquetes. O en cualquier lugar.
<https://archive.archlinux.org/packages/g/glib2/glib2-2.68.4-1-x86_64.pkg.tar.zst>
> Descargarlo en la misma carpeta donde está **enve.AppImage**

4. Extraer glib2-2.68.4-1-x86_64.pkg.tar.zst asquashfs-root
`tar xvf glib2-2.68.4-1-x86_64.pkg.tar.zst -C squashfs-root`
5. Volver a empaquetar squashfs-root en el archivo de imagen de la aplicación cambiando el nombre a enverp(reempaquetado):
`appimagetool squashfs-root enverp.AppImage`
> Si muestra este error: enve: error while loading shared libraries: libffi.so.7: cannot open shared object file: No such file or directory
- Instalar desde yay libffi7:
`yay -S libffi7`
***

## INSTALAR FONTMANAGER
`yay -S font-manager`
También se puede instalar desde git:
`sudo git clone https://aur.archlinux.org/font-manager.git`
`cd font-manager`
`makepkg -csi`
*Dar permiso de escritura a la carpeta font-manager si fuese necesario con:
`sudo chmod 667 font-manager`
***

## CAMBIAR PROPIETARIO Y GRUPO DE LA CARPETA DEL SERVIDOR
`cd /opt/`
`sudo chown -R niwook:gniwook lampp`


------------------- NO HECHO AÚN -----------------------



## CONFIGURAR LA GESTIÓN DE COLOR EN INKSCAPE
Abrir Thunar como root:
`gksudo thunar`
Copiar los perfiles de: /mnt/LINUX1/RECURSOS/Resources_Perfiles_Color/color
en: /usr/share/color/icc/colord/ (No reemplazar nada)

Instalar las paletas de:
/mnt/LINUX1/RECURSOS/Resources_Perfiles_Color/pantano_coated.gpl
/mnt/LINUX1/RECURSOS/Resources_Perfiles_Color/pantano_coated_ec_v2.gpl
en: /home/niwook/.config/inkscape/palettes/

También copiar las paletas de: /mnt/LINUX1/RECURSOS/Resources_Perfiles_Color/color-palettes/color-palettes
en: /home/niwook/.config/inkscape/palettes/

Cargar un perfil de visualización:
Edición>preferencias>Entrada/Salida>Gestion de color
Elegir:
Perfil de visualización:eciRGB v2 ICCv4
Mostrar proposito de conversion:colorimetria relativa
Perfil del dispositivo:Europe ISO Coated FOGRA27
Proposito de conversion del dispositivo: colorimetria relativa
Compensacion de punto negro: checked
***

## CONFIGURAR FILEZILLA
Protocolo: FTP-Protocolo de Transferencia de Archivos
Servidor: ftp.cluster015.hosting.ovh.net
Puerto: 21
Cifrado: Usar FTP explícito sobre TLS si está disponible
Modo de acceso: Normal
Usuario: inwok
Contraseña: Está en Bitwarden
Aceptar cuando salga la ventana de que no es seguro
***

## INSTALAR LA SHELL ZSH
<https://www.youtube.com/watch?v=A6xWiqOpulI>
<https://www.youtube.com/watch?v=dg1tK50UVGI&t=690s>
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

## INSTALAR CURL GIT WGET
`sudo pacman -S curl git wget`
***

## INSTALAR OH-MY-ZSH FRAMEWORK
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
`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
`sudo vim .zshrc`
- Introducir el nombre del plugin en:
plugins=(git _archlinux_ _zsh-syntax-highlighting_ _zsh-autosuggestions_)
- Recargar zsh:
`source .zshrc`
***

## INSTALAR LA POWERLEVEL10K
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

## INSTALAR LSD (UN LS CON VITAMINAS)
`sudo pacman -S lsd`
Añadir los siguientes alias a la zsh:
`alias ls='lsd'`
`alias l='ls -l'`
`alias la='ls -a'`
`alias lla='ls -la'`
- Recargar zsh:
`source .zshrc`
***

## INSTALAR BAT (UN CAT CON VITAMINAS)
`pacman -S bat`
Añadir EL siguiente alias a la zsh:
`alias cat='bat'`
`alias catn='/user/bin/cat'`
- Recargar zsh:
`source .zshrc`
***

## INSTALAR FZF
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
`y-y-y`
- Recargar zsh:
`source .zshrc`
***
