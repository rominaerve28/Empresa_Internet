do $$
declare
        registro record;
		año cursor for select
		factura.cod_factura as Codigo,
		factura.monto_final as Total,
		factura.fecha_fac as Fecha,
		cliente.nombre_cli as Cliente,
		plan.nombre_plan as Plan,
		vendedor.nombre_ven as Vendedor,
		contrato.cos_instalaci as Costo
		from factura
		INNER JOIN public.contrato on contrato.cod_contrato=factura.cod_contrato
		INNER JOIN public.cliente on cliente.cod_cli=contrato.cod_cli
		INNER JOIN public.plan on plan.cod_plan=contrato.cod_plan
		INNER JOIN public.vendedor on vendedor.cod_vendedor=contrato.cod_vendedor
	
		where factura.fecha_fac between '2020-01-01' and '2020-12-31';
		begin
		for registro in año loop
		raise notice 'factura: %, fecha: % Cliente:%  Vendedor:% Plan:% costoinstalacion:%  Total:%',
		registro.Codigo,registro.Fecha,registro.Cliente,registro.Vendedor,registro.Plan,registro.Costo,registro.Total;
		end loop;
		end $$
		language 'plpgsql'