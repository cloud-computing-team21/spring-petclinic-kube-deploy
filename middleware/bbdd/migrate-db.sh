#!/bin/bash

# Check if the RDS hostname is provided as an argument
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <rds-hostname>"
  exit 1
fi

RDS_HOSTNAME=$1
SCRIPT_DIR=$(dirname "$0")

# Execute SQL scripts
psql -h $RDS_HOSTNAME -U postgres -a -f "$SCRIPT_DIR/1-createDB.sql" && \
psql -h $RDS_HOSTNAME -U postgres -a -f "$SCRIPT_DIR/2-initDB.sql" -d petclinic && \
psql -h $RDS_HOSTNAME -U postgres -a -f "$SCRIPT_DIR/3-populateDB.sql" -d petclinic
