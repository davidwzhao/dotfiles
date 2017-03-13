#!/bin/bash
#
# Bootstrapper for dotfiles
# Creates symbolic links in ~ to files in config
# keeping directory structure

CURRENT_DIR=$(pwd)
HOME_DIR="$HOME"
CONFIG_DIR="config"
BACKUP_DIR="backup"

# make backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir "$BACKUP_DIR"
fi

function backup_file {
    cd "$CURRENT_DIR"

    file="$1"
    backup_filename=""
    
    # if file exists and is not a link, get name for backup
    if [ -f "$HOME_DIR/$file" ] && [ ! -L "$HOME_DIR/$file" ]; then
        backup_filename="$file-$(stat -c %y "$HOME_DIR/$file" | awk '{ print $1 }')"
    fi
    
    # if file doesn't exist in home dir
    if [[ "$backup_filename" == "" ]]; then
        :
    
    # if file already backed up
    elif [ -f "$BACKUP_DIR/$backup_filename" ] ; then
        printf "File $file already backed up to $BACKUP_DIR/$backup_filename... skipping\n"
    
    # else, we need to back up file
    else
        printf "Backing up $file to $BACKUP_DIR/$backup_filename... \n"
        # $backup_folder="$BACKUP_DIR/$(echo "$backup_filename" | sed 's:/[^/]*$::')"
        original_folder="$(dirname "$HOME_DIR/$file")"
        backup_folder=${original_folder#$HOME_DIR}
        mkdir -p "$BACKUP_DIR/$backup_folder" && cp "$HOME_DIR/$file" "$BACKUP_DIR/$backup_filename"
        printf "done\n"
    fi
}

# backup each existing file in home directory
cd "$CONFIG_DIR"
for file in $(find . -type f | cut -c 3-); do
    backup_file "$file"
done

    
