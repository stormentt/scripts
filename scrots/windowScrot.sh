#!/bin/bash
baseFolder="$HOME/scrots/"
picFolder=`date "+%Y/%B/%d/"`
picName=`date "+scrot-%H-%M-%S-%N-%Z.png"`

archiveFolder="$HOME/scrots/Archive/"
echo "${baseFolder}${picFolder}${picName}"

mkdir -p "${baseFolder}${picFolder}"
mkdir -p "${archiveFolder}${picFolder}"

scrot -q 100 -u "${baseFolder}${picFolder}${picName}"
xz -9c "${baseFolder}${picFolder}${picName}" > "${archiveFolder}${picFolder}${picName}.xz"
