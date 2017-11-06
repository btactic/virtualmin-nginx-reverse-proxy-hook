#!/bin/bash

VIRTUALMIN_CONF_DIR="/etc/webmin/virtual-server/domains"

OLD_PWD="$PWD"


for nconf in ${VIRTUALMIN_CONF_DIR}/* ; do

  sed -i -e 's/''^web_port=.*''/''web_port=8080''/g' \
      -e 's/''^web_sslport=.*''/''web_sslport=8443''/g' \
         "${nconf}"


done





# Go back to original pwd
cd "${OLD_PWD}"


