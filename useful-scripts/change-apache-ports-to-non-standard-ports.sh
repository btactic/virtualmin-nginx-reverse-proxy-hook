#!/bin/bash

VIRTUALMIN_CONF_DIR="/etc/apache2/sites-available"

OLD_PWD="$PWD"


for nconf in ${VIRTUALMIN_CONF_DIR}/* ; do

  sed -i -e 's/'':80>''/'':8080>''/g' \
      -e 's/'':443''/'':8443''/g' \
         "${nconf}"


done





# Go back to original pwd
cd "${OLD_PWD}"


