switch_to_cert(){
local file='$HOME/.wine/drive_c/certExam342/manager.exe'
assert file_exist "$file"
wmctrl -a certExam || ( commander wine $file )
}

run(){
use dialog_sleep 
hotkey_override 'preview LPI2.PDF' 'evince ~/Desktop/LPIC1.pdf'
switch_to_cert &
dialog_sleep 60 certExam 
#( thunar ~/Downloads/VCE )
}
run
