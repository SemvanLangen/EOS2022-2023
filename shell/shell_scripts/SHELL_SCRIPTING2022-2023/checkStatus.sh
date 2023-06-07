#!/bin/bash

# Argumenten controleren
if [ "$#" -ne 3 ]; then
    echo "Wrong input, please use: checkStatus <map> <commando> <logfile>"
    exit 1
fi

map="$1"        # Pad naar de map met bestanden
commando="$2"   # Het uit te voeren commando
logfile="$3"    # Pad naar het logbestand

# Logbestand aanmaken (overschrijven indien al aanwezig)
> "$logfile"

# Itereer over bestanden in de map
for file in "$map"/*; do
    # Controleren of het een bestand is
    if [ -f "$file" ]; then
        # Uitvoeren van het commando op het bestand
        $commando "$file"

        # Exit-status controleren
        if [ $? -eq 0 ]; then
            echo "Succes: $file" >> "$logfile"
        else
            echo "Fout: $file" >> "$logfile"
        fi
    fi
done

echo "CheckStatus succesfull."
