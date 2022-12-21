source connect_menu.sh
function c_onn()
{
    echo "please enter the Database name"
    read Dataname
    if [ -e ./$Dataname ]
        then
            echo "connecting to Database" 
            cd $Dataname
            select option1 in 'Create Table' 'List Tables' 'Drop Table' 'Insert into table' 'Select From Table' 'Delete From Table' 'Update Table' 'Back'
                do
                    echo $option1
                    case $option1 in    'Create Table' ) create_table;;
                                        'List Tables' ) listing_tables;;
                                        'Drop Table' ) break;;
                                        'Insert into table' ) insert_into_table;;
                                        'Select From Table' ) break;;
                                        'Delete From Table'  ) break;;
                                        'Update Table' ) break;;
                                        'Back' ) break;;
                                    
                    esac
                done

            
    else 
        echo "not such Database please enter a valid Database name"
    fi

}
