![c4tl0ck3r](catlocker.png)

# CatLocker
CatLocker es un ransomware programado en C# con .NET 4 con todas las funciones básicas típicas de los ransomwares (como CryptoLocker)

## Funcionamiento
CatLocker se divide en tres aplicaciones, el ransomware como tal (c4tl0ck3r), el programa que desencripta los ficheros y la aplicación web (php) que gestiona las claves RSA

### C4tl0ck3r
Este gatito peligroso lo que fundamentalmente hace al ejecutarse es pedir al servidor web una clave pública RSA2048 y después crear un mutex e inicia el recorrido de la carpeta inicial indicada en la compilación para encriptar los ficheros (generando un hilo por cada uno para maximizar la velocidad).

Esta encriptación la hace usando AES256 en modo CBC generando por cada fichero una clave aleatoria que encripta con la RSA pública y la guarda en el registro del sistema para que cuando se disponga con la clave privada se puedan desencriptar los ficheros de forma fácil.

Además para dar velocidad al proceso, aparte de gestionarlo con hilos, el minino solo encripta las 100 primeras megas del fichero ya que con eso es suficiente para dañar los que tienen una estructura no secuencial (estoy estudiando otros métodos como solo encriptar los bytes pares o solo los que cumplan una función).

Todo este proceso se hace mediante un FileStream sobre el fichero por lo que sobrescribimos el fichero evitando así una posible recuperación de datos (el MemoryStream es muchísimo mas rápido pero no me da esta ventaja).

### DesEncriptador
En esencia es el proceso contrario, este te pide la clave privada (recibida por el medio que se vea conveniente) y a continuación empieza a recorrer la lista de ficheros encriptados almacenada en el registro del sistema, de esta lista saca la contraseña cifrada que desencripta con la RSA privada y con esa clave ya puede hacer el AES sin problema.

### Aplicación Web
Esta es la parte más libre y variable, en mi caso por lo dicho la he hecho extremadamente simple, únicamente es un .php que genera claves RSA, guarda las privadas con una id en una carpeta y devuelve la publica indicando la id.

Esta parte lo normal es que se empaquete el ransomware con un cliente Tor de tal manera que la conexión no sea rastreable y la petición de clave se haga de formas más complejas como directamente una aplicación servidor que no solo da claves sino que reciba información de las víctimas de cualquier tipo.

## Desarrollo
El principal motivo de hacer esta aplicación fue para poner a prueba la facilidad con la que se pueden hacer los ransomware típicos y el peligro que son.

El motivo de publicarlo es que por mucho que se hable de estos "virus", y lo digo así ya que en si son meras aplicaciones que perfectamente podrían ser útiles (seguridad, privacidad, etc..), no se deja tan claro como funcionan y precisamente por haberse puesto de moda los ataques de ransomware se tendrían que conocer mejor ya que la seguridad por ocultación no es muy util y lo digo porque todo el desarrollo lo he hecho en un equipo Windows "blindando" contra ransomware y en ningún momento ningún antivirus me ha dicho nada cada vez que me cepillaba varios terabytes de datos haciendo pruebas y esto es porque al final son antivirus por firma y no hay ninguno contra ransomwares que use métodos heurísticos.

## Licencia
Se puede hacer lo que se quiera con este código, su finalidad es puramente educativa y reivindicativa.

**Alberto Robles Enciso** - [Web](https://alb1183.es)

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details