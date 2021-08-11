#!/bin/bash 

# @Autor  Rodrigo Lopez López - Carlos Giovanni Martínez Gutiérrez
# @Fecha 01/02/2021
# @Descripcion: Proyecto Final - Creación de Loop Devices

#Entramos a la carpeta unam-bda
cd /unam-bda 

#Crear archivos para loop devices 
dd if=/dev/zero of=disk4.img bs=100M count=10 
dd if=/dev/zero of=disk5.img bs=100M count=10 
dd if=/dev/zero of=disk6.img bs=100M count=10 
dd if=/dev/zero of=disk7.img bs=100M count=10 

#comprobamos la creacion de los archivos 
du -sh disk*.img 

#crear cada loop device asociandolo a su archivo creado
losetup -fP disk4.img
losetup -fP disk5.img
losetup -fP disk6.img
losetup -fP disk7.img

#Confirmar creacion del loop device 
losetup -a

#Dar formato a los archivos creados
mkfs.ext4 disk4.img
mkfs.ext4 disk5.img
mkfs.ext4 disk6.img
mkfs.ext4 disk7.img

#Crear directorios u02 y u03 
mkdir -p /disk1
mkdir -p /disk2
mkdir -p /disk3
mkdir -p /disk4
mkdir -p /diskFRA