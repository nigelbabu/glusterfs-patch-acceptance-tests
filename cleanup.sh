#!/bin/bash

set -e;

M=/mnt;
P=/build;
H=$(hostname);
T=600;
V=patchy;


function cleanup()
{
    killall -15 glusterfs glusterfsd glusterd glusterd 2>&1 || true;
    killall -9 glusterfs glusterfsd glusterd glusterd 2>&1 || true;
    pkill /opt/qa/regression.sh 2>&1
    umount -l $M 2>&1 || true;
    rm -rf /build/install /build/scratch /var/lib/glusterd/* /etc/glusterd/* /var/log/glusterfs/* $P/export;
    sudo rm -f /var/run/????????????????????????????????.socket >/dev/null 2>&1
}


function main ()
{
    JDIRS="/var/log/glusterfs /var/lib/glusterd /var/run/gluster /d /d/archived_builds /d/backends /d/build $WORKSPACE"
    sudo mkdir -p $JDIRS
    sudo chown jenkins:jenkins $JDIRS
    chmod 755 $JDIRS
    cleanup;
}

main "$@";
