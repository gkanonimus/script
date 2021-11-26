#!/bin/bash
path="$1"
if [[ !(-e $1) ]]
then
    echo "Directory $1 doesn't exist or not a file!"
    exit
fi
loop_folder_recurse() {
    for i in "$1"/*;do
        if [ -d "$i" ];then
            echo "dir: $i"
            loop_folder_recurse "$i"
        elif [ -f "$i" ]; then
            echo file "$i"
            ls -go "$i"
            file "$i"
        fi
    done
}
echo "Base path: $path"
loop_folder_recurse "$path"
echo "The largest file is : "
find ~/test -type f -printf "%s %p\n" | sort -rn | head -n 1
