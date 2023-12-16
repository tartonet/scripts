#!/bin/bash
# Comentar si no es vol la sortida de la ip pública.
echo -e "wan \t --> $(curl --no-progress-meter https://ifconfig.me 2>/dev/null)"
# Imprimeix la ip dels adaptadors de xarxa.
for i in /sys/class/net/*; do
  Interface=$(echo $i | cut -d '/' -f 5)
  echo -e "$Interface \t --> $(ip addr show $Interface 2>/dev/null | grep -w "inet" | awk '{print $2}'| cut -d '/' -f 1)"
done
