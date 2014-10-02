use dialog_sleep 
update_temp 'preview LPI2.PDF' 'evince ~/Desktop/*.pdf'
sleep 10
( wmctrl -a certExam & dialog_sleep 60 certExam ) || ( thunar ~/Downloads/VCE )
