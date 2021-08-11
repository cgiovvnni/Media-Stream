--@Autor: Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
--@Fecha creación: 02/02/2021
--@Descripción: Proyecto Final - Habilitacion de la FRA

--Calculo del tamaño de la FRA
-- Agregar el calculo #

--Tamaño de la FRA
alter system set db_recovery_file_dest_size = 12G scope = both;

--Archivos de la FRA
alter system set db_recovery_file_dest='/diskFRA' scope = both;

--Cantidad de minutos que se puede realizar flashback
-- (5 dias x 24 horas x 60 minutos)
alter system set db_flashback_retention_target=7200 scope = spfile; -- 5 días