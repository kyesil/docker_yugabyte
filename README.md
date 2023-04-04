

# YugabyteDB run on 3 docker node 
quick start: `docker compose up` it's take time for ready nodes.  hot start: 2 minutes 
you will see ready nodes on console  : `yb1  | heartbeat ok`

## TEST 
- attach shell one of them run : 
` ysqlsh -c "\c dbapp SELECT * FROM users;" `


## manual way: docker-compose.yml lifecycle
- docker build from `./manual.Dockerfile `
- start from `/app/init_sv.sh`
- `entrypoint_db.sh` & `yb-master` & `yb-tserver`  start paralel
- after ready all nodes  `entrypoint_db.sh` import `dbapp.sql`


## Ref links
- https://docs.yugabyte.com/preview/reference/configuration/yb-master/
- https://docs.yugabyte.com/preview/deploy/multi-dc/3dc-deployment/

# MyNotes:
- all documentation run with `docker run --bla --blabla ...`  ok it's run & i can test it. but i want to create config for portability 
- docker compose file and all images build from .Dockerfile is good idea for portability and development.
- i try create a configuration in this repository.


## fresh start 
docker compose down --rmi all --volumes --remove-orphans
<!-- docker system prune --all --volumes -->