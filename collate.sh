#!/bin/bash -e

if [[ $# -lt 1 ]]; then
    script_name=$(basename "$0")
    echo "Usage: $script_name <workload-size=[large|small]"
    exit -1
fi
WORKLOAD_SIZE="$1"

read -r -a directories <<< $(ls .)
for directory in "${directories[@]}"
do
    #echo "$directory"
    blocksize=$(sed -e '/^blocksize=/!d' "$directory/fio.job" | awk -F'=' '{print $2}')
    iodepth=$(sed -e '/^iodepth=/!d' "$directory/fio.job" | awk -F'=' '{print $2}')
    rwmixwrite=$(sed -e '/^rwmixwrite=/!d' "$directory/fio.job" | awk -F'=' '{print $2}')
    #echo "$blocksize,$iodepth,$rwmixwrite"
    if [ -z "$rwmixwrite" ];then
        rwmixwrite="0"
    fi
    new_directory="$WORKLOAD_SIZE""_workload_""$blocksize""_blocksize_""$iodepth""_iodepth_""$rwmixwrite""_rwmix"
    if [[ ! -d $new_directory ]]; then
        mkdir "$new_directory" 
    fi
    mv "$directory" "$new_directory"
done
