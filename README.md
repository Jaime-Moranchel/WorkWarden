# WorkWarden

WorkWarden es una herramienta de gestión de sistemas que permite a los usuarios realizar diversas acciones en hosts remotos. Requiere la autenticación del usuario mediante un nombre de usuario y una contraseña para acceder a las funciones del sistema.

## Cómo funciona
[Diagrama de flujo](https://drive.google.com/file/d/1yxFhWzZaQbsKzFqkFpxiNEydIqa65j_W/view)

## Uso
Para utilizar WorkWarden, asegúrese de que dispone de los privilegios necesarios para ejecutar el programa como sudo. Ejecute el script utilizando el siguiente comando:
~~~
sudo bash WorkWarden.sh
~~~
o
~~~
sudo ./WorkWarden.sh
~~~
Se le pedirá que introduzca su nombre de usuario y contraseña. Una vez autenticado, aparecerá el menú principal.

## MENU PRINCIPAL
El menú principal ofrece las siguientes opciones:

1. Listar dispositivos
2. Ejecutar script en host
3. Salir de

### 1. Listar dispositivos
Esta opción lista todos los dispositivos disponibles en la red. Utiliza el comando `nmap` para escanear la red y recuperar las direcciones IP de los dispositivos.

### 2. Ejecutar script en host
Esta opción le permite ejecutar scripts específicos en un host remoto. Se le pedirá que introduzca la dirección IP del host y que seleccione un script para ejecutar.

**Scripts de usuario con privilegios**
1. Apagar el host
2. Reiniciar Host
3. Capturar pantalla
4. Mostrar información del escritorio
5. Mostrar estado del disco
6. Mostrar información del sistema
7. Mostrar información de red
8. Volver atrás

**Scripts de usuario regular**
Si su cuenta tiene acceso normal, dispone de las siguientes opciones de script:
1. Apagar el host
2. Reiniciar Host
3. Mostrar estado del disco
4. Volver atrás

### 3. Salir de
Esta opción le permite salir del sistema WorkWarden.
## NOTA
Asegúrese de que los scripts necesarios (`como apagar.sh` y `reiniciar.sh`) están presentes en el directorio adecuado antes de ejecutarlos en un host remoto (`./scrips/linux/`). Los scripts se copian en el host remoto a través de SSH (comando `scp`) y se ejecutan con privilegios de administrador (comando `sudo`).

## AUTENTICACIÓN
La función `check_credentials` es responsable de verificar las credenciales del usuario. Consulta la base de datos MySQL para comprobar si el nombre de usuario y la contraseña coinciden. Si las credenciales son correctas, el usuario obtiene acceso al sistema.

Si las credenciales son incorrectas, se pide al usuario que introduzca de nuevo la contraseña. La función permite hasta tres intentos antes de terminar el programa.

Asegúrese de que la base de datos MySQL está correctamente configurada y accesible antes de utilizar WorkWarden.

## Dependencias 📋
WorkWarden depende de comandos como mysql y nmap. Asegúrese de que estas dependencias están instaladas y accesibles en su sistema para utilizar WorkWarden correctamente.
~~~
sudo apt-get install mysql-server nmap wmic openssh-server scrot smartmontools -y
~~~
## ⚠️ NOTA
También hay que instalar las dependencias en los clientes remotos a excepción de `mysql-server`
## Construido con 🛠️
- Bash
- Powershell

## Conclusión
WorkWarden proporciona una interfaz fácil de usar para gestionar y realizar acciones en hosts remotos. Con la autenticación y ejecución de scripts adecuadas, los usuarios pueden realizar diversas tareas de forma remota sin intervención manual.

## Autor 🖋
- Jaime Moranchel - [Perfil](https://github.com/Jaime-Moranchel)	


