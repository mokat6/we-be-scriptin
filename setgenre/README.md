# About

changes metadata tag "genre" of all audio files in the current dir.
Use with my Navidrome setup. When changing folder structure.

# Dependencies

- opustags (for .opus)
- ffmpeg (for all other files)

https://github.com/fmang/opustags  
follow steps, build, and install. Very small app.  
Why? .opus files are very hard to change metadata. ffmpeg and other tools fail. Need this small niche app

# Install

```bash
# check dependencies
ffmpeg -version | head -n 1 ; opustags -h | head -n 1

chmod +x setgenre
cp setgenre ~/.local/bin/setgenre
```

# Usage

in the folder with many audio files

```bash
setgenre chill
```
