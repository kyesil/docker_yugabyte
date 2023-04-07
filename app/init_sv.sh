#!/bin/bash
export YUGA_MASTERS="yb1:7100,yb2:7100,yb3:7100,yb4:7100"


echo "hossstname $HOSTNAME"
# if [[ "$HOSTNAME" == "yb1" ]]; then
#   echo "leader ..."
# else
#   echo "follower.."
#   sleep 10
# fi
chmod 777 /app/entrypoint_db.sh
(/app/entrypoint_db.sh) &
echo "$!" >/tmp/entrypoint_db.pid

 /home/yugabyte/bin/yb-master --fs_data_dirs=/mnt/disk0 --master_addresses=$YUGA_MASTERS  --rpc_bind_addresses=$HOSTNAME:7100 --replication_factor=3   --leader_failure_max_missed_heartbeat_periods 5 &
 /home/yugabyte/bin/yb-tserver --fs_data_dirs=/mnt/disk1 --start_pgsql_proxy --rpc_bind_addresses=$HOSTNAME:9100 --tserver_master_addrs=$YUGA_MASTERS --leader_failure_max_missed_heartbeat_periods 5 

