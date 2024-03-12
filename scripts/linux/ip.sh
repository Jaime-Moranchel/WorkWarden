#!/bin/bash

archivo="/informes/ip_$(date +"%Y%m%d-%H%M%S").txt"
{
# Obtener direcciones IP de interfaces de red habilitadas
IPAddresses=$(ip -4 addr show up | awk '/inet / {print $2}' | cut -d'/' -f1)

# Filtrar direcciones IP válidas
ValidIPs=""
for IPAddress in $IPAddresses; do
    if [[ "$IPAddress" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        ValidIPs+=" $IPAddress"
    fi
done

# Mostrar direcciones IP válidas
if [ -n "$ValidIPs" ]; then
    echo "Direcciones IP válidas: $ValidIPs"
else
    echo "No se encontraron direcciones IP válidas."
fi
} > $archivo
