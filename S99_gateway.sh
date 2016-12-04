# Start-Up Script Gateway 2015

# start DHCP server
# dhcpcd -B eth0
# dhcpcd eth0

# mount rw user filesystem
mkdir /media/fs
mount -t ext4 /dev/mtdblock4 /media/fs/

# execute script 
/media/fs/autorun/start.sh
