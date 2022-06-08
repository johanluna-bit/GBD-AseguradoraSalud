Consulta 1: Mostrar un historial de ventas por tipo de contrato por año.

select poliza.plan, extract (year from contrato.fecha_contrato), 
count(contrato.id_cliente) from contrato
inner join poliza on poliza.id_contrato = contrato.id_contrato
group by poliza.plan, extract (year from contrato.fecha_contrato) 

/////////////////////////////////////////////////////////////////////////////
Consulta 2:Mostrar el Historial de retiros de clientes por año

select estado, extract (year from fecha_contrato), count (id_cliente) from contrato
where estado = 'Retirado'
group by estado, fecha_contrato;

//////////////////////////////////////////////////////////////////////////////
Consulta 3:Mostrar cuantas personas se atendieron por especialidad y por año.

select especialidad.tipo_especialidad, extract (year from atencion.fecha_atencion), count(atencion.id_atencion) from especialidad
inner join atencion on atencion.id_atencion = especialidad.id_atencion
inner join clinica on atencion.id_clinica = clinica.id_clinica
group by especialidad.tipo_especialidad, extract (year from atencion.fecha_atencion);

////////////////////////////////////////////////////////////////////////////////
Consulta 4:Mostrar el historial de servicio vendidos totales por la empresa por año

select servicio.tipo_servicio, extract(year from factura.fecha_factura), sum(detalle.precio_detalle) from servicio
inner join detalle on detalle.id_servicio = servicio.id_servicio
inner join factura on factura.id_factura = detalle.id_factura
group by servicio.tipo_servicio, extract (year from factura.fecha_factura);