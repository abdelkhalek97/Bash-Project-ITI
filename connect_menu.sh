#! /bin/bash
function listing_tables()
{
    ls -I "*.md" #listing all tables excpet metadata
}
check=4

function dataType()
{
    select stint in "String" "Integer"
        do
        case $stint in
            "String")
            echo -n "$stint:" >> "$table_name.md"
            check=0
            break
            ;;
            "Integer")
            echo -n "$stint:" >> "$table_name.md"
            check=1
            break
            ;;
            * )
            echo " please enter option 1 or 2 only"
            ;;
        esac
        done
}
function checkUnique(){
awk -F':' -v value=$1 '{ 
 if(NR!=1){     
    if($1==value){ 
        print(1);
        }
}
} ' "$2"
}


function create_table()
{   
    echo "please enter table name"
    read table_name
    while [[ !( $table_name =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ || "$table_name" = 'ok') ]];

        do
         echo "please enter a valid name or enter 'ok' to exit"
         read table_name
        done
    while [ -e "$table_name" ] || [[ !( $table_name =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ || "$table_name" = 'ok') ]]
        do
            echo "table already exist or invalid name, enter 'ok' to exit"
            read table_name
        done

    if [ ! "$table_name" = 'ok' ];
        then
        touch $table_name 
        touch "$table_name.md"
        echo "please enter the number of columns"
        read number
        while [[ ! $number =~ [1-99]+$ ]];
            do
            echo "please enter a valid number"
            read number
            done

        for i in $( seq 1 $number);
            do
                if (( $i==1 ));
                    then 
                    echo "please enter the primary key"
                    read pk
                    while [[ ! $pk =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]];
                            do
                             echo "please enter a valid string column name "
                             read pk
                            done
                    dataType
                    echo -n "$pk:" > $table_name

                else
                        echo "please enter column name"
                        read variable  
                        while [[ ! $variable =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]];
                            do
                             echo "please enter a valid string "
                             read variable
                            done
                        dataType
                    echo -n "$variable:" >> $table_name
                fi

                if (( $i==$number ));
                    then echo "" >> $table_name
                fi
            done
    fi    
}

function insert()
    {
    echo "please enter table name"
        read table2
    declare -i number=$(head -n1 "$table2.md" | awk -F : '{print NF-1 ;}')
    
    for i in $(seq 1 $number);
        do
            col_name=$(head -n1 $table2 | sed  $'s/:/ /g' | awk -v i=$i -F " " '{ print $i }')
            col_type=$(head -n1 $table2.md | sed  $'s/:/ /g' | awk -v i=$i -F " " '{ print $i }')
            while [ -e $table2 ]
            do
                echo "please enter the $col_name" 
                read x
                if (( $i==1 ));
                then   
                    if [[ -z "$x" ]];
                    then
                        echo "Invalid id"
                        continue
                    else
                        var=$(checkUnique $x $table2)
                        while [ "$var" = 1 ]
                        do
                            echo "primary key is not unique or invalid ,please enter again :"
                            read x
                            if [[ -z "$x" ]];
                            then
                                continue
                            else
                                var=$(checkUnique $x $table2) 
                            fi
                        done
                    fi
                fi
                if [ "$col_type" = "Integer" ] && [[ $x =~ [0-99]+$ ]]
                    then echo -n  "$x:" >> $table2
                    break
                elif [ "$col_type" = "String" ]
                    then echo -n  "$x:" >> $table2
                    break
                else
                    echo "invalid datatype entered, type = $col_type"
                    continue 
                fi
            done
            if (( $i==$number ));
            then   
                echo "" >> $table2
            fi
        done
    }






function dropTable()
    {
    echo "please enter the table name"
    read tableName2
    while [[ ! -e $tableName2 ]]; do
        echo "please enter valid table name or enter 'exit'"
        read tableName2
        if [[ $tableName2 == 'exit' ]];
        then
            break
        fi
    done

    if [ $tableName2 != 'exit' ]; 
    then
        rm -r ./$tableName2 ./$tableName2.md
    fi
    }
