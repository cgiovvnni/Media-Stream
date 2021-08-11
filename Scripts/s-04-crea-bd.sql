--@Autor: Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
--@Fecha creación: 01/02/2021
--@Descripción: Proyecto Final - Creación de la BD

Prompt Conectando como sys
connect sys/hola1234* as sysdba 

startup mount

Prompt Creacion de la Base de Datos 
create database loproyma
  user sys identified by system2
  user system identified by system2
  logfile group 1 (
    '/disk1/app/oracle/oradata/LOPROYMA/redo01a.log',
    '/disk2/app/oracle/oradata/LOPROYMA/redo01b.log',
    '/disk3/app/oracle/oradata/LOPROYMA/redo01c.log') size 50m blocksize 512,
  group 2 (
    '/disk1/app/oracle/oradata/LOPROYMA/redo02a.log',
    '/disk2/app/oracle/oradata/LOPROYMA/redo02b.log',
    '/disk3/app/oracle/oradata/LOPROYMA/redo02c.log') size 50m blocksize 512,
  group 3 (
    '/disk1/app/oracle/oradata/LOPROYMA/redo03a.log',
    '/disk2/app/oracle/oradata/LOPROYMA/redo03b.log',
    '/disk3/app/oracle/oradata/LOPROYMA/redo03c.log') size 50m blocksize 512
  maxloghistory 1
  maxlogfiles 16
  maxlogmembers 3
  maxdatafiles 1024
  character set AL32UTF8
  national character set AL16UTF16
  extent management local
  datafile '/disk4/app/oracle/oradata/LOPROYMA/system01.dbf'
    size 700m reuse autoextend on next 10240k maxsize unlimited
  sysaux datafile '/disk4/app/oracle/oradata/LOPROYMA/sysaux01.dbf'
    size 550m reuse autoextend on next 10240k maxsize unlimited
  default tablespace users
    datafile '/disk4/app/oracle/oradata/LOPROYMA/users01.dbf'
    size 500m reuse autoextend on maxsize unlimited
  default temporary tablespace tempts1
    tempfile '/disk4/app/oracle/oradata/LOPROYMA/temp01.dbf'
    size 200m reuse autoextend on next 640k maxsize unlimited
  undo tablespace undotbs1
    datafile '/disk4/app/oracle/oradata/LOPROYMA/undotbs01.dbf'
    size 200m reuse autoextend on next 5120k maxsize unlimited;

Prompt Homologamos passwords 
alter user sys identified by system2;
alter user system identified by system2;
