source connect_menu.sh
source Select_menu.sh
source delete1.sh
source update.sh
function c_onn() {
    Dataname=$(whiptail --inputbox "please enter the Database name" 8 39 --title "Connecting to DataBase" 3>&1 1>&2 2>&3)
    while [[ -z "$Dataname" ]]; do
        Dataname=$(whiptail --inputbox "please enter a valid Database name" 8 39 --title "Connecting to DataBase" 3>&1 1>&2 2>&3)
    done
    if [ -e ./$Dataname ]; then
        whiptail --msgbox "Connecting to DataBase" 20 78
        cd $Dataname

        while [ 1 ]; do

            CHOICE=$(
                whiptail --title "Operative Systems" --menu "Make your choice" 16 100 9 \
                    "1)" "Create Table" \
                    "2)" "List Tables" \
                    "3)" "Drop Table" \
                    "4)" "Insert into table" \
                    "5)" "Select From Table" \
                    "6)" "Delete From Table" \
                    "7)" "Update Table" \
                    "8)" "Back" 3>&2 2>&1 1>&3
            )

            case $CHOICE in
            "1)")
                create_table
                ;;

            "2)")
                listing_tables
                ;;

            "3)")
                insert
                ;;

            "4)")
                dropTable
                ;;

            "5)")
                selecting
                ;;

            "6)")
                delete
                ;;

            "7)")
                update
                ;;

            "8)")
                whiptail --msgbox "returning to main menu..." 20 78
                cd ..
                break
                ;;
            esac
        done
    else
        echo "no such Database please enter a valid Database name"
    fi

}
