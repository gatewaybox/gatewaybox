# download & execute uImage into RAM 
loady 10080000 921600
bootm 10080000


# remove DTB entry in uboot:
set bootm_cmd bootm
save
