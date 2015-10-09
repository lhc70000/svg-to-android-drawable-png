#!/bin/bash

dpis=("m" "h" "xh" "xxh" "xxxh")
sizes=("1" "1.5" "2" "3" "4")

for file in $@
do
  for ((i=0; i<5; i++))
  do
    dpi=${dpis[$i]}
    folder=drawable-${dpi}dpi
    if [ ! -d "$folder" ]; 
    then
      mkdir $folder
    fi
    size=${sizes[$i]}
    echo "Converting: $file with ${dpi}dpi"
    svgexport $file.svg $folder/$file.png ${size}x
  done
done
