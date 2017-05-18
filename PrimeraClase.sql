--Bienvenidos
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE HOLA_MUNDO
AS
nombre varchar2(20);
BEGIN
nombre:='Juan Carlos';
nombre:=upper(nombre);
  DBMS_OUTPUT.PUT_LINE('hOLA MUNDO '||nombre);
  
END ;
/
begin
hola_mundo();
end;
/