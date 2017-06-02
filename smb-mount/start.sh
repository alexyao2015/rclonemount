#!/bin/sh

echo "============================================="
echo "Mounting SMB from $SERVERPATH to $MOUNTPOINT at $(date +%Y.%m.%d-%T)"

#export EnvVariable

function term_handler {
  unmount_smb
  echo "exiting now"
  wait 10
  exit 0
}

function unmount_smb {
  echo "Unmounting: $MOUNTPOINT $(date +%Y.%m.%d-%T)"
  umount -f -v $MOUNTPOINT
}

trap term_handler SIGHUP SIGINT SIGTERM

mount.cifs -o $MOUNTOPTIONS $SERVERPATH $MOUNTPOINT

while true
do
sleep 10
done

exit 144