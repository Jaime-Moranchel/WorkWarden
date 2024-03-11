#!/bin/bash

directorio_destino="$HOME/WorkWarden/capturas"
nombre_archivo="captura_$(date +"%Y-%m-%d_%H-%M-%S").png"
ruta="$directorio_destino/$nombre_archivo"

sudo scrot "$ruta"

