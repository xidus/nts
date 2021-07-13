#! /bin/sh

### check if .mergemasterrc exists,
### move it out of the way if so
MM_RC=0
if [ -e /root/.mergemasterrc ]; then
        MM_RC=1
        mv /root/.mergemasterrc /root/.mergemasterrc.old
fi

### loop through jails
for jailname in $(ls -1 /usr/ezjails/ | grep -Ev "(^basejail$|^newjail$|^flavours$)"); do
        jailroot="/usr/ezjails/${jailname}"
        echo "processing ${jailroot}:"
        ### check if jailroot exists
        if [ -n "${jailroot}" -a -d "${jailroot}" ]; then
                ### create .mergemasterrc
                cat <<EOF > /root/.mergemasterrc
AUTO_INSTALL=yes
AUTO_UPGRADE=yes
FREEBSD_ID=yes
PRESERVE_FILES=yes
PRESERVE_FILES_DIR=/var/tmp/mergemaster/preserved-files-$(basename ${jailroot})-$(date +%y%m%d-%H%M%S)
IGNORE_FILES="/boot/device.hints /etc/motd"
EOF
                ### remove backup of /etc from previous run (if it exists)
                if [ -d "${jailroot}/etc.bak" ]; then
                        rm -rfI "${jailroot}/etc.bak"
                fi

                ### create backup of /etc as /etc.bak
                cp -pRP "${jailroot}/etc" "${jailroot}/etc.bak"

                ### check if mtree from last mergemaster run exists
                if [ ! -e ${jailroot}/var/db/mergemaster.mtree ]; then
                        ### delete /etc/rc.d/*
                        rm -rfI ${jailroot}/etc/rc.d/*
                fi

                ### run mergemaster for this jail
                mergemaster -D "${jailroot}"
        else
                echo "${jailroot} doesn't exist"
        fi
        sleep 2
done

### if an existing .mergemasterrc was moved out of the way in the beginning, move it back now
if [ ${MM_RC} -eq 1 ]; then
        mv /root/.mergemasterrc.old /root/.mergemasterrc
else
        rm /root/.mergemasterrc
fi

### done, a bit of output
echo "Done. If everything went well the /etc.bak backup folders can be deleted now."
exit 0
