#!/bin/bash

# branch=$(echo $RANDOM | md5sum | head -c 9); git checkout -b "$branch"; git push -u origin "$branch"; for ((j=1;j<=3;j++)); do ./changes.sh && git add . && git commit -m "changes" && git push; done; git checkout master

# create and seed folders
# for ((i=1;i<=30;i++)); do
#     dir=services/$(echo $RANDOM | md5sum | head -c 20)
#     mkdir -p "$dir"

#     for ((j=1;j<=5;j++)); do
#         file="$dir/$(echo $RANDOM | md5sum | head -c 20)"
#         touch "$file"
#         echo "$(echo $RANDOM | md5sum)" > "$file"
#     done
# done

create changes
for dir in services/*/; do
    # skip some folders
    if [ "$[$RANDOM % 5]" != "0" ]; then
        continue
    fi

    # for all files in directory overwrite, append, delete, skip
    for file in $dir*; do
        rnd_nr=$[$RANDOM % 4]
        if [ "$rnd_nr" = "0" ]; then
            echo "$(echo $RANDOM | md5sum)" > "$file"
            break
        elif [ "$rnd_nr" = "1" ]; then
            echo "$(echo $RANDOM | md5sum)" >> "$file"
            break
        elif [ "$rnd_nr" = "2" ]; then
            rm $file
            break
        elif [ "$rnd_nr" = "3" ]; then
            continue
        fi
    done

    # create a new file
    if [ "$[$RANDOM % 3]" = "0" ]; then
        file="$dir/$(echo $RANDOM | md5sum | head -c 20)"
        touch "$file"
        echo "$(echo $RANDOM | md5sum)" > "$file"
    fi
done

# limit the amound of files in a dir to 5
for dir in services/*/; do
    files=0
    for file in $dir*; do
        files=$[$files+1]
        if [ "$files" -gt "5" ]; then
            echo "rm $file"
            rm $file
        fi
    done
    if [ "$files" -le "5" ]; then
        files=$[$files+1]
        file="$dir/$(echo $RANDOM | md5sum | head -c 20)"
        echo "create $file"
        touch "$file"
        echo "$(echo $RANDOM | md5sum)" > "$file"
    fi
done
