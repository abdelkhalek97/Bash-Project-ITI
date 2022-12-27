#! /bin/bash

function droppingDataBase() {
    echo "please enter the Database name"
    read Dataname1
    while [[ ! -e $Dataname1 ]]; do
        echo "please enter valid database name or enter 'exit'"
        read Dataname1
        if [[ $Dataname1 == 'exit' ]];
        then
            break
        fi
    done

    if [ $Dataname1 != 'exit' ]; 
    then
        rm -r ./$Dataname1
    fi
}