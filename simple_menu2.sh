
#!/bin/bash
#Author: Manuel Salazar email: m1_20@hotmail.com


function printMenu {
  clear
  echo -e "\t\t\t\tMenu\n"
  echo -e "\t\t1. Find the files created before x date."
  echo -e "\t\t2. Find the files create between date x and date y."
  echo -e "\t\t3. Find the files bigger than 1MB."
  echo -e "\t\t4. Find any files containing x string."
  echo -e "\t\t0. Exit.\n\n"
  echo -en "\t\t\tPlease enter an option: "
}

function findFilesCreatedBeforeX {
  clear
  echo -e "Please enter a date."
  read date
  echo "The date entered is $date"
  #example find / -name name
}

function findFilesBiggerThan1M {
  clear
  echo -e "Please enter the directory name and press ENTER: "
  read dir
  echo -e "Listing all the files bigger than 1MB."
  find $dir -type f -size 1M
  #find . -size 1M
}

while [ 1 ]
do
  printMenu
  read -n 1 option
  case $option in
  0)
    break ;;
  1)
    findFilesCreatedBeforeX ;;
  2)
    top10MostRecentFiles ;;
  3)
    findFilesBiggerThan1M ;;
  4)
    top10ProcessesByMemUsage ;;
  5)
    diskUsage ;;
  *)
    clear
    echo "Sorry, wrong selection." ;;
  esac
    echo -en "\n\n\t\tHit any key to return to the menu."
    read -n 1 line
 case $option in
  0)
    break ;;
  1)
    findFilesCreatedBeforeX ;;
  2)
    top10MostRecentFiles ;;
  3)
    findFilesBiggerThan1M ;;
  4)
    top10ProcessesByMemUsage ;;
  5)
    diskUsage ;;
  *)
    clear
    echo "Sorry, wrong selection." ;;
  esac
    echo -en "\n\n\t\tHit any key to return to the menu."
    read -n 1 line
done
clear
