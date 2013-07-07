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
    fi
}
fix_ubuntu
