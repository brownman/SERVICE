dir=$1
pidof grive || ( cd $dir; grive )
