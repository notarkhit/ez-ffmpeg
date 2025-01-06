#!/bin/bash

if ! [ -z "$1" ]; then
    filename=$(echo "$1" | awk -F '.' '{print $1}')
    extension=$(echo "$1" | awk -F '.' '{print $2}')
	outputFile=$filename.webp
	echo $outputFilename
	ffmpeg -i $filename.$extension -c:v libwebp -vf "fps=10,scale=1920:-1" -lossless 0 -q:v 80 $outputFile
else
    echo "ERROR: No arguements ! "
fi

if  [ -z "$extension" ]; then
    echo "ERROR: No file extension"
    exit 1
fi

echo "completed"
