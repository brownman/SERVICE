use dialog_sleep 
update_temp 'preview LPI2.PDF' 'evince ~/Desktop/*.pdf'
sleep 10
cmd='wine $HOME/wine/drive_c/certExam342/manager.exe'
( wmctrl -a certExam & dialog_sleep 60 certExam ) || ( commander $cmd )
#( thunar ~/Downloads/VCE )
