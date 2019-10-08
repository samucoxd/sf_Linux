-- PROCEDIMIENTO PARA MOSTRAR UN RESUMEN DE LOS PEDIDOS PENDIENTE DE PREPARAR Y DESPACHAR

create procedure resumen_pedido(
fecha date
)
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha,cliente.nombre as Cliente,vendedor.nombre as Vendedor from pedido
inner join cliente on cliente.idcliente=pedido.cliente
inner join vendedor on vendedor.idvendedor=pedido.vendedor
inner join preparacion on preparacion.idpedido=pedido.idnota
inner join despacho on despacho.idpedido=pedido.idnota where pedido.fecha>=fecha and preparacion.estado='PENDIENTE' and despacho.estado='PENDIENTE';

drop procedure resumen_pedido;
call resumen_pedido ('2019-01-01');

-- PROCEDIEMIENTO PARA MOSTRAR LOS PEDIDOS PENDIENTE DE PREPARAR
create procedure pedido_preparacion_pendiente()
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha,cliente.nombre as Cliente,vendedor.nombre as Vendedor from pedido
inner join cliente on cliente.idcliente=pedido.cliente
inner join vendedor on vendedor.idvendedor=pedido.vendedor
inner join preparacion on preparacion.idpedido=pedido.idnota
inner join despacho on despacho.idpedido=pedido.idnota where preparacion.estado='PENDIENTE';

-- PROCEDIMIENTO PARA MOSTRAR UN LISTADO DEL PERSONAL EN ALMACEN CENTRAL
create procedure lista_personal_almacen()
select * from personalalmacen;

-- PROCEDIMIENTO PARA MOSTRAR LOS TIPOS DE FALLOS EN LA PREPARACION
create procedure lista_fallo()
select * from fallo;

-- PROCEDIMIENTO PARA REGISTRAR LA PREPARACION POR PEDIDO
create procedure registro_preparacion(
in fecha date,
in hora time,
in picking int,
in revision int,
in embalaje int,
in fallo int,
in idpedido int
)
update preparacion set 
fecha = fecha,
hora = hora,
picking = picking,
revision = revision,
embalaje = embalaje,
fallo = fallo,
estado = 'CERRADO'
where idpedido = idpedido;

drop procedure registro_preparacion
