
# This script should be launched to replay a game session.
# It should be used to launch a game, and start recording
# keyboard and mouse events with libinput.
# Choosen keyboard is the embedded keyboard, and chosen 
# mouse is wireless mouse. 

# Before starting, mouse MUST BE AT THE CORNER DOWN RIGHT.

# $1 is the game to launch
# $2 is the output file

source ./get_attribute.sh

now=$(date +"%y-%m-%d_%H-%M-%S")

export MANGOHUD_CONFIG="autostart_log=1,toggle_logging=F2"

sudo rm /etc/libinput/local-overrides.quirks
./move_to_bottom.sh

game=$(get_attribute games/$1 launch_command)
game_session=$(get_attribute games/$1 game_session)

sudo rm /etc/libinput/local-overrides.quirks
echo $game,recorded_game_sessions/$game_session
mangohud --dlsym $game &
# libinput replay --replay-after 15 ./recorded_game_sessions/$game_session   
