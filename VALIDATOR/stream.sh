set -u
yt(){
  
  local video="$1"
commander "mplayer -fs -quiet $(youtube-dl -g $video)"
}
yt "$1"
