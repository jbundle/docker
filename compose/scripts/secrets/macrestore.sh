#!/bin/bash

ramfs_size_mb=64
mount_point=run
target_mount=/System/Volumes/Data/opt/run
target_dir=/$mount_point/secrets

ramfs_size_sectors=$((${ramfs_size_mb}*1024*1024/512))
ramdisk_dev=`hdid -nomount ram://${ramfs_size_sectors}`

if [ -d "/${mount_point}" ]
then
  if [ -d "${target_dir}" ] 
  then
    echo "Directory ${target_dir} already exists." 
  else
    echo "Creating ram disk $target_mount and temp dir $target_dir"

    newfs_hfs -v 'Volatile' ${ramdisk_dev}
    mkdir -p ${target_mount}
    chmod a+rw ${target_mount}
    mount -o noatime -t hfs ${ramdisk_dev} ${target_mount}
    mkdir -p ${target_dir}
    chmod a+rw ${target_dir}

    echo "remove with:"
    echo "umount ${target_mount}"
    echo "diskutil eject ${ramdisk_dev}"
  fi
else
  echo "/run does not exist, type: echo \-e \'run\\tSystem\/Volumes\/Data\/opt\/run\' \| sudo tee \-a \/etc\/synthetic.conf"
fi
