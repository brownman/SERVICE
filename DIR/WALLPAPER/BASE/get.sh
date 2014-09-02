#wget https://raw.githubusercontent.com/graysky2/configs/5fbe513918dfe8066f87e670108318464902afae/dotfiles/.conkyrc

file_target=~/.lua/scripts/clock_rings.lua
cat1  $file_target
touch1 $file_target

cp clock_rings.lua  $file_target


