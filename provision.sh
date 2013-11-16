#!/bin/bash

BASEDIR=$(dirname $0)

apt-get update && \
apt-get purge x11-common lxde midori scratch && \
apt-get autoremove && \
apt-get install upstart puppet-common && \
puppet apply --modulepath=$BASEDIR/modules -e "include radiodan"
