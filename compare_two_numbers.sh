#!/bin/bash
#Author: Manuel Salazar email: m1_20@hotmail.com
#Read two numbers from the keyboard and tell which is greater
clear
isNumber='^[0-9]+$'

echo -n "First number to check: "
read number1
if ! [[ $number1 =~ $isNumber ]];
then
  echo "error: $number1 is not a number"
  exit 1
fi

echo -n "Second number to check: "
read number2
if ! [[ $number2 =~ $isNumber ]];
then
  echo "error: $number2 is not a number"
  exit 1
fi

if [ $number1 == $number2 ]
then
  echo "The numbers are equal"
elif [ $number1 -gt $number2 ]
then
  echo "The first number is: $number1 and is greater than the second number: $number2"
else
  echo "The second number is: $number2 and is greater than the first number: $number1"
fi
