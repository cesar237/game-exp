#! /usr/bin/bash

cpuset() {
    # Write in /sys/devices/system/cpu/cpu[ID]/online
    # parameters : $1 is the CPU core ID, and $2 is 0|1

    command="echo $2 > /sys/devices/system/cpu/cpu$1/online"
    sudo /bin/sh -c "$command"
}

reinit_cpu() {
    for i in `seq 1 31`; do
	cpuset $i 1
    done
}

set_cpuconfig() {
    # This function activate or deactivate CPU core list.
    TOTAL=32

    # First deactivate all cores
    for cpu in `seq 2 $TOTAL`; do
        cpuset $cpu 0
    done

    # Second, activate only relevant cores
    cores=$(echo $1 | tr ',' ' ')
    for cpu in $cores; do
        cpuset $cpu 1
    done
}
