FROM ubuntu:14.04

# Install Node.js
RUN apt-get update \
    && apt-get install -y libaio1 \
    && apt-get install -y unzip \
    && apt-get install --yes curl \
    && apt-get install --yes build-essential 

# 10.x to Node.js 10.X, it can be specified for V8.X and other
RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \ 
    && apt-get install -y nodejs  

#ADD ORACLE INSTANT CLIENT
RUN mkdir -p opt/oracle
ADD ./oracle/linux/ .

RUN unzip instantclient-basic-linux.x64-12.2.0.1.0.zip -d /opt/oracle \
    && unzip instantclient-sdk-linux.x64-12.2.0.1.0.zip -d /opt/oracle  \
    && mv /opt/oracle/instantclient_12_2 /opt/oracle/instantclient \
    && ln -s /opt/oracle/instantclient/libclntsh.so.12.2 /opt/oracle/instantclient/libclntsh.so \
    && ln -s /opt/oracle/instantclient/libocci.so.12.2 /opt/oracle/instantclient/libocci.so

ENV LD_LIBRARY_PATH="/opt/oracle/instantclient"
ENV OCI_HOME="/opt/oracle/instantclient"
ENV OCI_LIB_DIR="/opt/oracle/instantclient"
ENV OCI_INCLUDE_DIR="/opt/oracle/instantclient/sdk/include"
ENV OCI_VERSION=12

RUN echo '/opt/oracle/instantclient/' | tee -a /etc/ld.so.conf.d/oracle_instant_client.conf && ldconfig
