. ./cpuset.sh

./set_pstate.sh active
reinit_cpu
./set_hyperthread.sh off && ./set_eas.sh 1 && ./set_governor.sh performance
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10

reinit_cpu
./set_hyperthread.sh on && ./set_eas.sh 1 && ./set_governor.sh performance
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10

reinit_cpu
./set_hyperthread.sh off && ./set_eas.sh 1 && ./set_governor.sh powersave
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10

reinit_cpu
./set_hyperthread.sh on && ./set_eas.sh 1 && ./set_governor.sh powersave
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10

reinit_cpu
./set_hyperthread.sh off && ./set_eas.sh 0 && ./set_governor.sh performance
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10

reinit_cpu
./set_hyperthread.sh on && ./set_eas.sh 0 && ./set_governor.sh performance
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10

reinit_cpu
./set_hyperthread.sh off && ./set_eas.sh 0 && ./set_governor.sh powersave
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10

reinit_cpu
./set_hyperthread.sh on && ./set_eas.sh 0 && ./set_governor.sh powersave
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10


./set_pstate.sh passive
reinit_cpu
./set_hyperthread.sh off && ./set_eas.sh 1 && ./set_governor.sh performance
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10

reinit_cpu
./set_hyperthread.sh on && ./set_eas.sh 1 && ./set_governor.sh performance
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10

reinit_cpu
./set_hyperthread.sh off && ./set_eas.sh 1 && ./set_governor.sh schedutil
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10

reinit_cpu
./set_hyperthread.sh on && ./set_eas.sh 1 && ./set_governor.sh schedutil
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10

reinit_cpu
./set_hyperthread.sh off && ./set_eas.sh 0 && ./set_governor.sh performance
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10

reinit_cpu
./set_hyperthread.sh on && ./set_eas.sh 0 && ./set_governor.sh performance
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10

reinit_cpu
./set_hyperthread.sh off && ./set_eas.sh 0 && ./set_governor.sh schedutil
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10

reinit_cpu
./set_hyperthread.sh on && ./set_eas.sh 0 && ./set_governor.sh schedutil
./print_current_config.sh >> current_eval
./launch_eval.sh combat_master 10
./launch_eval.sh xonotic 10


