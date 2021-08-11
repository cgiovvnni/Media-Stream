#!/bin/bash 

# @Autor  Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
# @Fecha 17/10/2020
# @Descripcion Proyecto Final - Creación de directorios

#Creamos directorios para la creación de la BD
mkdir -p /disk1/app/oracle/oradata/LOPROYMA
mkdir -p /disk2/app/oracle/oradata/LOPROYMA
mkdir -p /disk3/app/oracle/oradata/LOPROYMA
mkdir -p /disk4/app/oracle/oradata/LOPROYMA
mkdir -p /diskFRA/arch

#Cambiar usuario y grupo de los directorios 
chown -R oracle:oinstall /disk1
chown -R oracle:oinstall /disk2
chown -R oracle:oinstall /disk3
chown -R oracle:oinstall /disk4
chown -R oracle:oinstall /diskFRA
chown -R oracle:oinstall /diskFRA/arch

#Cambiamos permisos 
chmod -R 754 /disk1
chmod -R 754 /disk2
chmod -R 754 /disk3
chmod -R 754 /disk4
chmod -R 754 /diskFRA
chmod -R 754 /diskFRA/arch

#Configuracion del Tablespace Encriptado 
#Creacion del wallet 
mkdir -p /u01/app/oracle/product/18.0.0/dbhome_1/wallets

# Editamos el fichero sqlnet.ora
nano $ORACLE_HOME/network/admin/sqlnet.ora

#Configuracion de autologin al reiniciar la base
orapki wallet create -wallet /u01/app/oracle/product/18.0.0/dbhome_1/wallets -auto_login -pwd oracle_4U

#disk1, disk2 y disk3 - Multiplexado
#disk4 - Datafiles  
#diskFRA - FRA 