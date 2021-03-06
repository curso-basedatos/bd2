--Solucion
CREATE TABLE CONTACTO(
                      ID INTEGER,
                      NOMBRE VARCHAR2(30),
                      EDAD INTEGER,
                      INGRESO DATE,
                      CONSTRAINT PK_ID_CONTACTO PRIMARY KEY(ID)
                      );
                            
INSERT INTO CONTACTO(ID, NOMBRE, EDAD) VALUES(1, 'juan',45);

SET SERVEROUTPUT ON;



-- EL DISPARADOR
CREATE OR REPLACE TRIGGER RESTRINGIR_TIEMPO BEFORE UPDATE ON CONTACTO FOR EACH ROW
DECLARE
  SEGUNDOS VARCHAR(10);
BEGIN
SEGUNDOS:=TO_CHAR(SYSDATE,'SS');
  
  IF SEGUNDOS >10 THEN
  RAISE_APPLICATION_ERROR(-20001,'lO SIENTO ACUTALZIACION NO POSIBLE A TAL HORA:'||SEGUNDOS);
     

  ELSE
  DBMS_OUTPUT.PUT_LINE('ACTUALIZADO AL SEGUNDO '||SEGUNDOS);
    END IF;
END;
/
SELECT * FROM CONTACTO;
UPDATE CONTACTO SET INGRESO=SYSDATE WHERE ID=1;