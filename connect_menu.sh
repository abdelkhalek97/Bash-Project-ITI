
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
            echo -n "$stint:" > "$table_name.md"
            break
            ;;
            "Integer")
            echo -n "$stint:" > "$table_name.md"
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
        done
}


function insert_into_table()
{
    touch btngan
    echo "please enter table name"
    read table2
    while [ ! -e $table2 ]
        do
            echo "table doesnt exist , try again or exit"
            read table2
            if [ $table2 == 'exit' ]
                then break
            fi
        done
    while [ -e $table2 ]
    do
        echo "please enter the primary key"
        read pk1
        x=$(head -n1 "./$table2.md" | awk -F : '{print $1;}')
        if [ x=="int" ] && [[ $pk1 =~ [0-99]+$ ]]
            then echo  "$pk1:" >> $table2
            break
        elif [ x == "string" ]
            then echo  "$pk1:" >> $table2
            break
        else
            echo "type is not matched, type = $x"
            continue 
        fi
        
        
    done


}