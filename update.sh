#! /bin/bash
source updetails.sh
export LC_COLLATE=C
shopt -s extglob

function update() {
    flag=0
    read -r -p "please enter table name : " u_table_name
    while [[ -z "$u_table_name" ]]; do # user regex to no insert null char
        read -r -p "please enter valid table name : " u_table_name
    done
    while [ ! -e $u_table_name ] || [[ -z "$u_table_name" ]]; do
        echo "table doesnt exist or invalid input , try again or exit"
        read -r u_table_name
        if [[ $u_table_name == 'exit' ]]; then
            flag=1
            break
        fi
    done
    if (($flag != 1)); then
        read -r -p "please enter column name : " u_colomun_name
        while [[ -z "$u_colomun_name" ]]; do # user regex to no insert null char
            read -r -p "please enter valid column name : " u_colomun_name
        done
        flag2=$(check_valid_col_name $u_table_name $u_colomun_name)
        while [ ! $flag2 ]; do
            read -r -p "column doesn't exist please enter a valid column name : " u_colomun_name
            flag2=$(check_valid_col_name $u_table_name $u_colomun_name)
            if [[ $u_colomun_name == 'exit' ]]; then
                break
            fi
        done
        if [ $flag2 ]; then
            col_num2=$(get_column_number $u_table_name $u_colomun_name)
            read -r -p "Please enter value you want to update : " field_update
            while [[ -z "$field_update" ]]; do # user regex to no insert null char
                read -r -p "please enter valid value : " field_update
            done
            declare -a var2
            var2=$(selection_condition $field_update $col_num2 $u_table_name)
            col_type=$(head -n1 "$u_table_name.md" | sed $'s/:/ /g' | awk -v i=$col_num2 -F " " '{ print $i }')
            echo "$col_type"

            check_datatype $u_table_name $col_num2 $col_type
            declare -i count=0
            for i in ${var2[@]}; do
                update_from_table $i $col_num2 $update_value
                count=count+1
            done
            echo "$count rows affected"
        fi
    fi
}
