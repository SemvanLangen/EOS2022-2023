#!/bin/bash

# Kijken of er een argument is opgegeven
if [ -z "$1" ]; then
	echo "Please give the path to the output file"
	exit 1
else
	output_file="$1"
fi

# Vraag om de naam van de gebruiker
echo "What is your name: "
read name

# Als de input leeg is gebruik whoami, zo niet gebruik de naam
if [ ${#name} == 0 ]; then
	name=$(whoami)
	echo "$name"
else
	echo "$name"
fi

# Vraag voor het wachtwoord met eisen eraan
correct_flag=0
while [ $correct_flag -eq 0 ]; do
	echo "Please enter your password: "
	read first_password
	if [ ${#first_password} -lt 8 ]; then
		echo "Password needs to be at least 8 characters long"
		continue
	fi
	echo "Please confirm your password: "
	read second_password

	if [ "$first_password" == "$second_password" ]; then
		echo "Correct, processing..."
		correct_flag=1
	else
		echo "Incorrect, please try again"
	fi
done

# Password hash maken
password_hash=$(echo -n "$first_password" | md5sum | awk '{print $output_file}')

# Schrijven naar het output bestand
echo "Username: $name, Password: $password_hash" > "$output_file"

echo "Data has been stored in: $output_file"

exit 0
