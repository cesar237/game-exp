#! /usr/bin/bash

# game=$1
# runs=$2

CPU_CONFIGS="8P 4P-4E 2P-6E 6P-2E"


now=$(date +"%y-%m-%d_%H-%M-%S")

eas=$(./status_eas.sh)
ht=$(./status_hyperthread.sh)
pstate=$(./status_pstate.sh)
governor=$(./status_governor.sh)

echo [$now] Starting test with game=$1 EAS=$eas HT=$ht PSTATE=$pstate governor=$governor 

mkdir -p results/$1
sudo turbostat --show Core,CPU,Avg_MHz,Bzy_MHz,IPC,IRQ,PkgWatt,CorWatt -i 1 --out results/$1/base_cpu_$now.data &

sleep 60;

sudo killall -9 turbostat;

for run in `seq 1 $2`; do
	for config in $CPU_CONFIGS; do
		./launch_test.sh $1 $config;
		pkill -9 CombatMaster
		pkill -9 xonotic
		pkill -9 xonotic
		# kill -9 `pgrep cs2`;
		# kill -9 `pgrep cs2`;
		sleep 10;
	done
done

exp_output_dir=results-$eas-$ht-$pstate-$governor
mkdir -p $exp_output_dir
mkdir -p final_res_final

mv results $exp_output_dir
mv $exp_output_dir final_res_final/




# ./set_hyperthread.sh off;
# ./set_pstate.sh active;
# ./set_governor.sh performance;

# now=$(date +"%y-%m-%d_%H-%M-%S")

# eas=$(./status_eas.sh)
# ht=$(./status_hyperthread.sh)
# pstate=$(./status_pstate.sh)
# governor=$(./status_governor.sh)

# echo [$now] Starting test with game=$1 EAS=$eas HT=$ht PSTATE=$pstate governor=$governor 

# mkdir -p results/$1
# sudo turbostat --show Core,CPU,Avg_MHz,Bzy_MHz,IPC,IRQ,PkgWatt,CorWatt -i 1 --out results/$1/base_cpu_$now.data &

# sleep 60;

# sudo killall -9 turbostat;

# for run in `seq 1 $2`; do
#         for config in $CPU_CONFIGS; do
#                 ./launch_test.sh $1 $config;
#                 pkill -9 CombatMaster
#                 pkill -9 xonotic
#                 pkill -9 xonotic
#                 # kill -9 `pgrep cs2`;
#                 # kill -9 `pgrep cs2`;
#                 sleep 10;
#         done
# done

# exp_output_dir=results-$eas-$ht-$pstate-$governor
# mkdir -p $exp_output_dir
# mkdir -p final_res_final

# mv results $exp_output_dir
# mv $exp_output_dir final_res_final/















# ./set_hyperthread.sh on;
# ./set_pstate.sh active;
# ./set_governor.sh powersave;

# now=$(date +"%y-%m-%d_%H-%M-%S")

# eas=$(./status_eas.sh)
# ht=$(./status_hyperthread.sh)
# pstate=$(./status_pstate.sh)
# governor=$(./status_governor.sh)

# echo [$now] Starting test with game=$1 EAS=$eas HT=$ht PSTATE=$pstate governor=$governor 

# mkdir -p results/$1
# sudo turbostat --show Core,CPU,Avg_MHz,Bzy_MHz,IPC,IRQ,PkgWatt,CorWatt -i 1 --out results/$1/base_cpu_$now.data &

# sleep 60;

# sudo killall -9 turbostat;

# for run in `seq 1 $2`; do
# 	for config in $CPU_CONFIGS; do
# 		./launch_test.sh $1 $config;
# 		pkill -9 CombatMaster
# 		pkill -9 xonotic
# 		pkill -9 xonotic
# 		# kill -9 `pgrep cs2`;
# 		# kill -9 `pgrep cs2`;
# 		sleep 10;
# 	done
# done

# exp_output_dir=results-$eas-$ht-$pstate-$governor
# mkdir -p $exp_output_dir
# mkdir -p final_res_final

# mv results $exp_output_dir
# mv $exp_output_dir final_res_final/




# ./set_hyperthread.sh off;
# ./set_pstate.sh active;
# ./set_governor.sh powersave;

# now=$(date +"%y-%m-%d_%H-%M-%S")

# eas=$(./status_eas.sh)
# ht=$(./status_hyperthread.sh)
# pstate=$(./status_pstate.sh)
# governor=$(./status_governor.sh)

# echo [$now] Starting test with game=$1 EAS=$eas HT=$ht PSTATE=$pstate governor=$governor 

# mkdir -p results/$1
# sudo turbostat --show Core,CPU,Avg_MHz,Bzy_MHz,IPC,IRQ,PkgWatt,CorWatt -i 1 --out results/$1/base_cpu_$now.data &

# sleep 60;

# sudo killall -9 turbostat;

# for run in `seq 1 $2`; do
#         for config in $CPU_CONFIGS; do
#                 ./launch_test.sh $1 $config;
#                 pkill -9 CombatMaster
#                 pkill -9 xonotic
#                 pkill -9 xonotic
#                 # kill -9 `pgrep cs2`;
#                 # kill -9 `pgrep cs2`;
#                 sleep 10;
#         done
# done

# exp_output_dir=results-$eas-$ht-$pstate-$governor
# mkdir -p $exp_output_dir
# mkdir -p final_res_final

# mv results $exp_output_dir
# mv $exp_output_dir final_res_final/













# ./set_hyperthread.sh on;
# ./set_pstate.sh passive;
# ./set_governor.sh performance;

# now=$(date +"%y-%m-%d_%H-%M-%S")

# eas=$(./status_eas.sh)
# ht=$(./status_hyperthread.sh)
# pstate=$(./status_pstate.sh)
# governor=$(./status_governor.sh)

# echo [$now] Starting test with game=$1 EAS=$eas HT=$ht PSTATE=$pstate governor=$governor 

# mkdir -p results/$1
# sudo turbostat --show Core,CPU,Avg_MHz,Bzy_MHz,IPC,IRQ,PkgWatt,CorWatt -i 1 --out results/$1/base_cpu_$now.data &

# sleep 60;

# sudo killall -9 turbostat;

# for run in `seq 1 $2`; do
# 	for config in $CPU_CONFIGS; do
# 		./launch_test.sh $1 $config;
# 		pkill -9 CombatMaster
# 		pkill -9 xonotic
# 		pkill -9 xonotic
# 		# kill -9 `pgrep cs2`;
# 		# kill -9 `pgrep cs2`;
# 		sleep 10;
# 	done
# done

# exp_output_dir=results-$eas-$ht-$pstate-$governor
# mkdir -p $exp_output_dir
# mkdir -p final_res_final

# mv results $exp_output_dir
# mv $exp_output_dir final_res_final/




# ./set_hyperthread.sh off;
# ./set_pstate.sh passive;
# ./set_governor.sh performance;

# now=$(date +"%y-%m-%d_%H-%M-%S")

# eas=$(./status_eas.sh)
# ht=$(./status_hyperthread.sh)
# pstate=$(./status_pstate.sh)
# governor=$(./status_governor.sh)

# echo [$now] Starting test with game=$1 EAS=$eas HT=$ht PSTATE=$pstate governor=$governor 

# mkdir -p results/$1
# sudo turbostat --show Core,CPU,Avg_MHz,Bzy_MHz,IPC,IRQ,PkgWatt,CorWatt -i 1 --out results/$1/base_cpu_$now.data &

# sleep 60;

# sudo killall -9 turbostat;

# for run in `seq 1 $2`; do
#         for config in $CPU_CONFIGS; do
#                 ./launch_test.sh $1 $config;
#                 pkill -9 CombatMaster
#                 pkill -9 xonotic
#                 pkill -9 xonotic
#                 # kill -9 `pgrep cs2`;
#                 # kill -9 `pgrep cs2`;
#                 sleep 10;
#         done
# done

# exp_output_dir=results-$eas-$ht-$pstate-$governor
# mkdir -p $exp_output_dir
# mkdir -p final_res_final

# mv results $exp_output_dir
# mv $exp_output_dir final_res_final/


















# ./set_hyperthread.sh on;
# ./set_pstate.sh passive;
# ./set_governor.sh schedutil;

# now=$(date +"%y-%m-%d_%H-%M-%S")

# eas=$(./status_eas.sh)
# ht=$(./status_hyperthread.sh)
# pstate=$(./status_pstate.sh)
# governor=$(./status_governor.sh)

# echo [$now] Starting test with game=$1 EAS=$eas HT=$ht PSTATE=$pstate governor=$governor 

# mkdir -p results/$1
# sudo turbostat --show Core,CPU,Avg_MHz,Bzy_MHz,IPC,IRQ,PkgWatt,CorWatt -i 1 --out results/$1/base_cpu_$now.data &

# sleep 60;

# sudo killall -9 turbostat;

# for run in `seq 1 $2`; do
# 	for config in $CPU_CONFIGS; do
# 		./launch_test.sh $1 $config;
# 		pkill -9 CombatMaster
#                 # pkill -9 CombatMaster;
# 		pkill -9 xonotic
# 		pkill -9 xonotic
# 		# kill -9 `pgrep cs2`;
# 		# kill -9 `pgrep cs2`;
# 		sleep 10;
# 	done
# done

# exp_output_dir=results-$eas-$ht-$pstate-$governor
# mkdir -p $exp_output_dir
# mkdir -p final_res_final

# mv results $exp_output_dir
# mv $exp_output_dir final_res_final/




# ./set_hyperthread.sh off;
# ./set_pstate.sh passive;
# ./set_governor.sh schedutil;

# now=$(date +"%y-%m-%d_%H-%M-%S")

# eas=$(./status_eas.sh)
# ht=$(./status_hyperthread.sh)
# pstate=$(./status_pstate.sh)
# governor=$(./status_governor.sh)

# echo [$now] Starting test with game=$1 EAS=$eas HT=$ht PSTATE=$pstate governor=$governor 

# mkdir -p results/$1
# sudo turbostat --show Core,CPU,Avg_MHz,Bzy_MHz,IPC,IRQ,PkgWatt,CorWatt -i 1 --out results/$1/base_cpu_$now.data &

# sleep 60;

# sudo killall -9 turbostat;

# for run in `seq 1 $2`; do
#         for config in $CPU_CONFIGS; do
#                 ./launch_test.sh $1 $config;
#                 pkill -9 CombatMaster
#                 pkill -9 xonotic
#                 pkill -9 xonotic
#                 # kill -9 `pgrep cs2`;
#                 # kill -9 `pgrep cs2`;
#                 sleep 10;
#         done
# done

# exp_output_dir=results-$eas-$ht-$pstate-$governor
# mkdir -p $exp_output_dir
# mkdir -p final_res_final

# mv results $exp_output_dir
# mv $exp_output_dir final_res_final/