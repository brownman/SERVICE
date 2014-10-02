


ascii3 () 
{ 
      echo you are a genius | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n
    }



#echo genius | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f

#$(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n
ascii3

