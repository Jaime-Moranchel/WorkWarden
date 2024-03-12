#!/bin/bash

# Obtener la lista de dispositivos de disco
discos=$(lsblk -o NAME,TYPE | grep 'disk' | awk '{print $1}')
archivo="/informes/discos_info_$(date +"%Y%m%d-%H%M%S").txt"
# Iterar sobre cada disco y mostrar su estado
{
	for disco in $discos; do
		echo "Estado del disco $disco:"
		smartctl -H /dev/$disco
		echo "---------------------------------"
	done
} > $archivo
