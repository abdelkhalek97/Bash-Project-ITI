
function listing_tables()
{
    ls -I "*.md" #listing all tables excpet metadata
}

function dataType()
{
    select stint in "String" "Integer"
        do
        case $stint in
            "String")
            echo -n "$stint:" >> "$table_name.md"
            break
            ;;
            "Integer")
            echo -n "$stint:" >> "$table_name.md"
            break
            ;;
            * )
            echo " please enter option 1 or 2 only"
            ;;
        esac
        done
}



function create_table()
{   
    echo "pleas enter table name"
    read table_name
    while [[ ! $table_name =~ ^([a-zA-Z\_])+([a-zA-Z0-9\_])*$ ]];
        do
         echo "pleas enter a valid name choose 5 to Exit"
         read table_name
        done
    while [ -e $table_name ];
        do
            echo "This table is already exist,please enter another name"
            read table_name
        done
    touch $table_name 
    touch "$table_name.md"
    
    echo "please enter the number of columns"
    read number
    while [[ ! $number =~ [0-99]+$ ]];
        do
        echo "please enter a valid number"
        read number
        done
    
    for i in $( seq 1 $number);
        do
            if (( $i==1 ));
                then echo "please enter the primary key"
                    read pk
                    dataType
                echo -n "$pk:" > $table_name
                
            else   
                echo "please enter column name"
                read variable
                dataType
                echo -n "$variable:" >> $table_name
                
            fi
            if (( $i==$number ));
                then echo "" >> $table_name
            fi
        done
    
}


# function insert_into_table()
# {
    
#     echo "please enter table name"
#     read table2
#     while [ ! -e $table2 ]
#         do
#             echo "table doesnt exist , try again or exit"
#             read table2
#             if [ $table2 == 'exit' ]
#                 then break
#             fi
#         done
#     while [ -e $table2 ]
#     do
#         echo "please enter the primary key"
#         read pk1
#         x=$(head -n1 "./$table2.md" | awk -F : '{print $1;}')
#         if [ "$x" = "int" ] && [[ $pk1 =~ [0-99]+$ ]]
#             then echo  "$pk1:" >> $table2
#             break
#         elif [ "$x" = "string" ]
#             then echo  "$pk1:" >> $table2
#             break
#         else
#             echo "type is not matched, type = $x"
#             continue 
#         fi
        
        
#     done


# }

#insert_into_table
function insert()
{
echo "please enter table name"
    read table2
declare -i number=$(head -n1 "$table2.md" | awk -F : '{print NF-1 ;}')



#cut -d: -f1 amr   select coloums
for i in $(seq 1 $number);
    do
        col_name=$(head -n1 $table2 | sed  $'s/:/ /g' | awk -v i=$i -F " " '{ print $i }')
        col_type=$(head -n1 $table2.md | sed  $'s/:/ /g' | awk -v i=$i -F " " '{ print $i }')
        while [ -e $table2 ]
        do
            echo "please enter the $col_name" 
            read x
            if [ "$col_type" = "Integer" ] && [[ $x =~ [0-99]+$ ]]
                then echo -n  "$x:" >> $table2
                break
            elif [ "$col_type" = "String" ]
                then echo -n  "$x:" >> $table2
                break
            else
                echo "type is not matched, type = $col_type"
                continue 
            fi
        done
        if (( $i==$number ));
        then   
            echo "" >> $table2
        fi
    done
}