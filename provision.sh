#!/bin/bash
# Runs all the package commands necessary
# for cold_start including installing upstart
# and running puppet
#
BASEDIR=$(dirname $0)
FORCE=false

if [ "$1" = "--force-yes" ]; then
  FORCE=true
fi

echo "Radiodan cold start provisioner"

if $FORCE; then
  echo "...force yes on all decisions"
  apt_options="-o DPkg::options=--force-remove-essential --yes --force-yes"
else
  echo "...no force will be used"
  apt_options=""
fi

apt-get $apt_options update && \
apt-get $apt_options purge x11-common lxde midori scratch && \
apt-get $apt_options autoremove

# Upstart requires a bit of magic to force since on Debian
# it's replacing an essential package
if $FORCE; then
  echo "Installing upstart with force"
  echo 'Yes, do as I say!' | apt-get $apt_options install upstart
else
  echo "Installing upstart"
  apt-get $apt_options install upstart
fi

apt-get $apt_options install puppet-common && \
puppet apply --modulepath=$BASEDIR/modules -e "include radiodan"
