#! /usr/bin/bash

# Read a config file easily
# $1 is the config file to read
# $2 is the attribute to read

get_attribute() {
    cat $1 | grep $2 | cut -d'=' -f 2-
}