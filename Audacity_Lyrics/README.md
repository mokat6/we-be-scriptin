# Edit, new info
Or just use .ogg, it is more modern, better quality, smaller file sizes, open source format.  
Metadata in .ogg - in Vorbis Comments (simple key=value pairs)  
Metadata in .mp3 - ID3v1/ID3v2 (USLT, TXXX, etc.)	

Audacity - better at using the tag, but still no \n line breaks, and so needs script fixing

For .ogg in Audacity metadata window add Field "LYRICS" (works with small case, but should be ALL CAPS)
Sometimes the tag can be UNSYNCED LYRICS, so that more compatible with mp3 ID3 tags. 

mp3 better for compatibility... ??? whatever that means, really?

work with ogg on Linux
 ```shell
sudo apt install vorbis-tools
 vorbiscomment -l mySong.ogg
vorbiscomment -w -t "LYRICS=These are the song lyrics." mySong.ogg
```
(mp3 patents expired in 2017 so no problems there anymore)  





# Flow

In Audacity, when exporting, name with suffix  "_" E.g. `_fly away.mp3`  
Metadata, add field named "Lyrics" and add lyrics there.  
For line breaks use `\n`  
The script does:
- Removes the _ suffix (marks the file as fixed)
- Fixes line breaks, from \n to actual new line
- Changes ID3 tag. Removes TXXX, adds USLT

Keep the _lyrics_fix.sh in the same folder where you save mp3s. Run it when you want to fix mp3 files. It opearates on all files with suffix `_` in this dir, and subfolders recursively.


# Lore
Mp3 files have ID3 tags (metadata containers). These are predetermined.  
Each ID3 tag has an ID and label. 


| ID3 Tag  | Label                                |
|----------|--------------------------------------|
|   TPE1   | Artist                               |
|   TIT2   | Title                                |
|   TALB   | Album                                |
|   TYER   | Year                                 |
|   TRCK   | Track number                         |
|   APIC   | Attached picture (cover art)         |
|          |                                      |
|   USLT   | Unsynchronized lyrics                |
|   SYLT   | Synchronized lyrics <br /> (but rarely used, not .lrc format, some weird shit) |

USLT Unsynchronized lyrics - is what you want for lyrics!!


Audacity has TPE1(Artist), and TIT2(Title), etc  
but my custom "Lyrics" isn't saved in USLT, it is saved in TXXX(UserTextFrame: [Description: Lyrics])  
It's like Audacity hack. It doesn't really work with USLT. So just uses this whatever other container and Description - whatever you say.  
some players catch it, because "lyrics" is in the name there....  
but they first check USLT, the standard lyrics metadata container.
<br /><br /><br />


Everything, the tags, are ID3v2, (ID3v1 is not used anymore, deprecated, not even a thing)


CLI tool
```shell
pip install eyeD3
```

view ID3 tags
```shell
eyeD3 --verbose KanyeWest.mp3 # adds ID3 tag ID names
eyeD3 KanyeWest.mp3
```





# Players
## Foobar2000
setup:  
install extension OpenLyrics fork, with lyrics navigation
https://github.com/mokat6/foo_openlyrics_w_lyrics_navigation 

View > OpenLyrics Panel > Right click, Preferences >  
  - Display, increase Font 20pt
  - Saving, save to tag -> saves to USLT  
  - Search sources > Local Files > Storage dir: Same dir as the track (then it can find .lrc in dir)


