#! /usr/bin/bash

sudo cpupower frequency-info -p | head -n 3 | tail -n 1 | tr -d \" | awk '{print $3}'