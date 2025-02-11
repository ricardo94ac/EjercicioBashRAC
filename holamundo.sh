echo "Tu pc está siendo escaneado por un virus,pinche aquí para pararlo"
sudo apt install nmap #le obligamos a instalar nmap para descubrir que puertos tiene vulnerable
nmap -p 1-5000 127.0.0.1 -oN resultado_nmap.txt #le escaneamos los puertos del 1 al 5000
#le añadimos el archivo de texto donde mandara los resultados