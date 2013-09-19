#!/bin/bash
fix_ubuntu(){
    if [ -r /etc/lsb-release ]; then
        dist=$(grep 'DISTRIB_ID' /etc/lsb-release | sed 's/DISTRIB_ID=//' | head -1)
    fi

    if $(dist=='Ubuntu'||'Kubuntu'||'Lubuntu'||'Xubuntu'); then
        bashlauncher=~/.local/share/applications/bash.desktop
        touch $bashlauncher
        echo '[Desktop Entry]' >> $bashlauncher
        echo 'Name=Bash' >> $bashlauncher
        echo 'Exec=/bin/bash %U' >> $bashlauncher
        echo 'Terminal=false' >> $bashlauncher
        echo 'Type=Application' >> $bashlauncher
        echo 'StartupNotify=true' >> $bashlauncher
        echo 'Path=/bin/bash' >> $bashlauncher
        chmod +x $bashlauncher
    fi
}
fix_ubuntu

## Ubuntu has these *.desktop files that create 'launchers' for applications. 
## An application needs a launcher for it to be the default application for a filetype. 
## Bash doesn't have one. That's why you can't run shell scripts in Ubuntu from the desktop.
##
## One workaround is to add a bash launcher in the ~/.local/share/applications directory. 
## Call it 'bash.desktop'. Basically it should look something like this:
##
## [Desktop Entry]
## Version=1.0
## Type=Application
## Name=Bash
## Icon=bash
## Exec=/bin/bash %U
## Terminal=false
## Path=/bin/bash
##
## After you've made the file, run 
##
## chmod +x bash.desktop
##
## to make the file executable. 
