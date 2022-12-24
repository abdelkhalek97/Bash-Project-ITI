#! /bin/bash
export LC_COLLATE=C
shopt -s extglob

function selectAll()
{
    cat $1
    echo ''
}

# function selectColomun()
# {

# }