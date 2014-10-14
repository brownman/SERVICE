use pipe_translate
#commander pipe_translate_motivation
file_motivation=$dir_workspace/motivation.txt

hotkey_overide 'update motivation.txt' "gvim $file_motivation"
commander sleep 4
assert file_exist $file_motivation

commander pipe_translate_random_line $file_motivation
#random dog
