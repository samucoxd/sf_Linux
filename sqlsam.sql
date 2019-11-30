call registrar_pedido(88363,835,'2019/10/21',3062,53);

create procedure despachoxid(
in nronota int
)
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha,despacho.estado from pedido
inner join despacho on despacho.idpedido=pedido.idnota where despacho.idpedido=nronota;

call despachoxid(88695);

drop procedure row;

create procedure preparacionxid(
in nronota int
)
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha,preparacion.estado from pedido
inner join preparacion on preparacion.idpedido=pedido.idnota where preparacion.idpedido=nronota;

drop procedure preparacionxid;

create procedure resumenrapido(
in nronota int
)
select 
pedido.idnota as nota,
pedido.idfac as factura,
pedido.fecha as fecha,
cliente.nombre as cliente,
vendedor.nombre as vendedor,
despachador.nombre as despachador,
despacho.fecha as fechadespacho
 from pedido
left join preparacion on preparacion.idpedido=pedido.idnota
left join cliente on cliente.idcliente=pedido.cliente
left join vendedor on vendedor.idvendedor=pedido.vendedor
left join despacho on pedido.idnota=despacho.idpedido
left join despachador on despacho.iddespachador=despachador.iddespachador
where pedido.idnota=nronota or pedido.idfac=nronota limit 1;


drop procedure resumenrapido;
call resumenrapido(88363);


create procedure resumendetallado(
in nronota int
)
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
where preparacion.picking=personalalmacen.idpersonalalmacen and preparacion.idpedido=nronota limit 1) as preparador,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.revision=personalalmacen.idpersonalalmacen
where preparacion.revision=personalalmacen.idpersonalalmacen and preparacion.idpedido=nronota limit 1) as revisor,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.embalaje=personalalmacen.idpersonalalmacen
where preparacion.embalaje=personalalmacen.idpersonalalmacen and preparacion.idpedido=nronota limit 1) as embalador,
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
where pedido.idnota=nronota or pedido.idfac=nronota limit 1;

drop procedure resumendetallado;
call resumendetallado(88363);



create procedure busquedaid(
in busqueda varchar(50)
)
select pedido.idnota from pedido
left join cliente on pedido.idnota=cliente.idpedido
left join vendedor on pedido.idnota=vendedor.idpedido
where match(pedido.idnota,pedido.idfac,cliente.nombre,vendedor.nombre) against(busqueda);

call busquedaid('beniana');
drop procedure busquedaid;

create procedure busquedaid(
in busqueda varchar(50)
)
CREATE TEMPORARY TABLE tempbusqueda
SELECT 
pedido.fecha as fecha,
pedido.idnota as nota,
pedido.idfac as factura,
cliente.nombre as cliente,
vendedor.nombre as vendedor,
preparacion.fecha as fechapreparacion,
preparacion.hora as horapreparacion,
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
FROM pedido
left join cliente on pedido.cliente=cliente.idcliente
left join vendedor on pedido.vendedor=vendedor.idvendedor
left join preparacion on pedido.idnota=preparacion.idpedido
left join despacho on pedido.idnota=despacho.idpedido
left join despachador on despacho.iddespachador=despachador.iddespachador
left join envios on pedido.idnota=envios.idpedido
left join transporte on envios.transporte=transporte.idtransporte
left join destino on envios.destino=destino.iddestino
where match(nota,factura,cliente,vendedor) against(busqueda);

drop procedure busquedaid;
call busquedaid('beniana');


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


create procedure countpreparacion()
select count(*) total from pedido
left join preparacion on pedido.idnota=preparacion.idpedido where preparacion.estado="ABIERTO";

drop procedure countpreparacion;


create procedure countdespacho()
select count(*) total from pedido
left join despacho on pedido.idnota=despacho.idpedido where despacho.estado="ABIERTO";



CREATE PROCEDURE pendientepreparacion()
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha,cliente.nombre as Cliente,vendedor.nombre as Vendedor from pedido
inner join cliente on cliente.idcliente=pedido.cliente
inner join vendedor on vendedor.idvendedor=pedido.vendedor
inner join preparacion on preparacion.idpedido=pedido.idnota
inner join despacho on despacho.idpedido=pedido.idnota where preparacion.estado='ABIERTO';


CREATE PROCEDURE pendientedespacho()
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha,cliente.nombre as Cliente,vendedor.nombre as Vendedor from pedido
inner join cliente on cliente.idcliente=pedido.cliente
inner join vendedor on vendedor.idvendedor=pedido.vendedor
inner join preparacion on preparacion.idpedido=pedido.idnota
inner join despacho on despacho.idpedido=pedido.idnota where despacho.estado='ABIERTO';

create procedure buscar_despacho_x_nota(
in nota int
)
select idnota from pedido where idnota=nota;

delimiter ;;
create procedure registrar_nulo(
in _nota int,
in _motivo varchar(45),
in _obs varchar(45)
)
begin
	insert into nulos(idpedido,motivo,obs) values(_nota,_motivo,_obs);
    update preparacion set estado = "CERRADO" where idpedido=_nota;
    update despacho set estado = "CERRADO" where idpedido=_nota;
end;;
delimiter ;

drop procedure registrar_nulo;

call registrar_nulo(88467,"efacturacion","verificacion.");

create procedure cantidadError()
select fallo.nombre,count(fallo) as cantidad from preparacion
inner join fallo on preparacion.fallo=fallo.idfallo
 group by fallo;

call cantidadError();

select personalalmacen.nombre,fallo.nombre, count(fallo) from preparacion
inner join fallo on preparacion.fallo=fallo.idfallo
inner join personalalmacen on preparacion.picking=personalalmacen.idpersonalalmacen
 group by fallo.nombre;
