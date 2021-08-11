--@Autor: Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
--@Fecha creación: 02/02/2021
--@Descripción: Proyecto Final - Creacion de secuencias

--Secuencias para el módulo Administracion
--Plan Historico
create sequence administrador_plan.plan_historico_seq 
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Plan Usuario
create sequence administrador_plan.plan_usuario_seq 
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Secuencias para el modulo pago
--Cargo
create sequence administrador_pago.cargo_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Tarjeta
create sequence administrador_pago.tarjeta_seq 
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Secuencias para el modulo usuario
--Usuario
create sequence cliente.usuario_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Dispositivo
create sequence cliente.dispositivo_seq 
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Reproducción 
create sequence cliente.reproduccion_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Registro_reproduccion
create sequence cliente.registro_reproduccion_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Playlist
create sequence cliente.playlist_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Playlist Usuario
create sequence cliente.playlist_usuario_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--playlist_multimedia
create sequence cliente.playlist_multimedia_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Secuencias para el modulo multimedia

--Comentario
create sequence multimedia.comentario_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Seccion
create sequence multimedia.seccion_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Multimedia
create sequence multimedia.multimedia_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Audio
create sequence multimedia.audio_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Video
create sequence multimedia.video_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Tipo Formato
create sequence multimedia.tipo_formato_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Tipo video
create sequence multimedia.tipo_video_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Tipo_codificación 
create sequence multimedia.tipo_codificacion_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Tipo Transporte
create sequence multimedia.tipo_transporte_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Tipo Protocolo
create sequence multimedia.tipo_protocolo_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Genero 
create sequence multimedia.genero_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Autor 
create sequence multimedia.autor_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

--Multimedia_autor  
create sequence multimedia.multimedia_autor_seq
  start with 1 
  increment by 1 
  nominvalue
  nomaxvalue
  nocycle;

Prompt Listo!