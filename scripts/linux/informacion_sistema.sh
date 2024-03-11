#!/bin/bash

# Obtener información de la versión del sistema operativo
OSVersion=$(lsb_release -a 2>/dev/null || uname -a 2>/dev/null)

echo "$OSVersion"
