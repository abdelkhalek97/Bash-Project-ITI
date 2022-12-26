#! /bin/bash
export LC_COLLATE=C
shopt -s extglob

function selectAll()
{
    cat $1
    echo ''
}
####################################################selecting using colomun name

function col_num(){
result=`awk -F : -v value=$2 '{
     for (i=1; i<NF; i++){
        if($i == value){
            print(i)
        
        }
     }
    }' $1`
    echo $result
}


function selectColomun()
{
    echo 'please enter coloumn name'
    read colName
    result=`col_num $1 $colName`
    if [[ -z "$result" ]];
    then
    echo "invaild coloumn name"
    else
    awk -F : -v value=$result '{
        if ( NR != 1)
        print($value)
        }' $1
    fi
}