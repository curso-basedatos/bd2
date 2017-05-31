/*
En este segundo tema veremos como se guardan los registro usando
un procedimiento almacenado,pero antes veremos lo que es
un bloque PL SQL
*/

--ESTRUCTURA BASICA DE UN BLOQUE PL SQL
SET SERVEROUTPUT ON;

DECLARE
    mensaje   VARCHAR2(80);
BEGIN
    mensaje := 'HOLA';
    dbms_output.put_line(mensaje);
    dbms_output.put_line('MUNDO');
END;
/

--INTRODUCCION A LOS PROCEDIMIENTOS ALMACENADOS
--PRIMERO CREAMOS LA TABLA SALA_CINE

CREATE TABLE SALA_CINE(ID_SALA_CINE INTEGER, PELICULA VARCHAR2(40), 
CONSTRAINT PK_ID_SALA_CINE PRIMARY KEY (ID_SALA_CINE));

CREATE SEQUENCE SEC_SALA_CINE 
START WITH 1
INCREMENT BY 2
NOMAXVALUE;

CREATE OR REPLACE PROCEDURE GUARDAR_SALA_CINE(MY_ID OUT INTEGER, MY_PELICULA IN VARCHAR2)
AS 
BEGIN
SELECT SEC_SALA_CINE.NEXTVAL INTO MY_ID FROM DUAL;
INSERT INTO SALA_CINE VALUES(MY_ID, MY_PELICULA);
END;
/

SELECT * FROM SALA_CINE;

DECLARE 
VALOR INTEGER;
BEGIN
GUARDAR_SALA_CINE(VALOR, 'HUYE');
END;
/

set serveroutput on;
declare
cantidad integer;
begin
select count(*) into cantidad from sala_cine;
dbms_output.put_line(cantidad);
end;
/

declare
cursor cur_sala is select * from sala_cine;
begin
for rec in cur_sala loop
dbms_output.put_line(lower(rec.pelicula));
end loop;
end;
/

select * from cliente;
select * from ventas;
select * from vendedor;
select * from almacen;


