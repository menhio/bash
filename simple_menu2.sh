
#!/bin/bash
#Author: Manuel Salazar email: m1_20@hotmail.com


function searchStringInFiles {
  clear
  read -p "Enter the directory name: " dir
  isDir $dir
  read -p "Enter any string to search: " str
  echo -e "Results......"
  find $dir -type f -exec grep -li $str {} \;
}

function findFilesBeforeCreatedDate {
  clear
  echo -e "Finding modified files before the entered date."
  read -p "Enter the directory name: " dir
  isDir $dir
  read -p "Enter the date Ex. 2013-08-19: " date
  find $dir -type f ! -newermt $date | less
}

function findFilesBetweenDates {
  clear
  echo -e "Finding modified files between the given dates."
  read -p "Enter the directory name: " dir
  isDir $dir
  read -p "Enter the lower date: " date1
  read -p "Enter the higher date: " date2
  find $dir -type f -newermt $date1 ! -newermt $date2 | less
}

function findFilesBiggerThan1M {
  clear
  echo -e "Please enter the directory name and press ENTER: "
  read dir
  isDir $dir
  echo -e "Listing all the files bigger than 1MB."
  find $dir -type f -size 1M
}


function printMenu {
  clear
  echo -e "\t\t\t\tMenu\n"
  echo -e "\t\t1. Find the files modified before x date."
  echo -e "\t\t2. Find the files create between date x and date y."
  echo -e "\t\t3. Find the files bigger than 1MB."
  echo -e "\t\t4. Find any given string within files."
  echo -e "\t\t0. Exit.\n\n"
  echo -e "\t\t\tPlease enter an option: "
}

function isDir {
  if ! [ -d $1 ];
  then
    echo -e "$1 is not a valid directory."
    exit 1
  fi
}
function isFile {
  if ! [ -f $1 ];
  then
    echo -e "$1 is not a valid file."
    exit 1
  fi
}

function isNumber {
  if ! [[ $1 =~ '^[0-9]+$' ]];
  then
    echo -e "$1 is not a number"
    exit 1
  fi
}

while [ 1 ]
do
  printMenu
  read -n 1 option
  case $option in
  0)
    break ;;
  1)
    findFilesBeforeCreatedDate ;;
  2)
    findFilesBetweenDates ;;
  3)
    findFilesBiggerThan1M ;;
  4)
    searchStringInFiles ;;
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
