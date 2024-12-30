#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "ACTION==\"add\", ATTRS{idVendor}==\"2dc8\", ATTRS{idProduct}==\"3106\", RUN+=\"/sbin/modprobe xpad\", RUN+=\"/bin/sh -c \'echo 2dc8 3106 > /sys/bus/usb/drivers/xpad/new_id\'" > /etc/udev/rules.d/99-8bitdo-xinput.rules
udevadm control --reload
