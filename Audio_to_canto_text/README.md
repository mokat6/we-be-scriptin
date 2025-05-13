# What it does

Transcribes mp3. Audio to text in .srt and .lrc formats.  
Preconfigured for Cantonese with simplified characters.  
Use the lrc file in Foobar2000 with openLyrics-w-lyric-navigation extension


# Environment
- Linux
- Python3

## Dependencies
#### OpenAI Whisper Cli tool
```shell
pip install whisper
```

not sure I think ffmpeg needs to be installed, audio tool
```shell
sudo apt install ffmpeg
```
probably pytorch needs to be installed
```shell
pip install torch torchvision torchaudio
```


# install
just run the installer
```shell
./install.sh
```

it will be installed at  
~/.apps/Audio_to_canto_text/

with symlink at  
~/.local/bin

# usage
```shell
canto myAudio.mp3
```

output .srt and .lrc files  
