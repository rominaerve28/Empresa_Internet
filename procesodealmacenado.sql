create or replace function obtener_total_plane1(
						out total_planes integer)
						as $BODY$
						begin
						select count(contrato.cod_contrato) into total_planes
						from contrato
						INNER JOIN public.plan on plan.cod_plan=contrato.cod_plan
						where nombre_plan='Wion Gold';
						end
						$BODY$
						language plpgsql