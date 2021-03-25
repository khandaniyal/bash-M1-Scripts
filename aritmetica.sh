#!/bin/bash

echo "num1"
read num1

echo "num2"
read num2

result=$((($num1 + $num2)/2))

echo "La media es: ${result}"
