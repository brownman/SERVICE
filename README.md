SERVICE
===
- create your scripts and code under SERVICE/

CRONTAB
==
- crontab editing is.. terrible
  
#####  SO...
- service.sh make itself available for crontab by symlink itself to /tmp/service.sh
- use crontab for trigger /tmp/service.sh



##### Example:
```bash
* * * * * /tmp/service.sh wallpaper #will trigger SERVICE/STEPPER/wallpaper.sh 
```
