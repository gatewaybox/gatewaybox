mkfs.ext4 /dev/mtdblock4

# mount rw user filesystem
mkdir /media/fs
mount -t ext4 /dev/mtdblock4 /media/fs/

# execute script 
/media/fs/autorun/start.sh
