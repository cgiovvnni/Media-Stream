--@Autor: Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
--@Fecha creación: 02/02/2021
--@Descripción: Proyecto Final - Indices

Prompt Conectando como sysdba 
connect sys/system2 as sysdba 

--8. Multimedia - genero FK
create index multimedia.multimedia_genero_ix on multimedia.multimedia(genero_id)
tablespace multimedia_ix_tbs;

--8. Multimedia- Clave UK
create unique index multimedia.multimedia_clave_iuk on multimedia.multimedia(clave)
tablespace multimedia_ix_tbs; 

--10. multimedia_autor - autor_id FK
create index multimedia.multimedia_autor_autor_ix on multimedia.multimedia_autor(autor_id)
tablespace multimedia_ix_tbs;

--10. multimedia_autor - multimedia_id FK
create index multimedia.multimedia_autor_multimedia_ix on multimedia.multimedia_autor(multimedia_id)
tablespace multimedia_ix_tbs;

--10 multimedia_autor - autor_id & multimedia_id UK
--Para evitar mismo autor de una multimedia con un porcentaje diferente
create unique index multimedia.multimedia_autor_multimedia_autor_iuk on multimedia.multimedia_autor(autor_id, multimedia_id)
tablespace multimedia_ix_tbs;

--11. Playlist_multimedia - playlist_id FK
create index cliente.playlist_multimedia_playlist_ix on cliente.playlist_multimedia(playlist_id)
tablespace usuario_ix_tbs;

--11. Playlist_multimedia - multimedia_id FK 
create index cliente.playlist_multimedia_multimedia_ix on cliente.playlist_multimedia(multimedia_id)
tablespace usuario_ix_tbs;

--12. Plan usuario - clave
create unique index administrador_plan.plan_usuario_clave_iuk on administrador_plan.plan_usuario(clave)
tablespace administracion_plan_ix_tbs;

--13. plan_historico - plan_usuario FK
create index administrador_plan.plan_historico_plan_usuario_ix on administrador_plan.plan_historico(plan_usuario_id)
tablespace administracion_plan_ix_tbs;

--14. Usuario - username UK
create unique index cliente.usuario_username_iuk on cliente.usuario(username)
tablespace usuario_ix_tbs;

--14. Usuario - email UK 
create unique index cliente.usuario_email_iuk on cliente.usuario(email)
tablespace usuario_ix_tbs;

--14. Usuario - RFC UK
create unique index cliente.usuario_RFC_iuk on cliente.usuario(RFC)
tablespace usuario_ix_tbs;

--14. Usuario - plan_usuario_id FK
create index cliente.usuario_plan_usuario_ix on cliente.usuario(plan_usuario_id)
tablespace usuario_ix_tbs;

--14. Usuario - asociado_id FK 
create index cliente.usuario_asociado_ix on cliente.usuario(asociado_id)
tablespace usuario_ix_tbs;

--15. Playlist_usuario - playlist_id FK
create index cliente.playlist_usuario_playlist_ix on cliente.playlist_usuario(playlist_id)
tablespace usuario_ix_tbs;

--15. playlist_usuario - usuario_id FK
create index cliente.playlist_usuario_usuario_ix on cliente.playlist_usuario(usuario_id)
tablespace usuario_ix_tbs;

--16. tarjeta - numero UK
create unique index administrador_pago.tarjeta_numero_iuk on administrador_pago.tarjeta(numero)
tablespace administracion_pago_ix_tbs;

--16. tarjeta - usuario UK
create unique index administrador_pago.tarjeta_usuario_iuk on administrador_pago.tarjeta(usuario_id)
tablespace administracion_pago_ix_tbs;

--17. cargo - folio UK 
create unique index administrador_pago.cargo_folio_iuk on administrador_pago.cargo(folio)
tablespace administracion_pago_ix_tbs;

--17. cargo - folio y tarjeta UK
create unique index administrador_pago.cargo_folio_tarjeta_iuk on administrador_pago.cargo(folio, tarjeta_id)
tablespace administracion_pago_ix_tbs;

--18. Dispositivo - IP UK
create unique index cliente.dispositivo_IP_iuk on cliente.dispositivo(IP)
tablespace usuario_ix_tbs;

--18. Dispositivo - Usuario_id FK 
create index cliente.dispositivo_usuario_ix on cliente.dispositivo(usuario_id)
tablespace usuario_ix_tbs;

--19. Reproducción - usuario_id FK
create index cliente.reproduccion_usuario_ix on cliente.reproduccion(usuario_id)
tablespace usuario_ix_tbs;

--19. Reproducción - multimedia_id FK
create index cliente.reproduccion_multimedia_ix on cliente.reproduccion(multimedia_id)
tablespace usuario_ix_tbs;

--19. Reproducción -  dispositivo_id FK 
create index cliente.reproduccion_dispositivo_ix on cliente.reproduccion(dispositivo_id)
tablespace usuario_ix_tbs;

--20. Comentario - usuario_id FK
create index multimedia.comentario_usuario_ix on multimedia.comentario(usuario_id)
tablespace multimedia_ix_tbs;

--20. Comentario - multimedia_id FK 
create index multimedia.comentario_multimedia_ix on multimedia.comentario(multimedia_id)
tablespace multimedia_ix_tbs;

--20. Comentario - comentario_ant_id FK 
create index multimedia.comentario_comentario_ant_ix on multimedia.comentario(comentario_ant)
tablespace multimedia_ix_tbs;

--22. Audio - tipo_formato_id FK
create index multimedia.audio_tipo_formato_ix on multimedia.audio(tipo_formato_id)
tablespace multimedia_ix_tbs; 

--23. Video - tipo_video_id FK
create index multimedia.video_tipo_video_ix on multimedia.video(tipo_video_id)
tablespace multimedia_ix_tbs;

--23. Video - tipo_codificacion FK
create index multimedia.video_tipo_codificacion_ix on multimedia.video(tipo_codificacion_id)
tablespace multimedia_ix_tbs;

--23. Video - tipo_transporte_id FK
create index multimedia.video_tipo_transporte_ix on multimedia.video(tipo_transporte_id)
tablespace multimedia_ix_tbs;

--23. Video - tipo_protocolo_id FK
create index multimedia.video_tipo_protocolo_ix on multimedia.video(tipo_protocolo_id)
tablespace multimedia_ix_tbs;

--24. registro_reproduccion - usuario_id FK 
create index cliente.registro_reproduccion_usuario_ix on cliente.registro_reproduccion(usuario_id)
tablespace usuario_ix_tbs;

--24. registro_reproduccion - multimedia_id FK
create index cliente.registro_reproduccion_multimedia_id on cliente.registro_reproduccion(multimedia_id)
tablespace usuario_ix_tbs;

Prompt Listo!
