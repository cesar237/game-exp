#! /usr/bin/bash

now=$(date +"%y-%m-%d_%H-%M-%S")

eas=$(./status_eas.sh)
ht=$(./status_hyperthread.sh)
pstate=$(./status_eas.sh)
governor=$(./status_governor.sh)

echo [$now] Current config: 
echo [$now] EAS=$eas 
echo [$now] HT=$ht
echo [$now] PSTATE=$pstate
echo [$now] governor=$governor 
