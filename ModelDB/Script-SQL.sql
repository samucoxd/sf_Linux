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