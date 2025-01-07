#!/bin/bash

function ffmpeg_function(){
    ffmpeg -i $filename.$extension -c:v libwebp -vf "fps=10,scale=1920:-1" -lossless 0 -q:v 80 $outputFile
}

function main (){
    if [[ -e "$1" ]]; then
        base_filename=$(basename $1)
        filename=${base_filename%.*}
        extension=${base_filename##*.}
        outputFile=$filename.webp

        if ! cat ~/repos/ez-ffmpeg/.formats | awk 'NR >= 5 {print $2}' | grep -qx "$extension" ; then
            echo -e "\033[38;5;1mFILE FORMAT NOT SUPPORTED.\033[0m"
            exit 1
        fi

        # Calling the ffmpeg function here -
        ffmpeg_function

        echo -e "\033[38;5;2mSaved the output file at: $(pwd)/$outputFile\033[0m"
    else
        echo -e "\033[38;5;1mIncorrect file path !!!\033[0m"
    fi
}

main $1

# Have fun now 😉.
