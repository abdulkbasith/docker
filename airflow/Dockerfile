# # Author: Abdul Basith
# # Created on: 30/08/2022
# # ------------------------------------------------ #

# base centos 7
FROM centos:centos7.9.2009

# installing required packages
RUN yum groupinstall "Development Tools" -y && yum install epel-release net-tools sudo vim wget python3 python3-devel tar gzip gcc make expect -y && \
    yum install python-devel mysql-devel -y && yum clean all && rm -rf /var/cache/yum

# copy airflow config
COPY airflow.cfg /opt/airflow/
COPY plugins/ /opt/airflow/plugins/ 
COPY dags/ /opt/airflow/dags/

# Preparing for airflow
RUN pip3 install --user --upgrade pip

ENV AIRFLOW_HOME="/opt/airflow"
ENV AIRFLOW_VERSION 2.2.3
ENV PYTHON_VERSION 3.6
ENV CONSTRAINT_URL "https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"

RUN pip3 install setuptools-rust && pip3 install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}" && \
    pip3 install mysqlclient

COPY entrypoint.sh requirements.txt /
RUN pip3 install --no-cache-dir --user -r /requirements.txt

# Making script executable
RUN chmod a+x /*.sh

# call entrypoint.sh
CMD ["/entrypoint.sh"]
