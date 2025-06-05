#! /usr/bin/bash

. cpuset.sh

curr=`pwd`

# HT ON, PSTATE Active, Governor Performance
reinit_cpu; mkdir $curr/results;
./set_hyperthread.sh on
./set_pstate.sh active
./set_governor.sh performance
./launch_eval.sh xonotic 10
mkdir $curr/eas_pstate_performace_ht
mv $curr/results $curr/eas_pstate_performance_ht

reinit_cpu; mkdir $curr/results;

# HT Off, PSTATE Active, Governor Performance
./set_hyperthread.sh off
./set_pstate.sh active
./set_governor.sh performance
./launch_eval.sh xonotic 10
mkdir $curr/eas_pstate_performace
mv $curr/results $curr/eas_pstate_performance

reinit_cpu; mkdir $curr/results;

# HT ON, PSTATE Active, Governor Powersave
./set_hyperthread.sh on
./set_pstate.sh active
./set_governor.sh powersave
./launch_eval.sh xonotic 10
mkdir $curr/eas_pstate_psave_ht
mv $curr/results $curr/eas_pstate_psave_ht

reinit_cpu; mkdir $curr/results;

# HT Off, PSTATE Active, Governor powersave
./set_hyperthread.sh off
./set_pstate.sh active
./set_governor.sh powersave
./launch_eval.sh xonotic 10
mkdir $curr/eas_pstate_psave
mv $curr/results $curr/eas_pstate_psave

reinit_cpu; mkdir $curr/results;

# HT ON, PSTATE passive, Governor Performance
./set_hyperthread.sh on
./set_pstate.sh passive
./set_governor.sh performance
./launch_eval.sh xonotic 10
mkdir $curr/eas_cpufreq_perf_ht
mv $curr/results $curr/eas_cpufreq_perf_ht

reinit_cpu; mkdir $curr/results;

# HT Off, PSTATE passive, Governor Performance
./set_hyperthread.sh off
./set_pstate.sh passive
./set_governor.sh performance
./launch_eval.sh xonotic 10
mkdir $curr/eas_cpufreq_perf
mv $curr/results $curr/eas_cpufreq_perf

reinit_cpu; mkdir $curr/results;

# HT ON, PSTATE passive, Governor schedutil
./set_hyperthread.sh on
./set_pstate.sh passive
./set_governor.sh schedutil
./launch_eval.sh xonotic 10
mkdir $curr/eas_cpufreq_sched_ht
mv $curr/results $curr/eas_cpufreq_sched_ht

reinit_cpu; mkdir $curr/results;

# HT Off, PSTATE passive, Governor schedutil
./set_hyperthread.sh off
./set_pstate.sh passive
./set_governor.sh schedutil
./launch_eval.sh xonotic 10
mkdir $curr/eas_cpufreq_sched
mv $curr/results $curr/eas_cpufreq_sched
