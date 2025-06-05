#! /usr/bin/bash

HOME=/home/cmounahh

# Perf launcher
launch_trace_cmd() {
    # Launch perf to record metrics.
    # Must run as root.
    # $1 is the output directory
    now=$(date +"%y-%m-%d_%H-%M-%S")

    sudo trace-cmd record -p nop -e sched -v -e sched_stat_runtime -o $1/sched_traces_$now.dat sleep 600
}

# PCM Launcher
launch_pcm() {
    # $1 parameter is the attributes of the current
    # experiment. It should give:
    #  - the cpu configurations
    #  - the launched game
    # It should be a string like: xonotic_6P
    # Should create a directory like xonotic/6P/pcm_XXX.csv
    now=$(date +"%y-%m-%d_%H-%M-%S")

    sudo $HOME/Documents/Tools/pcm/build/bin/pcm 1 -csv=$1/pcm_$now.csv
}

# Scaphandre Launcher
launch_scaphandre() {
    now=$(date +"%y-%m-%d_%H-%M-%S")

    sudo $HOME/.cargo/bin/scaphandre json -s 1 -f $1/scaph_$now.json
}

# Turbostat Launcher
launch_turbostat() {
    now=$(date +"%y-%m-%d_%H-%M-%S")

    # $2 is the type of test.

    sudo turbostat -q --show Core,CPU,Avg_MHz,Bzy_MHz,IPC,IRQ,PkgWatt,CorWatt,GFXWatt,RAMWatt,UncMHz --interval 1 --out $1/turbostat_$now-$2.json
}

# NVIDIA_SMI Launcher
launch_nvidia_smi() {
    now=$(date +"%y-%m-%d_%H-%M-%S")

    # $2 is the type of test.

    nvidia-smi dmon -f $1/nvidia_$now-$2.json
}

# mpstat Launcher
launch_mpstat() {
    now=$(date +"%y-%m-%d_%H-%M-%S")

    # $2 is the type of test.

    sar -A -o $1/sar_$now-$2.data 1 300 > /dev/null
}
