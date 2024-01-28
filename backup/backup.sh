
#!/bin/bash

function notify() {
    notify-send $1
}

function backup() {
    notify "Starting backup"
    
    rsync -ru --delete "$HOME/.config/" "$HOME/config/"

    notify "Finished backup"

    bash ./clean.sh

    cd $HOME && tar cvzf $HOME/src/scripts/config/backup/config.tar.gz config/
}

backup
