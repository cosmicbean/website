#!/bin/bash
# Remove spaces and '#' characters from all filenames in the current directory

shopt -s nullglob

rm ./*.jpg
cp ~/Pictures/Photo\ Booth\ Library/Pictures/*.jpg .

for file in *; do
  # Skip if it's not a regular file
  [[ -f "$file" ]] || continue

  # Create a new name by removing spaces and '#'
  newname="${file// /}"     # remove spaces
  newname="${newname//#/}"  # remove '#'

  # Rename only if the name actually changes
  if [[ "$file" != "$newname" ]]; then
    echo "Renaming: '$file' -> '$newname'"
    mv -- "$file" "$newname"
  fi

done

rm x.txt
# List all files, put in a new file
ls -a . >> x.txt

python3 uh.py
