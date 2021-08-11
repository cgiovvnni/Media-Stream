--@Autor: Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
--@Fecha creación: 02/02/2021
--@Descripción: Proyecto Final - Creacion de la tablas 

Prompt Conectando como sysdba 
connect sys/system2 as sysdba 

-- 
--1. TABLE: TIPO_FORMATO 
--

CREATE TABLE MULTIMEDIA.TIPO_FORMATO(
    TIPO_FORMATO_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE        VARCHAR2(40)     NOT NULL,
    CONSTRAINT TIPO_FORMATO_PK PRIMARY KEY (TIPO_FORMATO_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.TIPO_FORMATO_PK ON MULTIMEDIA.TIPO_FORMATO(TIPO_FORMATO_ID)
      TABLESPACE MULTIMEDIA_IX_TBS
    )
);

-- 
--2. TABLE: TIPO_VIDEO 
--

CREATE TABLE MULTIMEDIA.TIPO_VIDEO(
    TIPO_VIDEO_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE           VARCHAR2(40)     NOT NULL,
    CONSTRAINT TIPO_VIDEO_PK PRIMARY KEY (TIPO_VIDEO_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.TIPO_VIDEO_PK ON MULTIMEDIA.TIPO_VIDEO(TIPO_VIDEO_ID)
      TABLESPACE MULTIMEDIA_IX_TBS
    )
);

-- 
--3. TABLE: TIPO_CODIFICACION 
--

CREATE TABLE MULTIMEDIA.TIPO_CODIFICACION(
    TIPO_CODIFICACION_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE                  VARCHAR2(40)     NOT NULL,
    CONSTRAINT TIPO_CODIFICACION_PK PRIMARY KEY (TIPO_CODIFICACION_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.TIPO_CODIFICACION_PK ON MULTIMEDIA.TIPO_CODIFICACION(TIPO_CODIFICACION_ID)
      TABLESPACE MULTIMEDIA_IX_TBS
    )
);

-- 
--4. TABLE: TIPO_TRANSPORTE 
--

CREATE TABLE MULTIMEDIA.TIPO_TRANSPORTE(
    TIPO_TRANSPORTE_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE                VARCHAR2(40)     NOT NULL,
    CONSTRAINT TIPO_TRANSPORTE_PK PRIMARY KEY (TIPO_TRANSPORTE_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.TIPO_TRANSPORTE_PK ON MULTIMEDIA.TIPO_TRANSPORTE(TIPO_TRANSPORTE_ID)
      TABLESPACE MULTIMEDIA_IX_TBS
    )
);

-- 
--5. TABLE: TIPO_PROTOCOLO 
--

CREATE TABLE MULTIMEDIA.TIPO_PROTOCOLO(
    TIPO_PROTOCOLO_ID    NUMBER(10,0)    NOT NULL,
    NOMBRE               VARCHAR2(40)    NOT NULL,
    CONSTRAINT TIPO_PROTOCOLO_PK PRIMARY KEY (TIPO_PROTOCOLO_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.TIPO_PROTOCOLO_PK ON MULTIMEDIA.TIPO_PROTOCOLO(TIPO_PROTOCOLO_ID)
      TABLESPACE MULTIMEDIA_IX_TBS
    )
);

-- 
--6. TABLE: GENERO 
--

CREATE TABLE MULTIMEDIA.GENERO(
    GENERO_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE       VARCHAR2(40)     NOT NULL,
    CONSTRAINT GENERO_PK PRIMARY KEY (GENERO_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.GENERO_PK ON MULTIMEDIA.GENERO(GENERO_ID)
      TABLESPACE MULTIMEDIA_IX_TBS
    )
);

-- 
--7. TABLE: AUTOR 
--

CREATE TABLE MULTIMEDIA.AUTOR(
    AUTOR_ID            NUMBER(10, 0)    NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    AP_PATERNO          VARCHAR2(40)     NOT NULL,
    AP_MATERNO          VARCHAR2(40)     NOT NULL,
    EMAIL               VARCHAR2(40)     NOT NULL,
    NOMBRE_ARTISTICO    VARCHAR2(40)     NOT NULL,
    CONSTRAINT AUTOR_PK PRIMARY KEY (AUTOR_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.AUTOR_PK ON MULTIMEDIA.AUTOR(AUTOR_ID)
      TABLESPACE MULTIMEDIA_IX_TBS
    )
);

-- 
--8. TABLE: MULTIMEDIA 
--

CREATE TABLE MULTIMEDIA.MULTIMEDIA(
    MULTIMEDIA_ID           NUMBER(10, 0)    NOT NULL,
    CLAVE                   VARCHAR2(16)     NOT NULL,
    NOMBRE                  VARCHAR2(250)    NOT NULL,
    TOTAL_REPRODUCCIONES    NUMBER(5, 0)     NOT NULL,
    DURACION_MIN            NUMBER(10, 2)    NOT NULL,
    CALIFICACION            NUMBER(1, 0)     NOT NULL,
    CONTENIDO               BLOB                 NULL,
    TIPO                    NUMBER(1,0)      NOT NULL,
    GENERO_ID               NUMBER(10, 0)    NOT NULL,
    CONSTRAINT MULTIMEDIA_GENERO_ID_FK FOREIGN KEY (GENERO_ID)
      REFERENCES MULTIMEDIA.GENERO(GENERO_ID),
    CONSTRAINT MULTIMEDIA_CALIFICACION_CHK 
      CHECK (CALIFICACION IN (1,2,3,4,5)),
    CONSTRAINT MULTIMEDIA_TIPO_CHK 
      CHECK (TIPO IN (0,1)),
    CONSTRAINT MULTIMEDIA_PK PRIMARY KEY (MULTIMEDIA_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.MULTIMEDIA_PK ON MULTIMEDIA.MULTIMEDIA(MULTIMEDIA_ID)
      TABLESPACE MULTIMEDIA_IX_TBS
    )
) LOB (CONTENIDO) STORE AS (TABLESPACE blob_tbs);

-- 
--9. TABLE: PLAYLIST 
--

CREATE TABLE CLIENTE.PLAYLIST(
    PLAYLIST_ID    NUMBER(10, 0)    NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    CONSTRAINT PLAYLIST_PK PRIMARY KEY (PLAYLIST_ID)
    USING INDEX (
      CREATE UNIQUE INDEX CLIENTE.PLAYLIST_PK ON CLIENTE.PLAYLIST(PLAYLIST_ID)
      TABLESPACE USUARIO_IX_TBS
    )
);

-- 
--10. TABLE: MULTIMEDIA_AUTOR 
--

CREATE TABLE MULTIMEDIA.MULTIMEDIA_AUTOR(
    MULTIMEDIA_AUTOR_ID    NUMBER(10, 0)    NOT NULL,
    PORCENTAJE             NUMBER(5, 2)     NOT NULL,
    AUTOR_ID               NUMBER(10, 0)    NOT NULL,
    MULTIMEDIA_ID          NUMBER(10, 0)    NOT NULL,
    CONSTRAINT MULTIMEDIA_AUTOR_AUTOR_ID_FK FOREIGN KEY (AUTOR_ID)
      REFERENCES MULTIMEDIA.AUTOR(AUTOR_ID),
    CONSTRAINT MULTIMEDIA_AUTOR_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
      REFERENCES MULTIMEDIA.MULTIMEDIA(MULTIMEDIA_ID),
    CONSTRAINT MULTIMEDIA_AUTOR_PK PRIMARY KEY (MULTIMEDIA_AUTOR_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.MULTIMEDIA_AUTOR_PK ON MULTIMEDIA.MULTIMEDIA_AUTOR(MULTIMEDIA_AUTOR_ID)
      TABLESPACE MULTIMEDIA_IX_TBS
    )
);

-- 
--11. TABLE: PLAYLIST_MULTIMEDIA 
--
grant select on multimedia.multimedia to cliente;
grant references (multimedia_id) on multimedia.multimedia to cliente;

CREATE TABLE CLIENTE.PLAYLIST_MULTIMEDIA(
    PLAYLIST_MULTIMEDIA_ID    VARCHAR2(40)     NOT NULL,
    PLAYLIST_ID               NUMBER(10, 0)    NOT NULL,
    MULTIMEDIA_ID             NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PLAYLIST_MULTIMEDIA_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
      REFERENCES MULTIMEDIA.MULTIMEDIA(MULTIMEDIA_ID),
    CONSTRAINT PLAYLIST_MULTIMEDIA_PLAYLIST_ID_FK FOREIGN KEY (PLAYLIST_ID)
      REFERENCES CLIENTE.PLAYLIST(PLAYLIST_ID),
    CONSTRAINT PLAYLIST_MULTIMEDIA_PK PRIMARY KEY (PLAYLIST_MULTIMEDIA_ID)
    USING INDEX (
      CREATE UNIQUE INDEX CLIENTE.PLAYLIST_MULTIMEDIA_PK ON CLIENTE.PLAYLIST_MULTIMEDIA(PLAYLIST_MULTIMEDIA_ID)
      TABLESPACE USUARIO_IX_TBS
    )
);

-- 
--12. TABLE: PLAN_USUARIO 
--

CREATE TABLE ADMINISTRADOR_PLAN.PLAN_USUARIO(
    PLAN_USUARIO_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE              VARCHAR2(16)     NOT NULL,
    NOMBRE             VARCHAR2(40)     NOT NULL,
    COSTO              NUMBER(10,2)     NOT NULL,
    DESCRIPCION        VARCHAR2(40)     NOT NULL,
    VIGENCIA_INICIO    DATE             NOT NULL,
    VIGENCIA_FIN       DATE             NOT NULL,
    CONSTRAINT PLAN_USUARIO_PK PRIMARY KEY (PLAN_USUARIO_ID)
    USING INDEX (
      CREATE UNIQUE INDEX ADMINISTRADOR_PLAN.PLAN_USUARIO_PK ON ADMINISTRADOR_PLAN.PLAN_USUARIO(PLAN_USUARIO_ID)
      TABLESPACE ADMINISTRACION_PLAN_IX_TBS
    )
);

-- 
--13. TABLE: PLAN_HISTORICO 
--

CREATE TABLE ADMINISTRADOR_PLAN.PLAN_HISTORICO(
    PLAN_HISTORICO_ID    NUMBER(10, 0)    NOT NULL,
    COSTO                  NUMBER(10, 2)    NOT NULL,
    VIGENCIA_INICIO        DATE             NOT NULL,
    VIGENCIA_FIN           DATE             NOT NULL,
    VALIDEZ                NUMBER(1, 0)     NOT NULL,
    PLAN_USUARIO_ID        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PLAN_HISTORICO_PLAN_USUARIO_ID_FK FOREIGN KEY (PLAN_USUARIO_ID)
      REFERENCES ADMINISTRADOR_PLAN.PLAN_USUARIO(PLAN_USUARIO_ID),
    CONSTRAINT PLAN_HISTORICO_PK PRIMARY KEY (PLAN_HISTORICO_ID)
    USING INDEX (
      CREATE UNIQUE INDEX ADMINISTRADOR_PLAN.PLAN_HISTORICO_PK ON ADMINISTRADOR_PLAN.PLAN_HISTORICO(PLAN_HISTORICO_ID)
      TABLESPACE ADMINISTRACION_PLAN_IX_TBS
    )
);

-- 
--14. TABLE: USUARIO 
--

grant select on administrador_plan.plan_usuario to cliente;
grant references (plan_usuario_id) on administrador_plan.plan_usuario to cliente;

CREATE TABLE CLIENTE.USUARIO(
    USUARIO_ID     NUMBER(10, 0)    NOT NULL,
    USERNAME       VARCHAR2(40)     NOT NULL,
    PASSWORD       VARCHAR2(40)     NOT NULL,
    EMAIL          VARCHAR2(40)     NOT NULL,
    NOMBRE         VARCHAR2(40)     NOT NULL,
    AP_PATERNO     VARCHAR2(40)     NOT NULL,
    AP_MATERNO     VARCHAR2(40)     NOT NULL,
    RFC            VARCHAR2(40),
    ES_DUENIO      NUMBER(1, 0)     NOT NULL,
    PLAN_USUARIO_ID        NUMBER(10, 0)    NOT NULL,
    ASOCIADO_ID    NUMBER(10, 0),
    CONSTRAINT USUARIO_PLAN_USUARIO_ID_FK FOREIGN KEY (PLAN_USUARIO_ID)
      REFERENCES ADMINISTRADOR_PLAN.PLAN_USUARIO(PLAN_USUARIO_ID),
    CONSTRAINT USUARIO_ASOCIADO_ID_FK FOREIGN KEY (ASOCIADO_ID)
      REFERENCES CLIENTE.USUARIO(USUARIO_ID),
    CONSTRAINT USUARIO_PK PRIMARY KEY (USUARIO_ID)
    USING INDEX (
      CREATE UNIQUE INDEX CLIENTE.USUARIO_PK ON CLIENTE.USUARIO(USUARIO_ID)
      TABLESPACE USUARIO_IX_TBS
    )
);

-- 
--15. TABLE: PLAYLIST_USUARIO 
--

CREATE TABLE CLIENTE.PLAYLIST_USUARIO(
    PLAYLIST_USUARIO_ID    VARCHAR2(40)     NOT NULL,
    PLAYLIST_ID            NUMBER(10, 0)    NOT NULL,
    USUARIO_ID             NUMBER(10, 0)    NOT NULL,
    CONSTRAINT PLAYLIST_USUARIO_PLAYLIST_ID_FK FOREIGN KEY (PLAYLIST_ID)
      REFERENCES CLIENTE.PLAYLIST(PLAYLIST_ID),
    CONSTRAINT PLAYLIST_USUARIO_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
      REFERENCES CLIENTE.USUARIO(USUARIO_ID),
    CONSTRAINT PLAYLIST_USUARIO_PK PRIMARY KEY (PLAYLIST_USUARIO_ID)
    USING INDEX (
      CREATE UNIQUE INDEX CLIENTE.PLAYLIST_USUARIO_PK ON CLIENTE.PLAYLIST_USUARIO(PLAYLIST_USUARIO_ID)
      TABLESPACE USUARIO_IX_TBS
    )
);

-- 
--16. TABLE: TARJETA 
--

grant select on cliente.usuario to administrador_pago;
grant references (usuario_id) on cliente.usuario to administrador_pago;

CREATE TABLE ADMINISTRADOR_PAGO.TARJETA(
    TARJETA_ID       NUMBER(10, 0)    NOT NULL,
    NUMERO           NUMBER(20, 0)    NOT NULL,
    TIPO             VARCHAR2(40)     NOT NULL,
    NUM_SEGURIDAD    NUMBER(5, 0)     NOT NULL,
    ANIO             NUMBER(5, 0)     NOT NULL,
    MES              NUMBER(5, 0)     NOT NULL,
    USUARIO_ID       NUMBER(10, 0)    NOT NULL,
    CONSTRAINT TARJETA_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
      REFERENCES CLIENTE.USUARIO(USUARIO_ID),
    CONSTRAINT TARJETA_PK PRIMARY KEY (TARJETA_ID)
    USING INDEX (
      CREATE UNIQUE INDEX ADMINISTRADOR_PAGO.TARJETA_PK ON ADMINISTRADOR_PAGO.TARJETA(TARJETA_ID)
      TABLESPACE ADMINISTRACION_PAGO_IX_TBS
    )
);

-- 
--17. TABLE: CARGO 
--

CREATE TABLE ADMINISTRADOR_PAGO.CARGO(
    CARGO_ID      NUMBER(10, 0)    NOT NULL,
    FECHA         DATE             NOT NULL,
    IMPORTE       NUMBER(10, 2)    NOT NULL,
    FOLIO         VARCHAR2(40)     NOT NULL,
    TARJETA_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT CARGO_TARJETA_ID_FK FOREIGN KEY (TARJETA_ID)
      REFERENCES ADMINISTRADOR_PAGO.TARJETA(TARJETA_ID),
    CONSTRAINT CARGO_PK PRIMARY KEY (CARGO_ID)
    USING INDEX (
      CREATE UNIQUE INDEX ADMINISTRADOR_PAGO.CARGO_PK ON ADMINISTRADOR_PAGO.CARGO(CARGO_ID)
      TABLESPACE ADMINISTRACION_PAGO_IX_TBS
    )
);

-- 
--18. TABLE: DISPOSITIVO 
--

CREATE TABLE CLIENTE.DISPOSITIVO(
    DISPOSITIVO_ID    NUMBER(10, 0)    NOT NULL,
    TIPO              VARCHAR2(40)     NOT NULL,
    IP                VARCHAR2(40)     NOT NULL,
    OS                VARCHAR2(40)     NOT NULL,
    NOMBRE            VARCHAR2(40)     NOT NULL,
    MARCA             VARCHAR2(40)     NOT NULL,
    USUARIO_ID        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT DISPOSITIVO_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
      REFERENCES CLIENTE.USUARIO(USUARIO_ID),
    CONSTRAINT DISPOSITIVO_PK PRIMARY KEY (DISPOSITIVO_ID)
    USING INDEX (
      CREATE UNIQUE INDEX CLIENTE.DISPOSITIVO_PK ON CLIENTE.DISPOSITIVO(DISPOSITIVO_ID)
      TABLESPACE USUARIO_IX_TBS
    )
);

-- 
--19. TABLE: REPRODUCCION 
--

grant select on multimedia.multimedia to cliente;
grant references (multimedia_id) on multimedia.multimedia to cliente;

CREATE TABLE CLIENTE.REPRODUCCION(
    REPRODUCCION_ID       NUMBER(10, 0)    NOT NULL,
    FECHA_INICIO          DATE             NOT NULL,
    HORA_INICIO           VARCHAR2(40)     NOT NULL,
    DURACION_MIN          NUMBER(10, 2)    NOT NULL,
    VELOCIDAD_CARGA       NUMBER(10, 2)    NOT NULL,
    VELOCIDAD_DESCARGA    NUMBER(10, 2)    NOT NULL,
    LATITUD               VARCHAR2(40)         NULL,
    LONGITUD              VARCHAR2(40)         NULL, 
    USUARIO_ID            NUMBER(10, 0)    NOT NULL,
    MULTIMEDIA_ID         NUMBER(10, 0)    NOT NULL,
    DISPOSITIVO_ID        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT REPRODUCCION_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
      REFERENCES CLIENTE.USUARIO(USUARIO_ID),
    CONSTRAINT REPRODUCCION_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
      REFERENCES MULTIMEDIA.MULTIMEDIA(MULTIMEDIA_ID),
    CONSTRAINT REPRODUCCION_DISPOSITIVO_ID_FK FOREIGN KEY (DISPOSITIVO_ID)
      REFERENCES CLIENTE.DISPOSITIVO(DISPOSITIVO_ID),
    CONSTRAINT REPRODUCCION_PK PRIMARY KEY (REPRODUCCION_ID)
    USING INDEX (
      CREATE UNIQUE INDEX CLIENTE.REPRODUCCION_PK ON CLIENTE.REPRODUCCION(REPRODUCCION_ID)
      TABLESPACE USUARIO_IX_TBS
    )
);

-- 
--20. TABLE: COMENTARIO 
--

grant select on cliente.usuario to multimedia;
grant references (usuario_id) on cliente.usuario to multimedia;

CREATE TABLE MULTIMEDIA.COMENTARIO(
    COMENTARIO_ID     NUMBER(10, 0)    NOT NULL,
    TEXTO             VARCHAR2(120)    NOT NULL,
    USUARIO_ID        NUMBER(10, 0)    NOT NULL,
    MULTIMEDIA_ID     NUMBER(10, 0)    NOT NULL,
    COMENTARIO_ANT    NUMBER(10, 0)        NULL,
    CONSTRAINT COMENTARIO_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
      REFERENCES CLIENTE.USUARIO(USUARIO_ID),
    CONSTRAINT COMENTARIO_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
      REFERENCES MULTIMEDIA.MULTIMEDIA(MULTIMEDIA_ID),
    CONSTRAINT COMENTARIO_COMENTARIO_ANT_FK FOREIGN KEY (COMENTARIO_ANT)
      REFERENCES MULTIMEDIA.COMENTARIO(COMENTARIO_ID),
    CONSTRAINT COMENTARIO_PK PRIMARY KEY (COMENTARIO_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.COMENTARIO_PK ON MULTIMEDIA.COMENTARIO(COMENTARIO_ID)
      TABLESPACE MULTIMEDIA_IX_TBS
    )
);

-- 
--21. TABLE: SECCION 
--

CREATE TABLE MULTIMEDIA.SECCION(
    SECCION_ID           NUMBER(10, 0)    NOT NULL,
    MULTIMEDIA_ID        NUMBER(10, 0)    NOT NULL,
    DURACION_MIN         NUMBER(10, 2)    NOT NULL,
    CONTENIDO_SECCION    BLOB                 NULL,
    CONSTRAINT SECCION_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
      REFERENCES MULTIMEDIA.MULTIMEDIA(MULTIMEDIA_ID),
    CONSTRAINT SECCION_PK PRIMARY KEY (SECCION_ID, MULTIMEDIA_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.SECCION_PK ON MULTIMEDIA.SECCION(SECCION_ID, MULTIMEDIA_ID)
      TABLESPACE MULTIMEDIA_IX_TBS
    )
) LOB (CONTENIDO_SECCION) STORE AS (TABLESPACE blob_tbs);

-- 
--22. TABLE: AUDIO 
--

CREATE TABLE MULTIMEDIA.AUDIO(
    MULTIMEDIA_ID    NUMBER(10, 0)    NOT NULL,
    LETRA            VARCHAR2(400)    NOT NULL,
    NUM_KBPS         NUMBER(10, 0)    NOT NULL,
    TIPO_FORMATO_ID  NUMBER(10, 0)    NOT NULL,
    CONSTRAINT AUDIO_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
      REFERENCES MULTIMEDIA.MULTIMEDIA(MULTIMEDIA_ID),
    CONSTRAINT AUDIO_TIPO_FORMATO_ID_FK FOREIGN KEY (TIPO_FORMATO_ID)
      REFERENCES MULTIMEDIA.TIPO_FORMATO(TIPO_FORMATO_ID),
    CONSTRAINT AUDIO_PK PRIMARY KEY (MULTIMEDIA_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.AUDIO_PK ON MULTIMEDIA.AUDIO(MULTIMEDIA_ID)
      TABLESPACE MULTIMEDIA_IX_TBS
    )
);

-- 
--23. TABLE: VIDEO 
--

CREATE TABLE MULTIMEDIA.VIDEO(
    MULTIMEDIA_ID         NUMBER(10, 0)    NOT NULL,
    CLASIFICACION         VARCHAR2(1)      NOT NULL,
    TIPO_VIDEO_ID         NUMBER(10, 0)    NOT NULL,
    TIPO_CODIFICACION_ID  NUMBER(10, 0)    NOT NULL,
    TIPO_TRANSPORTE_ID    NUMBER(10, 0)    NOT NULL,
    TIPO_PROTOCOLO_ID     NUMBER(10, 0)    NOT NULL,
    CONSTRAINT VIDEO_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
      REFERENCES MULTIMEDIA.MULTIMEDIA(MULTIMEDIA_ID),
    CONSTRAINT VIDEO_TIPO_VIDEO_ID_FK FOREIGN KEY (TIPO_VIDEO_ID)
      REFERENCES MULTIMEDIA.TIPO_VIDEO(TIPO_VIDEO_ID),
    CONSTRAINT VIDEO_TIPO_CODIFICACION_ID_FK FOREIGN KEY (TIPO_CODIFICACION_ID)
      REFERENCES MULTIMEDIA.TIPO_CODIFICACION(TIPO_CODIFICACION_ID),
    CONSTRAINT VIDEO_TIPO_TRANSPORTE_ID_FK FOREIGN KEY (TIPO_TRANSPORTE_ID)
      REFERENCES MULTIMEDIA.TIPO_TRANSPORTE(TIPO_TRANSPORTE_ID),
    CONSTRAINT VIDEO_TIPO_PROTOCOLO_ID_FK FOREIGN KEY (TIPO_PROTOCOLO_ID)
      REFERENCES MULTIMEDIA.TIPO_PROTOCOLO(TIPO_PROTOCOLO_ID),
    CONSTRAINT VIDEO_CLASIFICACION_CHK 
      CHECK(CLASIFICACION IN ('A', 'B', 'C', 'D')),
    CONSTRAINT VIDEO_PK PRIMARY KEY (MULTIMEDIA_ID)
    USING INDEX (
      CREATE UNIQUE INDEX MULTIMEDIA.VIDEO_PK ON MULTIMEDIA.VIDEO(MULTIMEDIA_ID)
      TABLESPACE MULTIMEDIA_IX_TBS
    )
);

-- 
--24. TABLE: REGISTRO_REPRODUCCION 
--

grant select on multimedia.multimedia to administrador_pago;
grant references (multimedia_id) on multimedia.multimedia to cliente;

CREATE TABLE CLIENTE.REGISTRO_REPRODUCCION(
    REGISTRO_REPRODUCCION_ID      NUMBER(10, 0)    NOT NULL,
    SEGUNDO_INI      NUMBER(10,  2)   NOT NULL,
    SEGUNDO_FIN      NUMBER(10, 2)    NOT NULL,
    USUARIO_ID       NUMBER(10, 0)    NOT NULL,
    MULTIMEDIA_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT REGISTRO_REPRODUCCION_USUARIO_ID_FK FOREIGN KEY (USUARIO_ID)
      REFERENCES CLIENTE.USUARIO(USUARIO_ID),
    CONSTRAINT REGISTRO_REPRODUCCION_MULTIMEDIA_ID_FK FOREIGN KEY (MULTIMEDIA_ID)
      REFERENCES MULTIMEDIA.MULTIMEDIA(MULTIMEDIA_ID),
    CONSTRAINT REGISTRO_REPRODUCCION_PK PRIMARY KEY (REGISTRO_REPRODUCCION_ID)
    USING INDEX (
      CREATE UNIQUE INDEX CLIENTE.REGISTRO_REPRODUCCION_PK ON CLIENTE.REGISTRO_REPRODUCCION(REGISTRO_REPRODUCCION_ID)
      TABLESPACE USUARIO_IX_TBS
    )
);

Prompt Listo!