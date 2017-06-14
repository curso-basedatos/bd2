CREATE TABLE almacen (
    numero_almacen      INTEGER,
    ubicacion_almacen   VARCHAR2(40),
    CONSTRAINT pk_na PRIMARY KEY ( numero_almacen )
);

CREATE TABLE vendedor (
    numero_vendedor   INTEGER,
    nombre_vendedor   VARCHAR2(60),
    area_ventas       VARCHAR2(40),
    CONSTRAINT pk_nv PRIMARY KEY ( numero_vendedor )
);

CREATE TABLE cliente (
    numero_cliente   INTEGER,
    numero_almacen   INTEGER,
    nombre_cliente   VARCHAR2(50),
    CONSTRAINT pk_nc PRIMARY KEY ( numero_cliente ),
    CONSTRAINT fk_na1 FOREIGN KEY ( numero_almacen )
        REFERENCES almacen ( numero_almacen )
);

CREATE TABLE ventas (
    id_ventas         INTEGER,
    numero_cliente    INTEGER,
    numero_vendedor   INTEGER,
    monto_venta       FLOAT,
    CONSTRAINT pk_idv PRIMARY KEY ( id_ventas ),
    CONSTRAINT fk_nc1 FOREIGN KEY ( numero_cliente )
        REFERENCES cliente ( numero_cliente ),
    CONSTRAINT fk_nv1 FOREIGN KEY ( numero_vendedor )
        REFERENCES vendedor ( numero_vendedor )
);

CREATE SEQUENCE sec_ventas START WITH 1 INCREMENT BY 1 NOMAXVALUE;
      
      
      --PROCEDIMIENTO ALMACEN 

CREATE OR REPLACE PROCEDURE guardar_almacen (
    my_numero_almacen      IN INTEGER,
    my_ubicacion_almacen   IN VARCHAR2
)
    AS
BEGIN
    INSERT INTO almacen VALUES (
        my_numero_almacen,
        my_ubicacion_almacen
    );

END;
/
      
      --PROCEDIMIENTO VENDEDOR

CREATE OR REPLACE PROCEDURE guardar_vendedor (
    my_numero_vendedor   IN INTEGER,
    my_nombre_vendedor   IN VARCHAR2,
    my_area_ventas       IN VARCHAR2
)
    AS
BEGIN
    INSERT INTO vendedor VALUES (
        my_numero_vendedor,
        my_nombre_vendedor,
        my_area_ventas
    );

END;
/
      
      --PROCEDIMIENTO CLIENTE

CREATE OR REPLACE PROCEDURE guardar_cliente (
    my_numero_cliente   IN INTEGER,
    my_numero_almacen   IN INTEGER,
    my_nombre_cliente   IN VARCHAR2
)
    AS
BEGIN
    INSERT INTO cliente VALUES (
        my_numero_cliente,
        my_numero_almacen,
        my_nombre_cliente
    );

END;
/
      
      --PROCEDIMIENTO VENTAS

CREATE OR REPLACE PROCEDURE guardar_ventas (
    my_id                OUT INTEGER,
    my_numero_cliente    IN INTEGER,
    my_numero_vendedor   IN INTEGER,
    my_monto_venta       IN FLOAT
)
    AS
BEGIN
    SELECT
        sec_ventas.NEXTVAL
    INTO
        my_id
    FROM
        dual;

    INSERT INTO ventas VALUES (
        my_id,
        my_numero_cliente,
        my_numero_vendedor,
        my_monto_venta
    );

END;
/
      
      --GUARDARMOS PRIMERO LA MÁS INDEPENDIENTE ALMACEN

BEGIN
    guardar_almacen(
        1,
        'PLYMOUTH'
    );
    guardar_almacen(
        2,
        'SUPERIOR'
    );
    guardar_almacen(
        3,
        'BISMARCK'
    );
    guardar_almacen(
        4,
        'FARGO'
    );
END;
/

SELECT
    *
FROM
    almacen;
      
      --LA SIGUIENTE INDEPENDIENTE  A GUARDAR ES CLIENTE

BEGIN
    guardar_cliente(
        18765,
        4,
        'DELTA SYSTEMS'
    );
    guardar_cliente(
        18830,
        3,
        'A. LEVY AND SONS'
    );
    guardar_cliente(
        19242,
        3,
        'RANIER COMPANY'
    );
    guardar_cliente(
        18841,
        2,
        'R.W. FLOOD INC.'
    );
    guardar_cliente(
        18899,
        2,
        'SEWARD SYSTEMS'
    );
    guardar_cliente(
        19565,
        1,
        'STODOLA''S INC.'
    );
END;
/

SELECT
    *
FROM
    cliente;
      
    --SIGUIENTE INDEPENDIENTE VENDEDOR  

BEGIN
    guardar_vendedor(
        3462,
        'WATERS',
        'WEST'
    );
    guardar_vendedor(
        3593,
        'DRYNE',
        'EAST'
    );
END;
/

SELECT
    *
FROM
    vendedor;
    
    --ULTIMA DEPENDIENTE VENTAS

DECLARE
    valor   INTEGER;
BEGIN
    guardar_ventas(
        valor,
        18765,
        3462,
        13540
    );
    guardar_ventas(
        valor,
        18830,
        3462,
        10600
    );
    guardar_ventas(
        valor,
        19242,
        3462,
        9700
    );
    guardar_ventas(
        valor,
        18841,
        3593,
        11560
    );
    guardar_ventas(
        valor,
        18899,
        3593,
        2590
    );
    guardar_ventas(
        valor,
        19565,
        3593,
        8800
    );
END;
/

SELECT
    *
FROM
    ventas;
    
    
      --quiero saber el nombre del vendendor el monto de ventas

DECLARE
    CURSOR cur_ventas IS
        SELECT
            *
        FROM
            ventas;

    CURSOR cur_vendedor IS
        SELECT
            *
        FROM
            vendedor;

BEGIN
    FOR rec_ventas IN cur_ventas LOOP
        FOR rec_vendedor IN cur_vendedor LOOP
            IF
                rec_vendedor.numero_vendedor = rec_ventas.numero_vendedor
            THEN
                dbms_output.put_line(''
                 || rec_ventas.id_ventas
                 || '  '
                 || rec_vendedor.nombre_vendedor
                 || '  '
                 || rec_ventas.monto_venta);

            END IF;
        END LOOP;
    END LOOP;
END;
/

SET SERVEROUTPUT ON;

CREATE TABLE direccion (
    id          INTEGER PRIMARY KEY,
    numero      INTEGER,
    calle       VARCHAR2(60),
    cp          INTEGER,
    municipio   VARCHAR2(80)
);

CREATE SEQUENCE sec_direccion START WITH 1 INCREMENT BY 1 NOMAXVALUE;

CREATE OR REPLACE TRIGGER disp_direccion BEFORE
    INSERT ON direccion
    FOR EACH ROW
BEGIN
    SELECT
        sec_direccion.NEXTVAL
    INTO
        :new.id
    FROM
        dual;

END;
/

SELECT   * FROM  direccion;
select * from vendedor;

select * from direccion;
insert into direccion values(1,12,'13',12,'ecatepec');

