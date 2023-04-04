#!/bin/bash
db="dbapp"
echo "entrypoint point starting"

while true; do
  ysqlsh -h $HOSTNAME -U yugabyte  -f "/app/$db.sql" #&>/dev/null
  if [ $? -eq 0 ]; then
    echo "imported sql"
    break
  else
    echo "err sWql waiting"
  fi
  sleep 10
done

while true; do
   ysqlsh -h $HOSTNAME -U yugabyte  -c "\c $db" &>/dev/null
  if [ $? -eq 0 ]; then
    echo "heartbeat ok"
  else
    echo "err keyspace accses "
  fi
  sleep 10
done
