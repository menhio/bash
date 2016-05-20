#!/bin/bash
#Author: Manuel Salazar email: m1_20@hotmail.com

function checkFile {
  if [ "$1" == "" ]
  then
    echo -e "Invalid entry."
    exit
  fi

  if ! [ -f $1 ]
  then
    echo "The file $1 was not found."
    exit
  fi
}

function displayAllRecords {
  clear
  echo -e "Displaying all records."
  read -p "Enter file name: " file
  checkFile $file
  cat $file
}

function displayEmployee {
  clear
  echo -e "Find and Display Employee."
  read -p "Enter file name: " file
  checkFile $file
  read -p "Enter the employee name: " name
  result=$(sed -n "/$name/p" $file)
  if [ "$result" == "" ]
  then
    echo -e "The employee $name was not found."
  else
    echo -e "$result"
  fi
}

function findAndReplaceEmployee {
  clear
  echo "Find and Replace Employee."
  read -p "Enter file name : " file
  checkFile $file
  read -p "Enter the employee name to find and replace: " name1
  read -p "Enter the new employee name: " name2
  sed -n -e "s/$name1/$name2/p" $file
}

function findEmployeeBetweenXandY {
  clear
  echo "Find Employee Between Lines x and y."
  read -p "Enter file name: " file
  checkFile $file
  read -p "Enter the employee name: " name
  read -p "Enter first line number: " line1
  read -p "Enter second line number: " line2
  sed -n -e ''$line1','$line2'{/'$name'/p}' $file
}

function printMenu {
  clear
  echo -e "\t\t\t\tMenu\n"
  echo -e "\t\t1. Display x Employee Record."
  echo -e "\t\t2. Find x Employee and Replace it with y."
  echo -e "\t\t3. Find x Employee and delete it."
  echo -e "\t\t4. Find x employee between lines x to y."
  echo -e "\t\t5. Display all records."
  echo -e "\t\t0. Exit.\n\n"
  echo -en "\t\t\tPlease enter an option: "
}

while [ 1 ]
do
  printMenu
  read -n 1 option
  case $option in
  0)
    break ;;
  1)
    displayEmployee ;;
  2)
    findAndReplaceEmployee ;;
  3)
    findAndDeleteEmployee ;;
  4)
    findEmployeeBetweenXandY ;;
  5)
    displayAllRecords ;;
  *)
    clear
    echo "Sorry, wrong selection." ;;
  esac
    echo -en "\n\n\t\tHit any key to return to the menu."
    read -n 1 line
done
clear
