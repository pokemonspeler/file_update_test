#!/bin/bash

# create folders
# for ((i=1;i<=30;i++)); do
#    mkdir -p services/$(echo $RANDOM | md5sum | head -c 20)
# done


# seed directories
# for dir in services/*/; do
#     for ((i=1;i<=5;i++)); do
#         file="$dir/$(echo $RANDOM | md5sum | head -c 20)"
#         touch "$file"
#         echo "$(echo $RANDOM | md5sum)" > "$file"
#     done
# done
