#!/bin/bash

#variable de la fecha
date=`date +%d-%m-%y`

#comando para exportar base de datos de mysql
mysqldump -u usuario -p tienda > export_$date.sql

#cambia el fichero en esta linea para decidir que fichero cifrar
gpg -c fichero1_$date.txt

exit
