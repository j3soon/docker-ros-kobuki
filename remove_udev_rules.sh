#!/bin/bash -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

sudo rm /etc/udev/rules.d/60-kobuki.rules
sudo service udev reload
sudo service udev restart
echo "done"
