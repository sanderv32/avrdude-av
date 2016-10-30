#!/bin/bash
# vim: set ts=4 sw=4 tw=0 ft=sh et :


printf "\033[1;34m[INFO] Searching for 'avrdude'\n"
AVRDUDE=$(which avrdude)
if [ -z "$AVRDUDE" ]; then
    printf "\033[0;31m[INFO] Unable to find 'avrdude', aborting\n"
    exit 1
fi
printf "\033[0;32m[INFO] Found '$AVRDUDE'\n"

printf "\033[1;34m[INFO] Creating symbolic link 'avrdude' to 'avrdude-av'\n"
if [ ! -L avrdude ]; then
    printf "\033[0;32m[INFO] Creating 'avrdude' symbolic link to 'avrdude-av'\n"
    ln -s avrdude-av avrdude
    if [ $? -gt 0 ]; then
        printf "\033[0;31m[ERROR] Error creating symbolic link, aborting\n"
        exit 1
    fi
    printf "\033[0;32m[INFO] Created symbolic link 'avrdude' succesfully\n"
else
    printf "\033[1;35m[INFO] Symbolic link 'avrdude' to 'avrdude-av' already exists\n"
fi

printf "\033[1;34m[INFO] Modifying 'avrdude-av'\n"
sed -i .backup "s|^\(avrdude=\).*|\1\'${AVRDUDE}\'|g" avrdude-av
if [ $? -gt 0 ]; then
    printf "\033[0;31m[ERROR] Error modifying 'avrdude-av', aborting\n"
    exit 1
fi
printf "\033[0;32m[INFO] Modified 'avrdude-av' succesfully\n"

printf "\033[0m\n"
