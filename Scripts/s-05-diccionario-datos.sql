--@Autor: Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
--@Fecha creación: 01/02/2021
--@Descripción: Proyecto Final - Creación de la BD

Prompt Ejecutando scripts de sys
connect sys/system2 as sysdba
 
@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
@?/rdbms/admin/utlrp.sql

Prompt Ejecutando scripts de system
connect system/system2

@?/sqlplus/admin/pupbld.sql
