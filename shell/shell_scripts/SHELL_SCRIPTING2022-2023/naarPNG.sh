#!/bin/bash

source_dir="$1"  # Het pad naar de map met de JPEG-bestanden

# Controleer of het bronpad een geldige map is
if [ ! -d "$source_dir" ]; then
    echo "No valid path to JPEG-files: $source_dir"
    exit 1
fi

# Converteer ieder JPEG-bestand naar PNG met een maximale grootte van 128x128 pixels
find "$source_dir" -type f -iname "*.jpeg" -exec convert "{}" -resize 128x128 "{}.png" \;

# find - zoeken in driectories en files
# -type f - zoeken naar files en niet directories
# -iname "*.jpg" - case-insensitive search naar alle .jpg file
# -exec - execute een command over elk bestand dat aan de vorige criteria voldoet
# "{}" -resize 128x128 "{}.png" - daadwerkelijke conversion {} zijn placeholders voor file names
# \; - eindigen van de find (zonder \ eindigt die de exec)

echo "All JPEG to PNG convertion complete."
