#!/bin/sh

echo -n "Do you want to update global package ? [y/N] "
read haveToUpdate
if [[ "$haveToUpdate" == "y" ]]; then
    configfile scripts run update-pkg
fi
