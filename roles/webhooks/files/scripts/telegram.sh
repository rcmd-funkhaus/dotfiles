#!/usr/bin/env bash

bot_token=`cat /etc/datasources/pisun.json | jq -r .token`
chat_id=`cat /etc/datasources/pisun-default-chat`

text="$1"

curl -X POST "https://api.telegram.org/bot${bot_token}/sendMessage" \
    -H 'Content-Type: application/json' \
    -d "{ \"chat_id\": \"${chat_id}\", \"text\": \"${text}\" }"