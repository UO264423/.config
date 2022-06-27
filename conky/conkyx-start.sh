#!/bin/bash

sleep 20 && conky -c ~/.config/conky/conky.conf
while true; do 
    wget -O /home/lukz/.config/conky/Oviedo_0tqp_lang=es.png wttr.in/Oviedo_0tqp_lang=es.png
    sleep 100                       # sleep and repeat
done


