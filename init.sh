#! /usr/bin/bash

# Initialize the cpu configurations
n_ecores=16
n_ecores=32
configs="8P 8E 4P-4E 2P-6E 6P-2E"

# HT OFF
for config in $configs; do
    ./gen_config.py -c $config -e 16 -t 32 -o cpu_configs/config_$config
done

# HT ON
for config in $configs; do
    ./gen_config.py -c $config -e 16 -t 32 -o cpu_configs/HT_on/config_$config -H
done