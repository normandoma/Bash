#!/bin/bash

read -p 'Are you copying to a cisco device? Yes or No. ' cisco
read -p 'IP of destination device: ' ipvar
read -p 'Enter the username of the destination device: ' uservar
read -p 'Enter full path of source file: ' srcvar

if [ $cisco = "yes" ]; then
  read -p "'Enter name of file at destination default will be' $srcvar: "  destvar
  scp $srcvar $uservar@$ipvar:$destvar
else 
  read -p 'Enter full path of destination location: ' destloc
  scp $srcvar $uservar@$ipvar:$destloc
fi


