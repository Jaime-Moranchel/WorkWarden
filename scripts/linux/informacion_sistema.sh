#!/bin/bash

archivo="/informes/systeminfo_$(date +"%Y%m%d-%H%M%S").txt"
{
# Obtener información de la versión del sistema operativo
OSVersion=$(lsb_release -a 2>/dev/null || uname -a 2>/dev/null)
echo "$OSVersion"
} > $archivo
