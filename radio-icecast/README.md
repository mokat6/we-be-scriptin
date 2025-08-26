
```bash
mkdir -p ~/radio-server/icecast-logs
```

```bash
drwxrwxrwx. 2 ec2-user ec2-user   41 Aug 24 12:44 icecast-logs
chmod 777 ~/radio-server/icecast-logs
```


Create `~/radio-server/icecast.xml`

```bash
docker run -d \
  --name radio-proxy \
  -p 8000:8000 \
  -v $(pwd)/icecast.xml:/etc/icecast2/icecast.xml \
  -v $(pwd)/icecast-logs:/usr/local/icecast/logs \
  moul/icecast
```

Play in VLC  
http://ec2-54-145-127-120.compute-1.amazonaws.com:8000/ziplol  
http://ec2-54-145-127-120.compute-1.amazonaws.com:8000/wbls  
http://ec2-54-145-127-120.compute-1.amazonaws.com:8000/98rock  



Radio sources:

Need VPS  
Audacy network, iHeartRadio network








```
98 Rock - 97.9 baltimore
https://www.98online.com/
stream URL:
http://19813.live.streamtheworld.com/WIYYFMAAC.aac
US ip only. 
```

```
WBLS
New York - 107.5
https://www.wbls.com/listen-live/
http://18093.live.streamtheworld.com/WBLSFMAAC.aac
US ip only. 
```

```
q99.7 Atlanta
https://player.q997atlanta.com/
webpage US IP. Stream works...
http://19813.live.streamtheworld.com/WWWQFMAAC.aac
```
