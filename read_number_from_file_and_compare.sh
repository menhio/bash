#!/bin/bash
#Author: Manuel Salazar email: m1_20@hotmail.com
#Read two numbers from a file and tell which is the greater

clear
filename=$1

#Check if there is only one argument
if [ $# -ne 1 ];
then
  echo "--------------------------"
  echo "Please enter the filename!"
  echo "--------------------------"
  exit 1
fi

if [ $# -gt 1 ];
then
  echo "--------------------------------"
  echo "Please enter only one argument!"
  echo "--------------------------------"
  exit 1
fi

if ! [ -f $filename ];
then
  echo "----------------------------------------------------"
  echo "The argument is not valid file or it doesn't exists!"
  echo "----------------------------------------------------"
fi

number1=$(sed -n '1p' <$filename)
if ! [[ $number1 =~ ^[0-9]+$ ]];
then
  echo "---------------------------"
  echo "First line is not a number!"
  echo "---------------------------"
  exit 1
fi

number2=$(sed -n '2p' <$filename)
if ! [[ $number2 =~ ^[0-9]+$ ]];
then
  echo "----------------------------"
  echo "Second line is not a number!"
  echo "----------------------------"
  exit 1
fi

if [[ number1 > number2 ]];
then
  echo "-----------------------------------------------------------------------"
  echo "The first number: $number1 is greater than the second number: $number2."
  echo "-----------------------------------------------------------------------"
elif [[ number1 == number2 ]];
then
  echo "---------------------"
  echo "The number are equal!"
  echo "---------------------"
else
  echo "----------------------------------------------------------------------"
  echo "The second number: $number2 is greater the the first number: $number1."
  echo "----------------------------------------------------------------------"
fi
