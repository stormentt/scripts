art=$($HOME/scripts/music/getcoverart.sh)
if [ "$art" == "$HOME/cover.jpg" ]; then
    $HOME/scripts/wallpapers/choose.sh
else
    feh --bg-max "$art"
fi
