source connect_menu.sh
source Select_menu.sh
source delete1.sh
source update.sh

function c_onn() {
    echo "please enter the Database name"
    read Dataname
    while [[ -z "$Dataname" ]]; do
        echo "please enter a valid Database name"
        read Dataname
    done
    if [ -e ./$Dataname ]; then
        echo "connecting to Database"
        cd $Dataname
        select option1 in 'Create Table' 'List Tables' 'Drop Table' 'Insert into table' 'Select From Table' 'Delete From Table' 'Update Table' 'Back'; do
            echo $option1
            case $option1 in 'Create Table') create_table ;;
            'List Tables') listing_tables ;;
            'Drop Table') dropTable ;;
            'Insert into table') insert ;;
            'Select From Table') selecting ;;
            'Delete From Table') delete ;;
            'Update Table') update ;;
            'Back')
                cd ..
                break
                ;;
            esac
        done
    else
        echo "no such Database please enter a valid Database name"
    fi

}
