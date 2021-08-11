--@Autor: Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
--@Fecha creación: 02/02/2021
--@Descripción: Proyecto Final - Modo Archivelog 

Prompt Conectando como sys
connect sys/system2 as sysdba 

--Creamos respaldo de spfile
create pfile from spfile;

shutdown immediate
startup

Prompt Conectando como sys
connect sys/system2 as sysdba 

Prompt Configurando parametros necesarios

alter system set log_archive_max_processes = 5 scope = spfile;
alter system set log_archive_format = 'arch_loproyma_%t_%s_%r.arc' scope=spfile;
alter system set log_archive_dest_1 = 'LOCATION=/use_bd_recovery_file_dest' scope = spfile;
alter system set log_archive_dest_2 = 'LOCATION=/diskFRA/arch' scope = spfile;
alter system set log_archive_min_succeed_dest = 1 scope = spfile;

shutdown immediate
startup mount

Prompt Activamos Modo Archivelog 
alter database archivelog;
alter database open;

Prompt Verificamos Modo Archivelog
archive log list 
