#! /usr/bin/bash

# $1 : value to write: 0 to disable, 1 to enable

# status=`cat /proc/sys/kernel/sched_energy_aware`
# sudo sh -c "echo $(( (status + 1) % 2 )) > /proc/sys/kernel/sched_energy_aware"
sudo sh -c "echo $1 > /proc/sys/kernel/sched_energy_aware"