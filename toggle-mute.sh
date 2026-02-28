#!/bin/bash

# Alterna silencio
pactl set-sink-mute @DEFAULT_SINK@ toggle

# Espera un momento para que el cambio tenga efecto
sleep 0.1

# Detecta el estado actual de mute
IS_MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

# Elige mensaje e ícono según estado
if [ "$IS_MUTED" = "yes" ]; then
    notify-send -t 500 --icon=audio-volume-muted "System Muted"
else
    notify-send -t 500 --icon=audio-volume-high "System Unmuted"
fi

# Refresca i3status si es necesario
killall -SIGUSR1 i3status
