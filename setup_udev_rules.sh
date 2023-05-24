#!/bin/bash -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Ref: https://kobuki.readthedocs.io/en/devel/troubleshooting.html#problems-solutions
sudo cp "$DIR/thirdparty/60-kobuki.rules" /etc/udev/rules.d
sudo service udev reload
sudo service udev restart
read -p "Please (re-)connect Kobuki now, and Press enter to continue."
ls /dev/kobuki
echo "done"
