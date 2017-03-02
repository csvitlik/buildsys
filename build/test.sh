#!/bin/bash

# set -e

fail(){
    msg="$@"
    echo -e "\e[1;31m[+]\e[0m $msg"
}
good(){
    msg="$@"
    echo -e "\e[1;32m[+]\e[0m $msg"
}

run_cmds=0
run_cmds_ok=0
run_cmd(){
    run_cmds=$((run_cmds+1))
    cmd="$@"
    $cmd >/dev/null 2>&1
    if [ $? -eq 0 ]
    then
        run_cmds_ok=$((run_cmds_ok+1))
        good "ok: $cmd"
    else
        fail "err: $cmd"
        exit 1
    fi
}

run_cmd "cd .."
run_cmd "make doc"
run_cmd "make clean"
run_cmd "make hello"
run_cmd "make TARGET=hello V=1 clean"
run_cmd "make clean"

good "$run_cmds_ok / $run_cmds ok"
