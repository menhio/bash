#!/bin/bash
#Author: Manuel Salazar email: m1_20@hotmail.com
#Read two numbers as arguments and print the greater
clear

if [ $# -ne 2 ]
then
  echo "Please enter only two parameters"
  echo "Example: ./scriptname 2 3"
  exit 1
fi

if ! [[ $1 =~ ^[0-9]+$ ]]
then
  echo "The first argument is not a number"
  exit 1
fi

if ! [[ $2 =~ ^[0-9]+$ ]]
then
  echo "The second argument is not a number"
  exit 1
fi

if [ $1 == $2 ]
then
  echo "The numbers are equal"
elif [ $1 -gt $2 ]
then
  echo "The first number is $1 and is greater than the second number $2"
else
  echo "The second number is $2 and is greater than the first number $1"
fi
