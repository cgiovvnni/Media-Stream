--@Autor: Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
--@Fecha creación: 02/02/2021
--@Descripción: Proyecto Final - Creacion de Usuarios y roles

Prompt Conectando como sysdba 
connect sys/system2 as sysdba 

set serveroutput on

--Eliminando usuario administrador_plan en caso de existir
declare 
v_count number(1,0);
begin
  select count(*) into v_count
  from dba_users
  where username = 'ADMINISTRADOR_PLAN';
  if v_count > 0 then
    dbms_output.put_line('Eliminando usuario existente');
    execute immediate 'drop user ADMINISTRADOR_PLAN cascade';
  end if; 
end;
/ 

--Eliminando usuario administrador_pago en caso de existir
declare 
v_count number(1,0);
begin
  select count(*) into v_count
  from dba_users
  where username = 'ADMINISTRADOR_PAGO';
  if v_count > 0 then
    dbms_output.put_line('Eliminando usuario existente');
    execute immediate 'drop user ADMINISTRADOR_PAGO cascade';
  end if; 
end;
/ 

--Eliminando usuario cliente en caso de existir
declare 
v_count number(1,0);
begin
  select count(*) into v_count
  from dba_users
  where username = 'CLIENTE';
  if v_count > 0 then
    dbms_output.put_line('Eliminando usuario existente');
    execute immediate 'drop user CLIENTE cascade';
  end if; 
end;
/ 

--Eliminando usuario multimedia en caso de existir
declare 
v_count number(1,0);
begin
  select count(*) into v_count
  from dba_users
  where username = 'MULTIMEDIA';
  if v_count > 0 then
    dbms_output.put_line('Eliminando usuario existente');
    execute immediate 'drop user MULTIMEDIA cascade';
  end if; 
end;
/ 

--Eliminando usuario administrador_backups en caso de existir
declare 
v_count number(1,0);
begin
  select count(*) into v_count
  from dba_users
  where username = 'ADMINISTRADOR_BACKUPS';
  if v_count > 0 then
    dbms_output.put_line('Eliminando usuario existente');
    execute immediate 'drop user ADMINISTRADOR_BACKUPS cascade';
  end if; 
end;
/ 

Prompt Creación de usuarios 

Prompt Creando usuario administrador_plan
create user administrador_plan 
identified by malo 
default tablespace administracion_plan_tbs
quota unlimited on administracion_plan_tbs;

Prompt Creando usuario administrador pago 
create user administrador_pago
identified by malo 
default tablespace administracion_pago_tbs 
quota unlimited on administracion_pago_tbs;

Prompt Creando usuario cliente
create user cliente 
identified by malo 
default tablespace usuario_tbs
quota unlimited on usuario_tbs;

Prompt Creando usuario multimedia
create user multimedia 
identified by malo 
default tablespace multimedia_tbs
quota unlimited on multimedia_tbs;

Prompt Creando usuario administrador Backups 
create user administrador_backups
identified by malo 
default tablespace users
quota unlimited on users;


Prompt Creación y Asignación de roles
--Eliminado rol admin en caso de existir 
declare
  v_count number(1,0);
begin
  select count(*) into v_count
  from dba_roles
  where role ='ROL_ADMIN';

  if v_count > 0 then
    execute immediate 'drop role ROL_ADMIN';
    dbms_output.put_line('Rol eliminado');
  else
    dbms_output.put_line('El rol no existe, no se requiere eliminar');
  end if;
end;
/

Prompt Creando rol admin 
create role rol_admin;

grant create session, create table, create view, create procedure, 
  create sequence, create public synonym, create synonym, create type, 
  create trigger, create any index to rol_admin;

Prompt Asignamos rol a los usuarios
grant rol_admin to administrador_plan;
grant rol_admin to administrador_pago;
grant rol_admin to cliente;
grant rol_admin to multimedia;

Prompt Asignamos privilegios sysbackup a usuario administrador_backups
grant sysbackup to administrador_backups;

Prompt asignamos permisos para consultar los ts de Indices
alter user administrador_plan quota unlimited on administracion_plan_ix_tbs;
alter user administrador_pago quota unlimited on administracion_pago_ix_tbs;
alter user multimedia quota unlimited on multimedia_ix_tbs;
alter user cliente quota unlimited on usuario_ix_tbs;
alter user multimedia quota unlimited on blob_tbs;
alter user multimedia quota unlimited on blob_ix_tbs;



