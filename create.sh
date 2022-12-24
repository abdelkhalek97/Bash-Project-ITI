#! /bin/bash

function Create_database()
{
    
    echo "please enter Database name or choose 5 to Exit"
    read name
    while [[ ! $name =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]]
        do
         echo "pleas enter a valid name choose 5 to Exit"
         read name
        done

    while :
    do
        if [ -e $name ];then
            echo "This name is already taken pleas choose another name choose 5 to Exit"
            read name
        else
        mkdir ./$name
        break
        fi
    done

}



















