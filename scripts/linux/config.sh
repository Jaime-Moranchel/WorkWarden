#!/bin/bash

archivo="/informes/config_$(date +"%Y%m%d-%H%M%S").txt"
{
# Obtener información sobre los escritorios y ventanas
echo "Información de escritorios y ventanas:"
wmctrl -l
echo "--------------------------------------"
wmctrl -d
} > $archivo
