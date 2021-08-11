--@Autor: Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
--@Fecha creación: 02/05/2021
--@Descripción: Proyecto Final 'Procedimiento para la insercion de 
--archivos Blob en tabla multimedia y seccion'

whenever sqlerror exit rollback
set serveroutput on

Prompt Actualizando datos Blob de Multimedia

Prompt conectando como sys
connect sys/system2 as sysdba 

Prompt creando objeto DATA_DIR
create or replace directory data_dir as '/tmp/bd';
grant read, write on directory data_dir to multimedia; 

Prompt conectando como usuario multimedia
connect multimedia/malo 

Prompt creando procedimiento para cargar archivos Blob.

create or replace procedure p_actualiza_contenido (
  p_multimedia_id in number, p_seccion_id in number, p_nombre_archivo in varchar2,
  p_tipo in varchar2 ) is 
--Declaracion de variables 
  v_bfile bfile;
  v_src_offset number := 1;
  v_dest_offset number := 1;
  v_dest_blob blob;
  v_src_length number;
  v_dest_length number;

begin 
  v_src_offset := 1;
  v_dest_offset := 1;
  dbms_output.put_line('Cargando contenido para ' || p_nombre_archivo);
  v_bfile := bfilename('DATA_DIR', p_nombre_archivo);

  if dbms_lob.fileexists(v_bfile) = 1 and not dbms_lob.isopen(v_bfile) = 1 then 
      dbms_lob.open(v_bfile, dbms_lob.lob_readonly);
  else raise_application_error(-20001, 'El archivo '
      || p_nombre_archivo
      || ' no existe en el directorio DATA_DIR'
      || ' o el archivo esta abierto');
  end if;

  if p_tipo = 'MULTIMEDIA' then 
    select contenido into v_dest_blob
    from multimedia 
    where multimedia_id  = p_multimedia_id
    for update;
  elsif p_tipo = 'SECCION' then 
    select contenido_seccion into v_dest_blob
    from seccion 
    where multimedia_id  = p_multimedia_id
    and seccion_id = p_seccion_id
    for update;
  else 
    raise_application_error(-20010,'Tipo Inválido');
  end if;

  dbms_lob.loadblobfromfile(
    dest_lob => v_dest_blob,
    src_bfile => v_bfile,
    amount => dbms_lob.getlength(v_bfile),
    dest_offset => v_dest_offset,
    src_offset => v_src_offset);

  dbms_lob.close(v_bfile);
  v_src_length := dbms_lob.getlength(v_bfile);
  v_dest_length := dbms_lob.getlength(v_dest_blob);

  if v_src_length = v_dest_length then
    dbms_output.put_line('Escritura correcta, bytes escritos: '
    || v_src_length);
  else raise_application_error(-20002, 'Error al escribir datos.\n'
    || ' Se esperaba escribir '
    || v_src_length
    || ' Pero solo se escribió '
    || v_dest_length);
  end if;

end;
/
show errors