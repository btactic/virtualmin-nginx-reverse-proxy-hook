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

# This script forces the modification of all domains in order to generate
# nginx configuration for each one of them.

for ndomain in $(virtualmin list-domains --name-only); do
    virtualmin modify-domain --domain $ndomain
done
