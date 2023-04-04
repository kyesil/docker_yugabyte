FROM yugabytedb/yugabyte:latest as yugabyte

COPY ./app/init_sv.sh /app/init_sv.sh
COPY ./app/entrypoint_db.sh /app/entrypoint_db.sh
COPY ./app/dbapp.sql /app/dbapp.sql
CMD ["/bin/bash","/app/init_sv.sh"]