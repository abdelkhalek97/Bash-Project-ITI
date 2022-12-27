#! /bin/bash

source updetails.sh

function update()
{
declare -i flag=0
read -r -p "please enter table name : " update_table_name

while [ ! -e $update_table_name ]
    do
    echo "table doesnt exist , try again or exit"
    read -r update_table_name
    if [ $update_table_name == 'exit' ]
        then flag=1
        break
    fi
    done
if [ ! $flag == 1 ]
    then
    read -r -p "please enter column name : " update_column_name
    flag2=$(check_valid_col_name $update_table_name $update_column_name)
    while [ ! $flag2 ]
        do
        read -r -p "column doesn't exist please enter a valid column name : " update_column_name
        flag2=$(check_valid_col_name $update_table_name $update_column_name)
        if [ $update_column_name == 'exit' ]
        then 
        break
        fi
        done
if [ $flag2 ]
    then
        col_num2=$(get_column_number $update_table_name $update_column_name)
        read -r -p "Please enter value you want to update : " field_update
        declare -a var2
var2=$(selection_condition $field_update $col_num2 $update_table_name)
col_type=$(head -n1 "$update_table_name.md" | sed  $'s/:/ /g' | awk -v i=$col_num2 -F " " '{ print $i }')
echo "$col_type"

check_datatype $update_table_name $col_num2 $col_type
declare -i count=0
for i in ${var2[@]}; 
    do
    update_from_table $i $col_num2 $update_value
    count=count+1
    done
echo "$count rows affected"
fi
fi
}