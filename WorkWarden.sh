#!/bin/bash

# Función para verificar las credenciales del usuario
check_credentials() {
    local username="$1"
    local password="$2"

    # Ejecutar consulta SQL para verificar las credenciales y obtener los privilegios
    result=$(mysql -u root -D WorkWarden -se "SELECT COUNT(*), privilegiado FROM usuarios WHERE usuario='$username' AND contraseña='$password' GROUP BY privilegiado")

    # Extraer el conteo de resultados y el estado de privilegio
    read count is_privileged <<<"$result"

    # Verificar el resultado de la consulta
    if [ "$count" -eq 1 ]; then
        echo "¡Inicio de sesión exitoso!"
        if [ "$is_privileged" -eq 1 ]; then
            while true; do
		
		cat titulo
                menu
                read -p "[-] - " opcion
                case $opcion in
                    1)
                        echo "listando hosts"
                        direcciones_ip=$(nmap -sn 10.10.10.0/24 | grep -oP '\d+\.\d+\.\d+\.\d+')
                        echo "$direcciones_ip"
                        ;;
                    2)
                        while true; do
                            privileged_scripts
			    read -p "Introduce la IP del host: " dir
			    read -p "[-] - " script
                            case $script in
                                1)
	      			    echo "Apagando equipo"
                                    sshpass -p "usuario" scp "./scripts/linux/apagar.sh" usuario@10.10.10.4:~/
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "echo 'usuario' | sudo -S bash ~/apagar.sh"
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "rm ~/apagar.sh"
                                    echo "equipo $ip apagado"				
                                    ;;
                                2)
                                    echo "Reiniciando equipo"
                                    sshpass -p "usuario" scp "./scripts/linux/reiniciar.sh" usuario@10.10.10.4:~/
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "echo 'usuario' | sudo -S bash ~/reiniciar.sh"
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "rm ~/reiniciar.sh"
                                    echo "equipo $ip reiniciado"
				    ;;
                                3)
                                    echo "Sacando captura de pantalla"
                                    sshpass -p "usuario" scp "./scripts/linux/captura_pantalla.sh" usuario@10.10.10.4:~/
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "echo 'usuario' | sudo -S bash ~/captura_pantalla.sh"
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "rm ~/captura_pantalla.sh"
                                    ;;
                                4)
                                    echo "Mostrando información de los escritorios"
                                   ./scripts/linux/config.sh
                                    sshpass -p "usuario" scp "./scripts/linux/config.sh" usuario@10.10.10.4:~/
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "echo 'usuario' | sudo -S bash ~/config.sh"
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "rm ~/config.sh"
				    echo "Información de escritorios mostrada para $ip"
                                    ;;
                                5)
    				    echo "Mostrando estado de los discos"
                                    sshpass -p "usuario" scp "./scripts/linux/disco.sh" usuario@10.10.10.4:~/
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "echo 'usuario' | sudo -S bash ~/disco.sh"
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "rm ~/disco.sh"
                                    echo "Estado de los discos de $ip mostrado"

                                    ;;
                                6)
                                    echo "Mostrando información del sistema"
				    sshpass -p "usuario" scp "./scripts/linux/informacion_sistema.sh" usuario@10.10.10.4:~/
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "echo 'usuario' | sudo -S bash ~/informacion_sistema.sh"
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "rm ~/informacion_sistema.sh"
				    echo "Información de $ip mostrada"
                                    ;;
                                7)
                                    echo "Mostrando información de red"
                                    ./scripts/linux/ip.sh
                                    sshpass -p "usuario" scp "./scripts/linux/ip.sh" usuario@10.10.10.4:~/
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "echo 'usuario' | sudo -S bash ~/ip.sh"
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "rm ~/ip.sh"
				    echo "Información de red mostrada para $ip"
                                    ;;
                                8)
                                    echo "Volviendo..."
                                    break
                                    ;;
                                *)
                                    echo "ERROR. Opción inválida 2"
                                    ;;
                            esac
                        done
                        ;;
		    3)
			    exit 0
		    ;;
		   
                    *)
                        echo "ERROR. Opción inválida 1"
                        ;;
                esac
            done
        else
	    while true; do
	   
	    cat titulo
	    menu
                read -p "[-] - " opcion
                case $opcion in
                    1)
                        echo "listando hosts"
                        direcciones_ip=$(nmap -sn 10.10.10.0/24 | grep -oP '\d+\.\d+\.\d+\.\d+')
                        echo "$direcciones_ip"
			;;
                    2)
                        while true; do
                            regular_scripts
			    read -p "Introduce la IP del host: " dir
                            read -p "[-] - " regular_script 
                            case $regular_script in
                                1)
				    
                                    echo "Apagando equipo"
                                    sshpass -p "usuario" scp "./scripts/linux/apagar.sh" usuario@10.10.10.4:~/
				    sshpass -p "usuario" ssh usuario@10.10.10.4 "echo 'usuario' | sudo -S bash ~/apagar.sh"
				    sshpass -p "usuario" ssh usuario@10.10.10.4 "rm ~/apagar.sh"
				    echo "equipo $ip apagado"
                                    ;;
                                2)
                                    echo "Reiniciando equipo"
				    sshpass -p "usuario" scp "./scripts/linux/reiniciar.sh" usuario@10.10.10.4:~/
				    sshpass -p "usuario" ssh usuario@10.10.10.4 "echo 'usuario' | sudo -S bash ~/reiniciar.sh"
				    sshpass -p "usuario" ssh usuario@10.10.10.4 "rm ~/reiniciar.sh"
				    echo "equipo $ip reiniciado"
                                    ;;
                                3)
                             	    echo "Mostrando estado de los discos"
                                    sshpass -p "usuario" scp "./scripts/linux/disco.sh" usuario@10.10.10.4:~/
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "echo 'usuario' | sudo -S bash ~/disco.sh"
                                    sshpass -p "usuario" ssh usuario@10.10.10.4 "rm ~/disco.sh"
				    echo "Estado de los discos mostrado"
                                    ;;
                                4)
                                    echo "Volviendo..."
                                    break
                                    ;;
                                *)
	                            echo "ERROR. Opción inválida 2"
                                    ;;
                            esac
		    done
                        ;;
		    3)
			    exit 0
		    ;;

                    *)
                        echo "ERROR. Opción inválida 1"
                        ;;
                esac
            done
        
        fi
        exit 0
    else
        echo "Credenciales incorrectas."
        return 1
    fi
}

# Función para el menú principal
menu() {
    echo -e "[+] - ¿Qué desea hacer?\n"
    echo "[1] - Listar dispositivos"
    echo "[2] - Ejecutar un script en un host"
    echo "[3] - Salir"
}

# Función para el menú de usuario privilegiado
privileged_scripts() {
    echo "Menú de Usuario Privilegiado"
    echo "[1] - Apagar equipo"
    echo "[2] - Reiniciar equipo"
    echo "[3] - Capturar de pantalla"
    echo "[4] - Mostrar Información de escritorios"
    echo "[5] - Mostrar estado de los discos"
    echo "[6] - Mostrar información del sistema"
    echo "[7] - Mostrar información de red"
    echo "[8] - Volver"
}

# Función para el menú de usuario regular
regular_scripts() {
    echo "Menú de Usuario Regular"
    echo "[1] - Apagar equipo"
    echo "[2] - Reiniciar equipo"
    echo "[3] - Mostrar estado de los discos"
    echo "[4] - Volver"
}

# Inicio del programa
if [ "$(id -u)" -ne 0 ]; then
    echo "ERROR. El programa debe ejecutarse como sudo."
    exit 1
fi

echo "Bienvenido al sistema de gestión WorkWarden"
# Pedir nombre de usuario
read -p "Usuario: " username

# Pedir contraseña
read -s -p "Contraseña: " password
echo

# Verificar las credenciales ingresadas
check_credentials "$username" "$password" || {
    # Primer intento fallido, limpiar y pedir de nuevo
    clear
    read -s -p "Contraseña incorrecta. Intento 1. Introduzca la contraseña nuevamente: " password
    echo
    check_credentials "$username" "$password" || {
        # Segundo intento fallido, limpiar y pedir de nuevo
        clear
        read -s -p "Contraseña incorrecta. Intento 2. Introduzca la contraseña nuevamente: " password
        echo
        check_credentials "$username" "$password" || {
            # Tercer intento fallido
	    clear
            echo "Intentos agotados. Adiós."
            exit 1
        }
    }
}

