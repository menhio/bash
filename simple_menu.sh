
#!/bin/bash
#Author: Manuel Salazar email: m1_20@hotmail.com

function diskUsage {
  clear
  echo -e "\t\tDisk Usage."
  df -h
}

function top10ProcessesByMemUsage {
  clear
  echo -e "\t\tTop 10 Processes Ordered by Memory Usage.\n"
  #ps aux --sort -rss | head -n 10
  top | tail -n +6 | head -10
}

function findProcess {
  clear
  echo -e "\t\tEnter Process Name or PID: \n"
  read psname
  ps aux | grep $psname
}

function printMenu {
  clear
  echo -e "\t\t\t\tMenu\n"
  echo -e "\t\t1. Show Top 10 Biggest Files."
  echo -e "\t\t2. Show Top 10 Lastest Modified Files."
  echo -e "\t\t3. Search for a Process."
  echo -e "\t\t4. List the Top 10 Processes with Most Memory Usage."
  echo -e "\t\t5. List Disk Usage."
  echo -e "\t\t0. Exit.\n\n"
  echo -en "\t\t\tPlease enter an option: "
}

function top10BiggestFiles {
  clear
  echo -e "\t\tTop 10 Biggest Files.\n"
  du -h | sort -nr | head -n 10
}

function top10MostRecentFiles {
  clear
  echo -e "\t\tTop 10 Latest Modified Files.\n"
  ls -lt | head -n 10
}

while [ 1 ]
do
  printMenu
  read -n 1 option
  case $option in
  0)
    break ;;
  1)
 top10BiggestFiles ;;
  2)
    top10MostRecentFiles ;;
  3)
    findProcess ;;
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
