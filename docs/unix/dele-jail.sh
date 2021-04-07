#!/bin/sh
JAILNAME=$1
#ezjail-admin stop $JAILNAME
#ezjail-admin delete $JAILNAME
#zfs umount /usr/jails/$JAILNAME
#zfs destroy tank/jails/$JAILNAME
#rm -r /usr/jails/$JAILNAME
ezjail-admin delete -wf $JAILNAME
