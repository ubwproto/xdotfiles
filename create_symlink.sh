#!/bin/sh

BACKUPDIR=$HOME/xdotfiles.bk.$(date +"%Y-%m-%d.%H%M%S")
mkdir "$BACKUPDIR"

cd "$(dirname "$0")" || return

echo "backup directory:  $BACKUPDIR"
echo "xdotfiles path:       $PWD"
echo "installing xdotfiles"

for dotfile in .?*; do
    case $dotfile in
        *.elc | .. | .git | .gitignore | menux | sxhkdrc)
            continue;;
        *)
            [ -L "$HOME/$dotfile" ] && unlink "$HOME/$dotfile"
            [ -e "$HOME/$dotfile" ] && mv -v "$HOME/$dotfile" "$BACKUPDIR"

            ln -sv "$PWD/$dotfile" "$HOME"
            ;;
    esac
done

echo "done."
