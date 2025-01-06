#!/bin/bash

if ! [ -z "$1" ]; then
    filename=$(echo "$1" | awk -F '.' '{print $1}')
    extension=$(echo "$1" | awk -F '.' '{print $2}')
	outputFile=$filename.webp
	echo $outputFilename
	ffmpeg -i $filename.$extension -c:v libwebp -vf "fps=10,scale=1920:-1" -lossless 0 -q:v 80 $outputFile
fi

if  [ -z "$extension" ]; then
    echo "ERROR: No file extension"
    exit 1
else
    echo "ERROR: No arguements ! "
fi

# TODO:
# add the operation for ffmpeg
#
# ffmpeg -i input.mp4 -c:v libwebp -vf "fps=10,scale=1920:-1" -lossless 0 -q:v 80 output.webp
#

echo "completed"

