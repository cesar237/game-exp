#! /usr/bin/bash

. cpuset.sh

./set_hyperthread.sh on
reinit_cpu

HTs="on off"
PSTATE="active passive"
EAS="1 0"
ACTIVE_GOVERNORS="performance powersave"
PASSIVE_GOVERNORS="performance schedutil"

GAMES="xonotic combat_master"
RUNS=10


# sudo ./set_pstate.sh active
# sudo ./set_hyperthread.sh on > /dev/null
# sudo ./set_eas.sh 1 > /dev/null
# sudo ./set_governor.sh performance > /dev/null
# ./print_current_config.sh
# ./launch_eval.sh cs2 $RUNS

# # Active pstate
sudo ./set_pstate.sh active
for ht in $HTs; do
	./set_hyperthread.sh $ht > /dev/null
	for eas in $EAS; do
		./set_eas.sh $eas > /dev/null
		for governor in $ACTIVE_GOVERNORS; do
			./set_governor.sh $governor > /dev/null
			# Launch the test
			for game in $GAMES; do
				echo $game
				./print_current_config.sh
				./launch_eval.sh $game 10
			done
		done
	done
done

# Passive pstate
sudo ./set_pstate.sh passive
for ht in $HTs; do
        ./set_hyperthread.sh $ht > /dev/null
        for eas in $EAS; do
                ./set_eas.sh $eas > /dev/null
                for governor in $PASSIVE_GOVERNORS; do
                        ./set_governor.sh $governor > /dev/null
                        # Launch the test
                        for game in $GAMES; do
                                echo $game
                                ./print_current_config.sh
                                ./launch_eval.sh $game 10
                        done
                done
        done
done

./set_hyperthread.sh on
reinit_cpu
