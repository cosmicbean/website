#!/bin/bash
# Copy Photo Booth JPGs locally, sort newest→oldest, convert to numbered WEBP files.

set -euo pipefail
shopt -s nullglob

src_dir="$HOME/Pictures/Photo Booth Library/Pictures"

# 1) Copy JPGs here, preserving timestamps so sorting reflects original order
cp -p "$src_dir"/*.jpg . 2>/dev/null || true

# 2) Build reverse-chronological list of the copied JPGs (newest first)
#    Using macOS-safe 'ls -t'. IFS set to newline to handle spaces in filenames.
IFS=$'\n' files=( $(ls -tr1 -- *.jpg 2>/dev/null || true) )
unset IFS

# 3) Convert in that order to 0.webp, 1.webp, 2.webp, ... n.webp
count=0
for f in "${files[@]}"; do
  echo "Converting: $f -> ${count}.webp"
  cwebp "$f" -q 80 -o "${count}.webp" >/dev/null
  ((count++))
done

echo "Done. Created $((count-1)) WEBP files."

# Optional: if you want to remove the copied JPGs after conversion, uncomment:
rm -f -- *.jpg

python3 uh.py "$count"

git add ./*.webp
git add ../../blog/pov.html
git commit -m "added photos to pov.hmtl"
git push origin main

