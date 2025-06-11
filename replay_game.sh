
# This script should be launched to replay a game session.
# It should be used to launch a game, and start recording
# keyboard and mouse events with libinput.
# Choosen keyboard is the embedded keyboard, and chosen 
# mouse is wireless mouse. 

# Before starting, mouse MUST BE AT THE CORNER DOWN RIGHT.

# $1 is the game to launch
# $2 is the output file

source ./get_attribute.sh

now="date +%y-%m-%d_%H-%M-%S"

export MANGOHUD_CONFIG="autostart_log=1,toggle_logging=F2"

sudo rm /etc/libinput/local-overrides.quirks
./move_to_bottom.sh

game=$(get_attribute games/$1 launch_command)
game_session=$(get_attribute games/$1 game_session)
exit_comm=$(get_attribute games/$1 exit_comm)


sudo rm /etc/libinput/local-overrides.quirks
echo $game,recorded_game_sessions/$game_session
mangohud --dlsym $game &
#$game &
libinput replay --replay-after 10 ./recorded_game_sessions/$game_session &

sleep 10

game_pid=$(pgrep -f "$exit_comm")

# Launch perf stats in the background
sudo turbostat -q --show Time_Of_Day_Seconds,Core,CPU,Avg_MHz,Bzy_MHz,IPC,IRQ,PkgWatt,CorWatt,GFXWatt,RAMWatt,UncMHz,CoreThr,CoreTmp,PkgTmp, --interval 0.01 --out turbostat_$1.txt &
# sudo perf stat -I 10 -A -a -e cycles,instructions,power/energy-cores/,power/energy-pkg/ -o perf_stats.txt &

sudo perf record -F 99 -e sched:* -e power:* -o perf_record.data &

pstree -p $game_pid > threads.txt


sleep 100

sudo pkill -f perf
pkill -f $exit_comm
pkill -f libinput

outputs="turbostat_$1.txt perf_record.data threads.txt"
here=`$now`
mkdir -p results/$1/$here
mv $outputs results/$1/$here
mv $(ls ~ | grep csv) results/$1/$here
