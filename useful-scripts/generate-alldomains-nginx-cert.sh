#!/bin/bash

#######################################################################
# Nginx Config Generator is a virtualmin hook to set Nginx config
# when creating/editing/deleting a virtualserver.

# Copyright (C) 2017 Adrian Gibanel
# Copyright (C) 2017 BTACTIC, SCCL
# Copyright (C) 2017 Marc Sanchez Fauste

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

SSL_CERT_PRIVATE_KEY_FILE="/etc/ssl/private/alldomains-nginx.key"
SSL_CERT_PRIVATE_CRT_FILE="/etc/ssl/certs/alldomains-nginx.crt"
KEY_BITS=2048
VALID_DAYS=3650
CN="*"

# Certificate details
subj="/CN=${CN}"

# Generate a Self-Signed Certificate
openssl req \
        -newkey rsa:${KEY_BITS} -nodes -keyout ${SSL_CERT_PRIVATE_KEY_FILE} \
        -x509 -days ${VALID_DAYS} -out ${SSL_CERT_PRIVATE_CRT_FILE} \
        -batch -subj ${subj}

