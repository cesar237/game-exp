#! /usr/bin/bash

# This script should setup a given configuration
# and run a given game with the measurement tools.

# The parameters are therefore:
# 1. The game to run
# 2. The CPU configuration
# 3. The scheduler to use
# 4. The power mode
# 5. The metrics to gather

# Make sure to kill all other processes.
# Close current session
# Log into test session
# Perform tests there

# The algorithm :
# A. Set up a scheduler
# B. Set up the CPU configuration
# C. Set up the energy power mode
# D. Launch the game
# E. Launch the tools that gather metrics
# F. Create a log directory for the experiment 
#      and put all the generated log files there.

# Include scripts

source ./get_attribute.sh
source ./cpuset.sh
source ./launch_tools.sh


CORE=0
ATOM=16
TOTAL=32
HOME=/home/cmounahh

# $1 Game
# $2 CPU config

# CPU_CONFIGS="8P 8E 4P-4E 2P-6E 6P-2E"
# GAMES=$(ls games)
# GAMES="cs2"

# for cpu_config in $CPU_CONFIGS; do
cpu_config=$2
cpus=$(get_attribute cpu_configs/config_$cpu_config cpu_config)
echo $cpu_config: $cpus

echo "Setting up cpu_config=$cpus"
set_cpuconfig $cpus
echo "Setting up cpuconfig: Done!"

    # for game in $GAMES; do
game=$1

output_dir="results/$game/$cpu_config"
mkdir -p $output_dir


echo test=Base
echo pwd=`pwd`
# ls `pwd`
echo cpus=$cpus

launch_turbostat $output_dir base &
sleep 20
sudo killall -9 turbostat

echo "Launching game=$game"
./replay_game.sh $game $output_dir &
echo "Game in progress..."

# launch_pcm $output_dir &
# launch_scaphandre $output_dir &

# launch_trace_cmd $output_dir &
launch_turbostat $output_dir &
launch_nvidia_smi $output_dir &

sleep 300
comm=$(get_attribute games/$1 comm)
pkill -9 xonotic
# sudo kill -9 $(pgrep $comm)
# killall -9 python3 # Kill libinput-replay
kill -9 `ps aux | grep libinput | awk '{print $2}'`
# sudo killall -9 pcm
# sudo killall -9 scaphandre
sudo killall -9 turbostat
sudo killall -9 nvidia-smi
#     done
# done

mv /home/cmounahh/*.csv $output_dir
