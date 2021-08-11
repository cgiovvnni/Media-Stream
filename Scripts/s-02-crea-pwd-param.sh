#!/bin/bash 

# @Autor  Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
# @Fecha 17/10/2020
# @Descripcion Proyecto Final - Creación de archivo de passwords

#Establecemos la variable de entorno
export ORACLE_SID=loproyma  

#Creamos nuevo archivo de contraseñas
orapwd FILE='/u01/app/oracle/product/18.0.0/dbhome_1/dbs/orapwloproyma' FORCE=y FORMAT=12.2 SYS=password

#Creamos archivo de parametros 
touch $ORACLE_HOME/dbs/initloproyma.ora

#Editamos archivo de parametros
echo -e "db_name=loproyma 
control_files=(/disk1/app/oracle/oradata/LOPROYMA/control01.ctl, 
               /disk2/app/oracle/oradata/LOPROYMA/control02.ctl,
               /disk3/app/oracle/oradata/LOPROYMA/control03.ctl) 
memory_target=768M" >> $ORACLE_HOME/dbs/initloproyma.ora 
