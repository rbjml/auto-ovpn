#!/usr/bin/env bash
#
# Auto OVPN gnome extension
# https://jasonmun.blogspot.my
# https://github.com/yomun/auto-ovpn
# 
# Copyright (C) 2017 Jason Mun
# 
# Auto OVPN gnome extension is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# Auto OVPN gnome extension is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with Auto OVPN gnome extension.  If not, see <http://www.gnu.org/licenses/>.
# 

INPUT_STR="${1}"

IP_RE='^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'

DEFAULT_IP="8.8.8.8"

IP_OUTPUT=""

if [ ${#INPUT_STR} -gt 0 ]
then
	# echo "+"
	IP_OUTPUT=`dig TXT +short o-o.myaddr.l.google.com @ns1.google.com`
else
	# echo "-"
	IP_OUTPUT=`dig +short myip.opendns.com @resolver1.opendns.com`
fi

IP=`echo ${IP_OUTPUT} | sed "s/\"//g"`

if [[ ${IP} =~ ${IP_RE} ]]
then
	echo "${IP}"
else
	echo "${DEFAULT_IP}"
fi
