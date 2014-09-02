no(){
      wmctrl -a 'optional!'
      xdotool key Esc
}

yes(){
      wmctrl -a 'optional!'
      xdotool key space
}

robot(){
  local str=$1
  xcowsay "$str" &
  case $str  in
    yes|da)
      yes
      ;;
    nonono)
      no
      ;;
    well|robot)
      flite -t 'yes master'
      ;;
    **)
      xcowsay "Robot: no handler for: $str"
      ;;
  esac

}





robot $1 
