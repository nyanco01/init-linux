#!/bin/bash
readonly SETUP_DIR="$HOME/init-linux/"

red=31
yellow=33
cyan=36
blue=32

colored() {
    color=$1
    shift
    echo -e "\033[1;${color}m$@\033[0m"
}

CHECK() {
    "$@"
    result=$?
    if [ $result -ne 0 ]
    then
        echo -n $(colored $red "Failed:")
        echo -n $(colored $cyan " $@")
        echo -n $(colored $yellow " [$PWD]")
        echo  $(colored $blue " $result")
        # echo "Failed: $@ [$PWD]" >&2
        exit $result
    fi
    return 0
}

