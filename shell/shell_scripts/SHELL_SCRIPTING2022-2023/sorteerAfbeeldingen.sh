#!/bin/bash
#checken of een argument is meegegeven
#if [ $# -eq 1]; then
#	echo "There needs to be 1 argument"
#fi

echo "$# arguments given $1"
#gebruik het eerste argument dat meegegeven is
path="$1"

# -d kijkt of iets nog niet bestaat
if [ ! -d "$path" ]; then
	echo "invalid directory: $path"
	exit 1
fi

#de folder afbeeldingen maken
folder_name="Afbeeldingen"
folder_path="$path/$folder_name"

#checken of het de folder niet al bestaat
if [ -d "$folder_path" ]; then
	echo "'$folder_name' already exists in '$path'"
fi

#daadwerkelijke aanmaken folder
mkdir "$folder_path"
#als exit status van mkdir 0 is is het goed gegaan anders niet
if [ $? -eq 0 ]; then
	echo "Folder was succesfully created"
else
	echo "An error occured while creating this folder"
fi

main_dir="/home"
#move alle jpg en jpeg naar deze map
find "$main_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -exec mv -t "$folder_path" {} +
if [ $? -eq 0 ]; then
	echo "All JPG and JPEG moved to $folder_path"
else
        echo "An error occured while moving all JPG and JPEG to $folder_path"
fi
