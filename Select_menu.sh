source selectingScript.sh

function selecting() {
    echo "please enter name of table to select from"
    read tableName
    while [[ -z "$tableName" ]]; do
        echo "please enter a valid table name"
        read tableName
    done
    if [ -e ./$tableName ]; then
        echo "connecting to the table"

        select option2 in 'Select all data' 'Select specific colomun' 'Select specific row' 'Back'; do
            echo $option2
            case $option2 in 'Select all data') selectAll $tableName ;;
            'Select specific colomun') selectColomun $tableName ;;
            'Select specific row') selectRow $tableName ;;
            'Back') break ;;

            esac
        done

    else

        echo "No such table, please enter a valid table name"
    fi

}
