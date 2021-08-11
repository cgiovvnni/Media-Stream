--@Autor: Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
--@Fecha creación: 01/02/2021
--@Descripción: Proyecto Final - Creación de spfile

Prompt Conectando como sys
connect sys/hola1234* as sysdba 

startup nomount 

create spfile from pfile;

!ls $ORACLE_HOME/dbs/spfileloproyma.ora