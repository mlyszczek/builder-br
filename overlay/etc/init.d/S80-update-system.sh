#!/bin/sh

start()
{
    echo "starting update"
    if ! opkg update
    then
        exit 1
    fi

    if [ ! -f /etc/packages ]
    then
        echo "missing /etc/packages file"
        exit 1
    fi

    while read p
    do
        opkg install ${p}
    done < /etc/packages
    echo "update ok"
}

case "$1" in
    start)
        start
        exit 0
        ;;

    stop)
        echo "nothing to be done"
        exit 0
        ;;

    *)
        echo "usage: ${0} {start}"
        exit 1
        ;;
esac
