#! /bin/bash
export LC_COLLATE=C
shopt -s extglob
# source Select_menu.sh

function selectAll()
{
    cat $1
    echo ''
}
####################################################selecting using colomun name

function col_num(){
result=`awk -F : -v value=$1 '{
     for (i=1; i<NF; i++){
        if($i == value){
            print(i)
        
        }
     }
    }' $2`
    echo $result
}
function selectColomun()
{
    result=`col_num $2 $1`
    awk -F : -v value=$result '{
        if ( NR != 1)
        print($value)
        }' $1
}


function selectRow()
{
    echo "enter a value to print its row"
    read value
    awk -F : -v value=$value '{
        for (i=1; i<NR; i++)
        {
            if($i == value){print($0)}
        }
        } ' $1
}
