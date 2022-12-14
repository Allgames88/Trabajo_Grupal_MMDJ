#!/bin/bash
#variable de la fecha
date=`date +%d-%m-%y`
echo $date
#comando para exportar base de datos de mysql
sudo mysqldump -u root WebVenta_MaMiDaJu > sec.sql
#comprimimos con tar
tar -cvzf sec_$date.sql.tar.gz sec.sql
#cambia el fichero en esta linea para decidir que fichero cifrar
gpg -e -r usuario sec_$date.sql.tar.gz

cp sec_$date.sql.tar.gz /etc/secCopy/sec_$date.sql.tar.gz
exit
