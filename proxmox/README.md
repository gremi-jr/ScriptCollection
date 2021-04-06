# Proxmox encrypt backup
A script to encrypt backups from PVE without PBS. 
Dont know why they dont implement the feature. 

# How does it work?
- GPG to encrypt backup
- Uses integrated vzdump command

# Preparation
- Configure /etc/vzdump.conf 