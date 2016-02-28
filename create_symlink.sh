#!/bin/sh

BACKUPDIR=$HOME/xdotfiles.bk.$(date +"%Y-%m-%d.%H%M%S")
mkdir $BACKUPDIR

cd $(dirname $0)

echo "home directory path: $HOME"
echo "backup directory:  $BACKUPDIR"
echo "xdotfiles path:       $PWD \n"
echo "installing xdotfiles\n---"

for dotfile in .?*; do
    case $dotfile in
        *.elc)
            continue;;
        ..)
            continue;;
        .git)
            continue;;
        .gitignore)
            continue;;
        *)

            # remove old symlink
            [ -L "$HOME/$dotfile" ] && unlink "$HOME/$dotfile"

            # backup old file
            [ -e "$HOME/$dotfile" ] && mv -v "$HOME/$dotfile" $BACKUPDIR

            ln -sv "$PWD/$dotfile" "$HOME"
            ;;
    esac
done

echo "done."
