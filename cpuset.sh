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
    TOTAL=31
    echo Setting cpu config $1...

    # First deactivate all cores
    echo "First, deactivate all cores..."
    for cpu in `seq 1 $TOTAL`; do
	echo "    - Deactivating core $cpu..."
        cpuset $cpu 0
    done

    # Second, activate only relevant cores
    echo "Second, activate relevant cores..."
    cores=$(echo $1 | tr ',' ' ')
    for cpu in $cores; do
        echo "    - Activating core $cpu..."
        cpuset $cpu 1
    done

    echo "Done!"
}
