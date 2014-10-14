run(){
lang=IT
url='http://www.goethe-verlag.com/book2/EM/EMIT/EMIT002.HTM'
#open_with 'http://www.goethe-verlag.com/book2/EM/EMIT/EMIT068.HTM'
open_with $url
dir=$dir_workspace/essay/
commander "ensure mkdir $dir"
gvim -f $dir/essay_${lang}.txt
}
run
