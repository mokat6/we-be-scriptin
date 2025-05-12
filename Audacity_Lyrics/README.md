
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
extension OpenLyrics  
preferences, saving, save to tag -> saves to USLT  
make storage dir same as mp3 file. then finds .lrc in dir


