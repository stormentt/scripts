#!/bin/bash

mkdir -p /tmp/lock
scrotPath=/tmp/lock/scrot.png
procScrotPath=/tmp/lock/procScrot.png

scrot -q 100 $scrotPath 

case "$1" in
  blur)
    convert $scrotPath -spread 10 -blur 0x1 $procScrotPath
    convert $procScrotPath $HOME/scripts/lock/lock.png -gravity center -composite -matte $procScrotPath
    ;;
  pixel)
    #convert $scrotPath -scale 10% -scale 1000% $procScrotPath
    convert $scrotPath -scale 5% -scale 2000% $procScrotPath
    convert $procScrotPath $HOME/scripts/lock/lock.png -gravity center -composite -matte $procScrotPath
    ;;
  real)
    #convert $scrotPath -spread 100 -blur 0x1 $procScrotPath
    convert $scrotPath -wave 100x5 -wave 5x100 $procScrotPath
    convert $procScrotPath $HOME/scripts/lock/lock.png -gravity center -composite -matte $procScrotPath
    ;;
  wave)
    convert $scrotPath -background "#1a1a1a" -wave 50x250 $procScrotPath
    convert $procScrotPath $HOME/scripts/lock/lock.png -gravity center -composite -matte $procScrotPath
    ;;
  test)
    rm -r /tmp/lock
    exit 0
    ;;
  *)
    rm -r /tmp/lock
    exit 1
esac

rm $scrotPath

killall -USR1 dunst
i3lock --nofork --show-failed-attempts --image $procScrotPath
killall -USR2 dunst
