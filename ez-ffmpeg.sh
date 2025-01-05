#!/bin/bash

if ! [ -z "$1" ]; then
    filename=$(echo "$1" | awk -F '.' '{print $1}')
    extension=$(echo "$1" | awk -F '.' '{print $2}')
fi

# if  [ -z "$extension" ]; then
#     echo "ERROR: No file extension"
#     exit 1
# else
#     echo "ERROR: No arguements ! "
# fi
#
# echo "completed"
#
