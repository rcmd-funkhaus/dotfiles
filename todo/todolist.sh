#!/usr/bin/env bash

# this script belongs to /var/lib/radicale/
# this script is a cron job:
# * * * * * /var/lib/radicale/todolist.sh | logger -t todolist
# this script synchronizes VTODO with VEVENTS

IFS=$'\n'

for TODO in `todoman --porcelain list --due 730 | jq -c .[]`; do
    DESCRIPTION=$(echo "$TODO" | jq -r .summary)
    DUE_DATE=$(echo "$TODO" | jq -r .due)
    ID=$(echo "$TODO" | jq -r .id)
    LIST=$(echo "$TODO" | jq -r .list)

    if ! ls -1 /var/spool/todoman/processed | grep -oq $ID;then
        echo "${ID} was not processed, will create a new event"
        khal new --alarms 10m -a ${LIST} $(date -d @${DUE_DATE} "+%d.%m.%Y %H:%M") 15m "Europe/Berlin" "$DESCRIPTION" > /var/spool/todoman/processed/${ID}
    else
        echo "${ID} was already processed, not doing anything"
    fi
done
