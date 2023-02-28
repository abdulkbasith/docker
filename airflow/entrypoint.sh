#!/bin/bash

echo "Initializing the Airflow DB"
airflow db init

echo "Creating admin User"
airflow users create --username admin --password 'Password' --firstname name  --lastname name --role Admin  --email email

echo "Starting Scheduler"
airflow scheduler -D &

echo "Starting Airflow Webserver"
airflow webserver --port 8080 -D
