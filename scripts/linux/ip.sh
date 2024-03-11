#!/bin/bash

# Obtener direcciones IP de interfaces de red habilitadas
IPAddresses=$(ip -4 addr show up | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)

# Filtrar direcciones IP válidas
ValidIPs=""
for IPAddress in $IPAddresses; do
    if [[ $IPAddress =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        ValidIPs="$ValidIPs $IPAddress"
    fi
done

echo $ValidIPs
