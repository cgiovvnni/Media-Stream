--@Autor: Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
--@Fecha creación: 02/02/2021
--@Descripción: Proyecto Final - Creacion de Tablespaces

Prompt Conectando como sysdba 
connect sys/system2 as sysdba 

Prompt Creamos Tablespace Administracion 
create tablespace administracion_plan_tbs 
  datafile '/disk4/app/oracle/oradata/LOPROYMA/administracion_plan_df.dbf' 
  size 256m
  autoextend on next 5m maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging;

Prompt Creamos Tablespace Pago 
--Creamos Wallet
alter system set encryption key identified by "wallet_password";

--Reiniciamos la BD para abrir el wallet
shutdown immediate 
startup mount 
alter system set encryption wallet open identified by "wallet_password";
alter database open;

create tablespace administracion_pago_tbs 
  datafile '/disk4/app/oracle/oradata/LOPROYMA/administracion_pago_df.dbf' 
  size 512m
  autoextend on next 20m maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging
  encryption using 'aes256' encrypt;  

Prompt creamos Tablespace Multimedia
create tablespace multimedia_tbs 
  datafile '/disk4/app/oracle/oradata/LOPROYMA/multimedia_df.dbf' 
  size 1024m
  autoextend on next 50m maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging;

Prompt Creamos Tablespace usuario 
create tablespace usuario_tbs 
  datafile '/disk4/app/oracle/oradata/LOPROYMA/usuario_df.dbf' 
  size 1024m
  autoextend on next 50m maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging;

Prompt Creamos Tablespace para BLOB 
create tablespace blob_tbs 
  datafile '/disk4/app/oracle/oradata/LOPROYMA/blob_df.dbf' 
  size 1024m
  autoextend on next 50m maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging;

Prompt Cremos Tablespace para índices

Prompt Indices de Modulo administracion_plan
create tablespace administracion_plan_ix_tbs 
  datafile '/disk4/app/oracle/oradata/LOPROYMA/administracion_plan_ix_df.dbf' 
  size 64m
  autoextend on next 1m maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging;

Prompt Indices de Modulo administracion_pago
create tablespace administracion_pago_ix_tbs 
  datafile '/disk4/app/oracle/oradata/LOPROYMA/administracion_pago_ix_df.dbf' 
  size 64m
  autoextend on next 1m maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging;

Prompt Indices de Modulo multimedia 
create tablespace multimedia_ix_tbs 
  datafile '/disk4/app/oracle/oradata/LOPROYMA/multimedia_ix_df.dbf' 
  size 64m
  autoextend on next 1m maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging;

Prompt Indices de Modulo usuario 
create tablespace usuario_ix_tbs 
  datafile '/disk4/app/oracle/oradata/LOPROYMA/usuario_ix_df.dbf' 
  size 64m
  autoextend on next 1m maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging;

Prompt Indices de columnas BLOB 
create tablespace blob_ix_tbs 
  datafile '/disk4/app/oracle/oradata/LOPROYMA/blob_ix_df.dbf' 
  size 64m
  autoextend on next 1m maxsize unlimited
  extent management local autoallocate
  segment space management auto
  online
  logging;