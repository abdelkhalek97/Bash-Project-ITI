#! /bin/bash

function Create_database() {

    echo "please enter Database name or enter 'exit'"
    read name
    while [[ ! $name =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]]; do
        echo "pleas enter a valid name or enter 'exit' "
        read name
        if [[ $name=='exit' ]]; then
            break
        fi
    done

    while [ -e $name ] || [[ !( $name =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ || "$name" = 'exit') ]]; do
        echo "This name is already taken or invalid name please choose another name or enter 'exit'"
        read name
    done
    if [ $name != 'exit' ]; then
        mkdir ./$name
    fi

}
