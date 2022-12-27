#! /bin/bash

source dedetails.sh

function delete()
{
declare -i flag=0
read -p "please enter table name : " table_name

     while [ ! -e $table_name ]
        do
            echo "table doesnt exist , try again or exit"
            read table_name
            if [ $table_name == 'exit' ]
                then flag=1
                break
            fi
        done
        if [ ! $flag == 1 ]
        then
            read -p "please enter column name : " column_name
            flag2=$(columnname_validation $table_name $column_name)
            while [ ! $flag2 ]
            do
            read -p "column doesn't exist please enter a valid column name : " column_name
            flag2=$(columnname_validation $table_name $column_name)
                if [ $column_name == 'exit' ]
                then 
                break
            fi
            done
            if [ $flag2 ]
            then
            columnNo=$(Bring_column_number $table_name $column_name)
            read -p "Please enter value to delete : " value_delete
            declare -a var

            var=$(where_condition $value_delete $columnNo $table_name)
            declare -i count=0
            for i in ${var[@]}; 
            do
            delete_condition $(($i-$count))
            count=count+1
            done
            echo "$count rows affected"
            fi
            fi
}
