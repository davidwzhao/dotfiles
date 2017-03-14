#!/bin/bash
#
# Bootstrapper for dotfiles
# Creates symbolic links in ~ to files in config
# keeping directory structure

CURRENT_DIR=$(pwd)
# HOME_DIR="$HOME"
# CONFIG_DIR="config"
# BACKUP_DIR="backup"

HOME_DIR="test-home"
CONFIG_DIR="test-config"
BACKUP_DIR="test-backup"

# make backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir "$BACKUP_DIR"
fi

backup_file() {
    cd "$CURRENT_DIR"

    file="$1"
    backup_filename=""
    
    # if file exists and is not a link, get name for backup
    # by appending last modification date
    if [ -f "$HOME_DIR/$file" ] && [ ! -L "$HOME_DIR/$file" ]; then
        backup_filename="$file-$(stat -c %y "$HOME_DIR/$file" | awk '{ print $1 }')"
    fi
    
    # if file doesn't exist in home dir
    if [[ "$backup_filename" == "" ]]; then
        printf "File $file doesn't exist in $HOME_DIR... skipping\n"
    
    # if file already backed up
    elif [ -f "$BACKUP_DIR/$backup_filename" ] ; then
        printf "File $file already backed up to $BACKUP_DIR/$backup_filename... skipping\n"
    
    # else, we need to back up file
    else
        printf "Backing up $file to $BACKUP_DIR/$backup_filename... "
        original_folder="$(dirname "$HOME_DIR/$file")"
        backup_folder=${original_folder#$HOME_DIR}
        mkdir -p "$BACKUP_DIR/$backup_folder" && cp "$HOME_DIR/$file" "$BACKUP_DIR/$backup_filename"
        printf "done\n"
    fi
}

link_file() {
    cd "$CURRENT_DIR"

    file="$1"
    
    printf "Linking $HOME_DIR/$file to $CURRENT_DIR/$CONFIG_DIR/$file... "
    # create symbolic link, force removal of old file
    ln -sf "$CURRENT_DIR/$CONFIG_DIR/$file" "$HOME_DIR/$file"
    printf "done\n"
}

# backup and link each file in CONFIG_DIR
cd "$CONFIG_DIR"
for file in $(find . -type f | cut -c 3-); do
    backup_file "$file"
    link_file "$file"
done 
