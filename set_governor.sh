#! /usr/bin/bash

# $1 is the governor

sudo cpupower frequency-set -g $1
