FROM yugabytedb/yugabyte:latest as yugabyte

COPY ./app/init_sv.sh /app/init_sv.sh
CMD ["/bin/bash","/app/init_sv.sh"]