#!/bin/bash

#######################################################################
# Nginx Config Generator is a virtualmin hook to set Nginx config
# when creating/editing/deleting a virtualserver.

# Copyright (C) 2017 Marc Sanchez Fauste
# Copyright (C) 2017 Adrian Gibanel
# Copyright (C) 2017 BTACTIC, SCCL

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#######################################################################

# This script verifies if the variable 'ssl_combined' is present in the
# configuration of the webmin domains and if it's not present, declares it.

# This is useful because if this variable is not declared the virtualmin
# hook used to create the nginx configuration will not work correctly with
# virtual servers that have SSL enabled.

WEBMIN_DOMAINS_CONF_DIR="/etc/webmin/virtual-server/domains"

for conf_file in ${WEBMIN_DOMAINS_CONF_DIR}/*; do
    if grep "ssl=1" ${conf_file} > /dev/null; then
        if ! grep "ssl_combined" ${conf_file} > /dev/null; then
            ssl_key=$(awk -F '=' '$1 == "ssl_key" {print $2}' ${conf_file})
            if [ -z "${ssl_key}" ]; then
                echo "ERROR: el fichero '${conf_file}' no tiene especificado el valor 'ssl_key'!"
            else
                ssl_combined="$(dirname ${ssl_key})/ssl.combined"
                if [ ! -f "${ssl_combined}" ]; then
                    echo "ERROR: el fichero '${ssl_combined} no existe!'"
                else
                    echo "Adding ssl_combined to '${conf_file}'"
                    echo -e -n "\nssl_combined=${ssl_combined}\n" >> ${conf_file}
                fi
            fi
        fi
    fi
done
