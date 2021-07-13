#!/bin/sh
OLDSTTY=$(stty -g)
echo "Type geli password:"
stty -echo
read PASS
stty $OLDSTTY

sudo geli attach -j - /dev/multipath/LUN0 <<EOF
$PASS
EOF

sudo geli attach -j - /dev/multipath/LUN1 <<EOF
$PASS
EOF

unset PASS
sudo zfs mount -a
