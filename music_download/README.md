# todo
add tags  
- first heard year
- notes

# About

Tool for downloading mp3 from youtube and adding tags.

1. Use the html form to generate a bash command.
2. Paste it into the terminal

Usage

```bash
getmp3 --url "https://www.youtube.com/watch?v=yY9IXaZ9ius" --artist "Cheap Trick" --title "I Want You To Want Me" --year "1977" --genre "Game" --output-dir "/mnt/c/Users/SweetPotato/Music/Game"
```

# install

Dependencies:

1. yt-dlp (the downloader)
2. ffmpeg (for metadata tags)

```bash
sudo apt install yt-dlp ffmpeg
chmod +x getmp3
cp getmp3 ~/.local/bin/getmp3
```

---

use ffmpeg for metadata. It works with all file formats - mp3, m4a, WebM, flac, opus,...  
For `.opus` only works when setting first time and re-containerizing from webm into opus.  
Different formats store tags differently. But ffmpeg auto handles it.

When you do `ffmpeg .... -c copy`, you can’t overwrite the file in-place. You need to write to a new file and then delete the OG.

# Inspect audio tags of a file

ffprobe comes together with ffmpeg

```bash
ffprobe -hide_banner -show_format -show_streams "Sebastian Svahn - The Firewalker.webm"
```
