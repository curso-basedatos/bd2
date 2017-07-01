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


create table primera(id integer primary key, nombre varchar2(30));
create table respaldo(id integer primary key, nombre varchar2(30));
-- un secreto para la secuencia
create sequence sec_primera 
start with 1
increment by 1
nomaxvalue;

create or replace trigger dis_insertar before insert on primera for each row
begin
select sec_primera.nextval into :new.id from dual;
end;
/

create or replace trigger t_respaldo before insert on primera for each row
declare
valor integer;
cursor cur_primera is select * from primera;
begin
 select count(*) into valor from primera;
 if valor >=3 then
 for rec in cur_primera loop
 insert into respaldo values(rec.id, rec.nombre);
 end loop;
 delete from primera;
 end if;
 end;
 /

 
 
 insert into primera(id,nombre) values(8,'juan');
 select * from primera;
 select * from respaldo;
 
 
 
 declare
 hora varchar2(10);
 fecha varchar2(10);
 dia varchar(7);
 minutos varchar2(7);
 segundos varchar2(7);
 begin
 fecha:=to_char(sysdate);
 dia:=to_char(sysdate,'hh');
 minutos:=to_char(sysdate,'mi');
 segundos:=to_char(sysdate,'ss');
 dbms_output.put_line(dia);
 if dia='09' then
  dbms_output.put_line('son las nueve');
  else
   dbms_output.put_line('Pasan de las nueve');
  end if;
   dbms_output.put_line('minutos '||minutos);
    dbms_output.put_line('segundos '||segundos);
end;
/
set serveroutput on;


