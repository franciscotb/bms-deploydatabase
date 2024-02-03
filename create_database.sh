#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied! Please provide the database name."
    exit 1
fi

db_name=`sudo -u postgres psql -c "SELECT datname FROM pg_catalog.pg_database WHERE lower(datname) = lower('$1')" -A -t`

if [ -z "$db_name" ]
  then
    echo "Database doesn't exist! Creating it..."
    sudo -u postgres psql -c "CREATE DATABASE $1 OWNER postgres"
    echo "Completed."
    #create_database=`sudo -u postgres psql -d $1 -f central_config.sql`
    #load_database=`sudo -u postgres psql -d $1 -f load_central_config.sql`
  else
    echo "Database $db_name already exists! Process aborted."
fi

