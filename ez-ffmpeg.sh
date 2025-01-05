#!/bin/bash

if ! [ -z "$1" ]; then
    filename=$(echo "$1" | awk -F '.' '{print $1}')
    extension=$(echo "$1" | awk -F '.' '{print $2}')
if

if  [ -z "$extension" ]; then
    echo "No"
    exit 1
fi

else
    echo "ERROR: No arguements ! "
fi

echo "completed"

