# (c) Copyright 2021 Eugene Ciurana
# License:  https://raw.githubusercontent.com/pr3d4t0r/pikache/master/LICENSE

# vim: set fileencoding=utf-8:


FROM                    python:latest
MAINTAINER              pikache@cime.net

LABEL                   author="Eugene Ciurana"
LABEL                   copyright="(c) Copyright 2021 Eugene Ciurana"
LABEL                   description="Dockerized Package Index devpi server"
LABEL                   support="pikache@cime.net"


# devpi installation

ENV                     HOME=/root
RUN                     apt-get update && apt-get -y upgrade
RUN                     apt-get install -y tree
RUN                     pip install -U pip \
                            devpi-client \
                            devpi-server \
                            devpi-web

# useradd -b /home/devpi -d /home/devpi -s /bin/bash devpi
RUN                     mkdir -p /etc/devpi-server
COPY                    resources/devpi-server.yaml /etc/devpi-server
COPY                    resources/secret /home/devpi/.secret
RUN                     chmod 0600 /home/devpi/.secret

RUN                     useradd -m -b /home/devpi -d /home/devpi -s /bin/bash devpi
COPY                    runserver /home/devpi
ENV                     HOME=/home/devpi
RUN                     mkdir -p /home/devpi/.devpi
RUN                     mkdir -p /home/devpi/repository
RUN                     chown -Rfv devpi.devpi /home/devpi
RUN                     chown devpi.devpi /home/devpi/.secret
USER                    devpi

# Debugging aid:
ENTRYPOINT              /bin/bash -c "while true; do sleep 60; done"

# ENTRYPOINT              /home/devpi/runserver

