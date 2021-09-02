create or replace function tg_aviso_factura() returns trigger
as
$tg_aviso_factura$
declare 
plan int;
begin 
select cod_plan into plan from contrato where contrato.cod_contrato=new.cod_contrato;
if(plan=1)then
raise notice 'Wion Gold esta con un descuento del 10 porciento, disfrutalo';
end if;
end;
$tg_aviso_factura$
languaje plpgsql;
 create trigger tg_validarplan before insert on factura for each row
 execute procedure tg_aviso_factura();