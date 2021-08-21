#!/bin/bash
if [ "$1" == "" ] && [ "$2" == "" ];
    then
        echo "Este Script descarga todos los archivos con la extensión seleccionada barriendo la internet superficial"
        echo "Uso ./lynxMetadataAnalizer.sh dominio.com extension (sin el punto, ejemplo: pdf)"
    else
        mkdir archivos
        cd archivos
        lynx -dump "https://google.com/search?&q=site:$1+ext:$2" | grep "://$1" | cut -d "=" -f2 | cut -d "&" -f1 > urlsArchivos.txt
        echo "####Por favor espere, estamos descargando y analizando los archivos####"
        for archivoInternet in $(cat urlsArchivos.txt);
            do 
                wget -q $archivoInternet
            done
        rm -r urlsArchivos.txt
        exiftool *
        cd ..
        rm -r archivos
        echo "####Análisis Completado####"
fi