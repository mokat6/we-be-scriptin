#!/bin/bash

# Audio to Canto installation script

mkdir -p ~/.apps/Audio_to_canto_text


cp canto ~/.apps/Audio_to_canto_text/
cp _2convert.py ~/.apps/Audio_to_canto_text/
cp _trasim.js ~/.apps/Audio_to_canto_text/


chmod +x ~/.apps/Audio_to_canto_text/canto

# Ensure ~/.local/bin exists
mkdir -p ~/.local/bin

# Create symlink (remove old one if it exists)
ln -sf ~/.apps/Audio_to_canto_text/canto ~/.local/bin/canto


echo "Installing in ~/.apps/Audio_to_canto_text/"
echo "✅ Installed successfully. You can now run it using: canto <filename.mp3>"
