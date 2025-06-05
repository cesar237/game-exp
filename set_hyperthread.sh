#! /usr/bin/bash

# $1 : value to write: active|passive

status=`cat /proc/sys/kernel/sched_energy_aware`
sudo sh -c "echo $1 > /sys/devices/system/cpu/smt/control"
