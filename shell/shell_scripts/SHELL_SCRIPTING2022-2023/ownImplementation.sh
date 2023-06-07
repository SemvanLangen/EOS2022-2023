#!/bin/bash

lives=3
number=$((RANDOM % 10))

while true; do
	if [ $lives -eq 0 ]; then
		echo "You ran out of lives, the number was $number. Please feel free to try again."
		exit 1
	fi

	echo "Take a guess: "
	read input

	if ! [[ $input =~ ^[0-9]+$ ]]; then
		echo "Invalid input, please enter a number"
		continue
	fi

	if [ $input -eq $number ]; then
		echo "Congrats! You just guessed the right number: $number"
		exit 0
	elif [ $input -lt $number ]; then
		lives=$((lives - 1))
		echo "Too low, you have $lives left"
	else
		lives=$((lives - 1))
		echo "Too High, you have $lives left"
	fi
done


