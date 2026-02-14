#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="/tmp/dotfiles_backup_$(date +%Y%m%d%H%M%S)"

read -p "This will replace the existing dotfiles with symbolic links to the ones in this repository. Do you want to continue? (y/n) " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborting."
    exit 1
fi

mkdir -p "$BACKUP_DIR"

link_dotfiles() {
    local src="$1"
    local dest="$2"
    local backup_dst="$BACKUP_DIR/${dest#HOME}"

    if [ -d "$src" ]; then # If the source is a directory
        # Create the target directory if it doesn't exist
        mkdir -p "$dest"

        # Create corresponding backup directory
        mkdir -p "$(dirname "$backup_dst")"

        # Recursively link items in the directory
        for item in "$src"/*; do
            link_dotfiles "$item" "$dest/$(basename "$item")"
        done
    else # If the sourcve is file
        # Backup existing file if it exists
        if [ -e "$dest" ] && [ ! -L "$dest" ]; then
            mkdir -p "$(dirname "$backup_dst")"
            mv "$dest" "$backup_dst"
            echo "Backed up $dest to $backup_dst"
        fi

        ln -snv "$src" "$dest"
    fi
}

# Link dotfiles from the repository to the home directory
for dotfile in "$DOTFILES_DIR"/*; do
    # Skip ., .., .git, .github and .DS_Store
    if [[ "$(basename "$dotfile")" =~ ^(\.|\.\.|\.git(hub)?|\.DS_Store)$ ]]; then
        continue
    fi

    link_dotfiles "$dotfile" "$HOME/$(basename "$dotfile")"
done

echo "Dotfiles have been linked. Backups of existing files (if any) are stored in $BACKUP_DIR."