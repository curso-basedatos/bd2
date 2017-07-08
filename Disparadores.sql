set serveroutput on;

declare
 
 fecha varchar2(10);
 hora varchar(7);
 minutos varchar2(7);
 segundos varchar2(7);
 begin
 fecha:=to_char(sysdate);
 hora:=to_char(sysdate,'hh');
 minutos:=to_char(sysdate,'mi');
 segundos:=to_char(sysdate,'ss');
 dbms_output.put_line(hora);
 if hora='09' then
  dbms_output.put_line('son las nueve');
  else
   dbms_output.put_line('Pasan de las nueve');
  end if;
   dbms_output.put_line('minutos '||minutos);
    dbms_output.put_line('segundos '||segundos);
end;
/
