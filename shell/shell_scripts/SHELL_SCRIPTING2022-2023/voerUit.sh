#!/bin/bash

argument="$1"
extension="${argument#*.}"

case "$extension" in
	"py")
		python3 "$argument"
		echo "Python File"
		;;
	"sh")
		bash "$argument"
		echo "Bash File"
		;;
	"cc")
		cat "$extension"
		echo "Cat a file"
		;;
	*)
		echo "Not a valid extension"
		;;
esac
