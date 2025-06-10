#! /bin/bash

game=$(get_attribute games/$1 exit_comm)

# Gather system performance statistics using perf
# Ensure the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

game_pid=$(pgrep -f "$game")

# Launch perf stats in the background
perf stat -I 10 -A -a -e cycles,instructions,power/energy-cores/,power/energy-pkg/ -p $game_pid -o perf_stats.txt &

perf record -F 99 -p $game_pid -e sched:* -e power:* -o perf_record.data &

pstree -p $game_pid > threads.txt

# Wait for the game to finish
wait $(pgrep -f )
# Kill the perf process
pkill -f perf

