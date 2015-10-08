#!/bin/bash

dpis=("m" "h" "xh" "xxh" "xxxh")
sizes=("100%" "150%" "200%" "300%" "400%")

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
    echo "Converting: $file with ${dpi}dpi($size)"
    convert -background transparent -resize $size $file.svg $folder/$file.png
  done
  shift
done
