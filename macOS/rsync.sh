#!/bin/bash
now=$(date)
WLAN_SSID="FullGeek"
CURRENT_WLAN_SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}')
if [[ "$CURRENT_WLAN_SSID" == *"$WLAN_SSID"* ]]
 then
    rsync -av --delete ~/Git/ timo@192.168.178.13:/mnt/Vault/Timo/Git > ~/CustomLaunchd/rsync_sh_LOG.txt
    echo "$now - Rsync command runned" >> ~/CustomLaunchd/rsync_sh_LOG.txt 
else
    echo "$now - Not the WLAN you are looking for!" >> ~/CustomLaunchd/rsync_sh_LOG.txt 
fi
    exit 



