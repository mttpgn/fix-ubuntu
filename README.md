fix-ubuntu-stb.sh
=================

This script changes Ubuntu so that you can open shell scripts by clicking them. 
The way it does this is by creating a launcher for bash.

Ubuntu has these *.desktop files that create 'launchers' for applications. 
An application needs a launcher for it to be the default application for a filetype. 
Bash doesn't have one. That's why you can't run shell scripts in Ubuntu from the desktop.

One workaround is to add a bash launcher in the ~/.local/share/applications directory. Call it 'bash.desktop'.

Basically it should look something like this:

[Desktop Entry]
Version=1.0
Type=Application
Name=Bash
Icon=bash
Exec=/bin/bash %U
Terminal=false
Path=/bin/bash

After you've made the file, run

chmod +x bash.desktop

to make the file executable. 
