--@Autor: Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
--@Fecha creación: 06/02/2021
--@Descripción: Proyecto Final ' Prueba de Procedimiento para la insercion 
--de archivos Blob en tabla Multimedia y Seccion'

Prompt copiando imagenes
!rm -rf /tmp/bd
!mkdir -p /tmp/bd
!chmod 777 /tmp/bd
!cp contenido/contenido-* /tmp/bd
!cp contenido_seccion/contenido-* /tmp/bd
!chmod 777 /tmp/bd/contenido-*

Prompt conectando como usuario multimedia
connect multimedia/malo 

set serveroutput on 

Prompt =================================================
Prompt Carga 1.
Prompt Cargando Audio en tabla multimedia
Prompt ==================================================
declare 
  v_tam number;
begin 

  p_actualiza_contenido(1, 0, 'contenido-cancion1.mp3', 'MULTIMEDIA');

  select dbms_lob.getlength(contenido) into v_tam
  from multimedia 
  where multimedia_id = 1;

  if  v_tam > 0 then 
    dbms_output.put_line('Carga Exitosa.');
  else 
    raise_application_error(-20002,
      ' ERROR: No se realizó la actualización');
  end if;

  commit;
end;
/

Prompt =================================================
Prompt Carga 2.
Prompt Cargando Video en tabla multimedia
Prompt ==================================================
declare 
  v_tam number;
begin 

  p_actualiza_contenido(501, 0, 'contenido-video1.webm', 'MULTIMEDIA');

  select dbms_lob.getlength(contenido) into v_tam
  from multimedia 
  where multimedia_id = 501;

  if  v_tam > 0 then 
    dbms_output.put_line('Carga Exitosa.');
  else 
    raise_application_error(-20002,
      ' ERROR: No se realizó la actualización');
  end if;

  commit;
end;
/

Prompt =================================================
Prompt Carga 3.
Prompt Cargando Primera Seccion de un Audio en tabla Seccion
Prompt ==================================================
declare 
  v_tam number;
begin 

  p_actualiza_contenido(2, 1, 'contenido-cancion-parte1.mp3', 'SECCION');

  select dbms_lob.getlength(contenido_seccion) into v_tam
  from seccion
  where multimedia_id = 2
  and seccion_id = 1;

  if  v_tam > 0 then 
    dbms_output.put_line('Carga Exitosa.');
  else 
    raise_application_error(-20002,
      ' ERROR: No se realizó la actualización');
  end if;

  commit;
end;
/

Prompt =================================================
Prompt Carga 4.
Prompt Cargando Segunda Seccion de un Audio en tabla Seccion
Prompt ==================================================
declare 
  v_tam number;
begin 

  p_actualiza_contenido(2, 2, 'contenido-cancion-parte2.mp3', 'SECCION');

  select dbms_lob.getlength(contenido_seccion) into v_tam
  from seccion
  where multimedia_id = 2
  and seccion_id = 2;

  if  v_tam > 0 then 
    dbms_output.put_line('Carga Exitosa.');
  else 
    raise_application_error(-20002,
      ' ERROR: No se realizó la actualización');
  end if;

  commit;
end;
/

Prompt =================================================
Prompt Carga 5.
Prompt Cargando Primera Seccion de un Video en tabla Seccion
Prompt ==================================================
declare 
  v_tam number;
begin 

  p_actualiza_contenido(502, 3, 'contenido-video-parte1.webm', 'SECCION');

  select dbms_lob.getlength(contenido_seccion) into v_tam
  from seccion
  where multimedia_id = 502
  and seccion_id = 3;

  if  v_tam > 0 then 
    dbms_output.put_line('Carga Exitosa.');
  else 
    raise_application_error(-20002,
      ' ERROR: No se realizó la actualización');
  end if;

  commit;
end;
/

Prompt =================================================
Prompt Carga 6.
Prompt Cargando Segunda Seccion de un Video en tabla Seccion
Prompt ==================================================
declare 
  v_tam number;
begin 

  p_actualiza_contenido(502, 4, 'contenido-video-parte2.mp4', 'SECCION');

  select dbms_lob.getlength(contenido_seccion) into v_tam
  from seccion
  where multimedia_id = 502
  and seccion_id = 4;

  if  v_tam > 0 then 
    dbms_output.put_line('Carga Exitosa.');
  else 
    raise_application_error(-20002,
      ' ERROR: No se realizó la actualización');
  end if;

  commit;
end;
/

begin 
  --Insertamos canciones en multimedia 
  p_actualiza_contenido(3, 0, 'contenido-cancion2.mp3', 'MULTIMEDIA');
  p_actualiza_contenido(4, 0, 'contenido-cancion2.mp3', 'MULTIMEDIA');
  p_actualiza_contenido(5, 0, 'contenido-cancion2.mp3', 'MULTIMEDIA');
  p_actualiza_contenido(6, 0, 'contenido-cancion2.mp3', 'MULTIMEDIA');
  p_actualiza_contenido(7, 0, 'contenido-cancion2.mp3', 'MULTIMEDIA');
  p_actualiza_contenido(8, 0, 'contenido-cancion2.mp3', 'MULTIMEDIA');
  p_actualiza_contenido(9, 0, 'contenido-cancion2.mp3', 'MULTIMEDIA');
  p_actualiza_contenido(10, 0, 'contenido-cancion2.mp3', 'MULTIMEDIA');

  --Insertamos Videos en multimedia
  p_actualiza_contenido(503, 0, 'contenido-video2.mp4', 'MULTIMEDIA');
  p_actualiza_contenido(504, 0, 'contenido-video2.mp4', 'MULTIMEDIA');
  p_actualiza_contenido(505, 0, 'contenido-video2.mp4', 'MULTIMEDIA');
  p_actualiza_contenido(506, 0, 'contenido-video2.mp4', 'MULTIMEDIA');
  p_actualiza_contenido(507, 0, 'contenido-video2.mp4', 'MULTIMEDIA');
  p_actualiza_contenido(508, 0, 'contenido-video2.mp4', 'MULTIMEDIA');
  p_actualiza_contenido(509, 0, 'contenido-video2.mp4', 'MULTIMEDIA');
  p_actualiza_contenido(510, 0, 'contenido-video2.mp4', 'MULTIMEDIA');
  commit;

end;
/

Prompt Mostramos resultados de carga

select multimedia_id,tipo,dbms_lob.getlength(contenido) as longitud_contenido
from multimedia
where (multimedia_id > 0 and multimedia_id < 11)
or (multimedia_id > 500 and multimedia_id < 511);

select seccion_id, multimedia_id, dbms_lob.getlength(contenido_seccion) as longitud_contenido_seccion
from seccion 
where( (multimedia_id = 2 and (seccion_id = 1 or seccion_id = 2))
or  (multimedia_id = 502 and (seccion_id = 3 or seccion_id = 4)));
