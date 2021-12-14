#!/bin/bash

CURRBRIGHT=$(brightnessctl -q | head -2 | tail +2 | cut -d ' ' -f4 | tr -d '()%')
if [ "$1" = "+" ] && [ $(echo "$CURRBRIGHT < 100" | bc) -eq 1 ] 
then
brightnessctl set $(echo "$CURRBRIGHT + 10" | bc)%
elif [ "$1" = "-" ] && [ $(echo "$CURRBRIGHT > 0" | bc) -eq 1 ] 
then
brightnessctl set $(echo "$CURRBRIGHT - 10" | bc)%
fi

echo $CURRBRIGHT
