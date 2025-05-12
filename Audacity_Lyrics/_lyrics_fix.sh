#!/bin/bash

## audacity saves to TXXX ID3 tag. This script 
# copies lyrics, converts \n to new lines, 
# removex TXXX tag
# embeds fixed lyrics into USLT (unsynced lyrics/text) tag
# renames file, by removing the _ suffix.

shopt -s globstar nullglob

# Collect all matching files
files=(**/_*.mp3)

# If no matching files, exit early
if [ ${#files[@]} -eq 0 ]; then
    echo "No files with leading underscore (_) found."
    exit 0
fi

for filepath in "${files[@]}"; do
    echo "Processing: $filepath"

    # Extract the lyrics text from the second line after the TXXX frame
    lyrics=$(eyeD3 "$filepath" --no-color | awk '/UserTextFrame: \[Description: Lyrics\]/{getline; print}')

    if [[ -z "$lyrics" ]]; then
        echo "  No TXXX:Lyrics content found. Skipping."
        continue
    fi

    # Fix the lyrics by converting \n to actual newlines
    fixed_lyrics=$(echo -e "$lyrics" | sed 's/\\n/\n/g')


    # Remove old USLT and TXXX frames
    eyeD3 --remove-lyrics "Lyrics:eng" "$filepath" > /dev/null 2>&1
    eyeD3 --remove-frame "TXXX" "$filepath" > /dev/null 2>&1

    # Embed the lyrics into USLT frame
    eyeD3 --add-lyrics=<(echo "$fixed_lyrics"):"Lyrics:eng" "$filepath" > /dev/null 2>&1

    # Rename the file to remove the leading underscore
    dir=$(dirname "$filepath")
    base=$(basename "$filepath")
    newname="${base#_}"
    newpath="$dir/$newname"
    mv "$filepath" "$newpath"
    echo "  Saved as: $newpath"
done
