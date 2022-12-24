function selecting()
{
    echo "please enter name of table to select from"
    read tableName
    if [ -e ./$tableName ]
        then
            echo "connecting to the table" 

            select option2 in 'Select all data' 'Select specific colomun' 'Select specific row' 'Back'
                do
                    echo $option2
                    case $option2 in    'Select all data' ) break;;
                                        'Select specific colomun' ) break;;
                                        'Select specific row' 'Back' ) break;;
                                        'Back' ) 
                                        cd .. 
                                        break
                                        ;;
                                    
                    esac
                done

            
    else 
        echo "No such table, please enter a valid table name"
    fi

}