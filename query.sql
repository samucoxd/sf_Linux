delimiter ;;
create procedure buscarporcliente(
in valor varchar(50),
in limite int
)
begin
declare nom varchar(50);
declare id int;
declare limits int;
set nom = valor;
set limits = limite;
select idcliente into id from cliente where nombre like concat("%",nom,"%");

	select 
pedido.fecha as fecha,
pedido.idnota as nota,
pedido.idfac as factura,
cliente.nombre as cliente,
vendedor.nombre as vendedor,
preparacion.fecha as fechapreparacion,
preparacion.hora as horapreparacion,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.picking=personalalmacen.idpersonalalmacen
where preparacion.picking=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as preparador,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.revision=personalalmacen.idpersonalalmacen
where preparacion.revision=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as revisor,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.embalaje=personalalmacen.idpersonalalmacen
where preparacion.embalaje=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as embalador,
preparacion.fallo as fallo,
preparacion.estado as estadopreparacion,
despacho.fecha as fechadespacho,
despacho.hora as horadespacho,
despacho.estado as estadodespacho,
despachador.nombre as despachador,
envios.fecha as fechaenvio,
envios.hora as horaenvio,
envios.guia as guia,
transporte.nombre as transporte,
destino.nombre as destino,
destino.ciudad as ciudad
from pedido
left join cliente on pedido.cliente=cliente.idcliente
left join vendedor on pedido.vendedor=vendedor.idvendedor
left join preparacion on pedido.idnota=preparacion.idpedido
left join despacho on pedido.idnota=despacho.idpedido
left join despachador on despacho.iddespachador=despachador.iddespachador
left join envios on pedido.idnota=envios.idpedido
left join transporte on envios.transporte=transporte.idtransporte
left join destino on envios.destino=destino.iddestino
where pedido.cliente=id order by pedido.fecha desc limit limits;

end;;
delimiter ;



drop procedure buscarpornombre;

call buscarpornombre('farmacia 26 de febrero',3);


delimiter ;;
create procedure buscarporvendedor(
in valor varchar(50),
in limite int
)
begin
declare nom varchar(50);
declare id int;
declare limits int;
set nom = valor;
set limits = limite;
select idvendedor into id from vendedor where nombre like concat("%",nom,"%");

	select 
pedido.fecha as fecha,
pedido.idnota as nota,
pedido.idfac as factura,
cliente.nombre as cliente,
vendedor.nombre as vendedor,
preparacion.fecha as fechapreparacion,
preparacion.hora as horapreparacion,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.picking=personalalmacen.idpersonalalmacen
where preparacion.picking=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as preparador,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.revision=personalalmacen.idpersonalalmacen
where preparacion.revision=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as revisor,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.embalaje=personalalmacen.idpersonalalmacen
where preparacion.embalaje=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as embalador,
preparacion.fallo as fallo,
preparacion.estado as estadopreparacion,
despacho.fecha as fechadespacho,
despacho.hora as horadespacho,
despacho.estado as estadodespacho,
despachador.nombre as despachador,
envios.fecha as fechaenvio,
envios.hora as horaenvio,
envios.guia as guia,
transporte.nombre as transporte,
destino.nombre as destino,
destino.ciudad as ciudad
from pedido
left join cliente on pedido.cliente=cliente.idcliente
left join vendedor on pedido.vendedor=vendedor.idvendedor
left join preparacion on pedido.idnota=preparacion.idpedido
left join despacho on pedido.idnota=despacho.idpedido
left join despachador on despacho.iddespachador=despachador.iddespachador
left join envios on pedido.idnota=envios.idpedido
left join transporte on envios.transporte=transporte.idtransporte
left join destino on envios.destino=destino.iddestino
where pedido.vendedor=id order by pedido.fecha desc limit limits;

end;;
delimiter ;

call buscarporvendedor('marcela',2);

drop procedure buscarporvendedor;


delimiter ;;
create procedure buscarpornota(
in valor varchar(50),
in limite int
)
begin
declare nom varchar(50);
declare id int;
declare limits int;
set nom = valor;
set limits = limite;
select pedido.idnota into id from pedido where pedido.idnota like concat("%",nom,"%");

	select 
pedido.fecha as fecha,
pedido.idnota as nota,
pedido.idfac as factura,
cliente.nombre as cliente,
vendedor.nombre as vendedor,
preparacion.fecha as fechapreparacion,
preparacion.hora as horapreparacion,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.picking=personalalmacen.idpersonalalmacen
where preparacion.picking=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as preparador,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.revision=personalalmacen.idpersonalalmacen
where preparacion.revision=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as revisor,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.embalaje=personalalmacen.idpersonalalmacen
where preparacion.embalaje=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as embalador,
preparacion.fallo as fallo,
preparacion.estado as estadopreparacion,
despacho.fecha as fechadespacho,
despacho.hora as horadespacho,
despacho.estado as estadodespacho,
despachador.nombre as despachador,
envios.fecha as fechaenvio,
envios.hora as horaenvio,
envios.guia as guia,
transporte.nombre as transporte,
destino.nombre as destino,
destino.ciudad as ciudad
from pedido
left join cliente on pedido.cliente=cliente.idcliente
left join vendedor on pedido.vendedor=vendedor.idvendedor
left join preparacion on pedido.idnota=preparacion.idpedido
left join despacho on pedido.idnota=despacho.idpedido
left join despachador on despacho.iddespachador=despachador.iddespachador
left join envios on pedido.idnota=envios.idpedido
left join transporte on envios.transporte=transporte.idtransporte
left join destino on envios.destino=destino.iddestino
where pedido.idnota=id order by pedido.fecha desc limit limits;

end;;
delimiter ;

call buscarpornota(88363,1);



delimiter ;;
create procedure buscarporfactura(
in valor varchar(50),
in limite int
)
begin
declare nom varchar(50);
declare id int;
declare limits int;
set nom = valor;
set limits = limite;
select pedido.idfac into id from pedido where pedido.idfac like concat("%",nom,"%");

	select 
pedido.fecha as fecha,
pedido.idnota as nota,
pedido.idfac as factura,
cliente.nombre as cliente,
vendedor.nombre as vendedor,
preparacion.fecha as fechapreparacion,
preparacion.hora as horapreparacion,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.picking=personalalmacen.idpersonalalmacen
where preparacion.picking=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as preparador,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.revision=personalalmacen.idpersonalalmacen
where preparacion.revision=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as revisor,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.embalaje=personalalmacen.idpersonalalmacen
where preparacion.embalaje=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as embalador,
preparacion.fallo as fallo,
preparacion.estado as estadopreparacion,
despacho.fecha as fechadespacho,
despacho.hora as horadespacho,
despacho.estado as estadodespacho,
despachador.nombre as despachador,
envios.fecha as fechaenvio,
envios.hora as horaenvio,
envios.guia as guia,
transporte.nombre as transporte,
destino.nombre as destino,
destino.ciudad as ciudad
from pedido
left join cliente on pedido.cliente=cliente.idcliente
left join vendedor on pedido.vendedor=vendedor.idvendedor
left join preparacion on pedido.idnota=preparacion.idpedido
left join despacho on pedido.idnota=despacho.idpedido
left join despachador on despacho.iddespachador=despachador.iddespachador
left join envios on pedido.idnota=envios.idpedido
left join transporte on envios.transporte=transporte.idtransporte
left join destino on envios.destino=destino.iddestino
where pedido.idfac=id order by pedido.fecha desc limit limits;

end;;
delimiter ;


delimiter ;;
create procedure buscarporcobrador(
in valor varchar(50),
in limite int
)
begin
declare nom varchar(50);
declare id int;
declare limits int;
set nom = valor;
set limits = limite;
select despachador.iddespachador into id from despachador where despachador.nombre like concat("%",nom,"%");

	select 
pedido.fecha as fecha,
pedido.idnota as nota,
pedido.idfac as factura,
cliente.nombre as cliente,
vendedor.nombre as vendedor,
preparacion.fecha as fechapreparacion,
preparacion.hora as horapreparacion,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.picking=personalalmacen.idpersonalalmacen
where preparacion.picking=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as preparador,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.revision=personalalmacen.idpersonalalmacen
where preparacion.revision=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as revisor,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.embalaje=personalalmacen.idpersonalalmacen
where preparacion.embalaje=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as embalador,
preparacion.fallo as fallo,
preparacion.estado as estadopreparacion,
despacho.fecha as fechadespacho,
despacho.hora as horadespacho,
despacho.estado as estadodespacho,
despachador.nombre as despachador,
envios.fecha as fechaenvio,
envios.hora as horaenvio,
envios.guia as guia,
transporte.nombre as transporte,
destino.nombre as destino,
destino.ciudad as ciudad
from pedido
left join cliente on pedido.cliente=cliente.idcliente
left join vendedor on pedido.vendedor=vendedor.idvendedor
left join preparacion on pedido.idnota=preparacion.idpedido
left join despacho on pedido.idnota=despacho.idpedido
left join despachador on despacho.iddespachador=despachador.iddespachador
left join envios on pedido.idnota=envios.idpedido
left join transporte on envios.transporte=transporte.idtransporte
left join destino on envios.destino=destino.iddestino
where despachador.iddespachador=id order by pedido.fecha desc limit limits;

end;;
delimiter ;

call buscarporcobrador('marwin',5);