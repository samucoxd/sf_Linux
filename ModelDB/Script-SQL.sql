-- PROCEDIMIENTO PARA REGISTRAR LOS PEDIDOS EN LA TABLA PEDIDOS
DELIMITER $$
create procedure registrar_pedido(
in idnota int,
in idfac int,
in fecha date,
in cliente int,
in vendedor int
)
BEGIN
	 DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
    SELECT errno AS MYSQL_ERROR;
    ROLLBACK;
    END;
    START TRANSACTION;
INSERT INTO pedido (idnota, idfac, fecha, cliente, vendedor)
        VALUES (idnota,idfac,fecha,cliente,vendedor);
COMMIT WORK;

END$$
DELIMITER ;




-- PROCEDIMIENTO PARA MOSTRAR UN RESUMEN DE LOS PEDIDOS PENDIENTE DE PREPARAR Y DESPACHAR

create procedure resumen_pedido(
fecha date
)
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha,cliente.nombre as Cliente,vendedor.nombre as Vendedor from pedido
inner join cliente on cliente.idcliente=pedido.cliente
inner join vendedor on vendedor.idvendedor=pedido.vendedor
inner join preparacion on preparacion.idpedido=pedido.idnota
inner join despacho on despacho.idpedido=pedido.idnota where pedido.fecha>=fecha and preparacion.estado='ABIERTO' and despacho.estado='ABIERTO';

drop procedure resumen_pedido;
call resumen_pedido ('2019-01-01');

-----------------------------------------------------------------------------------------------------

-- PROCEDIEMIENTO PARA MOSTRAR LOS PEDIDOS PENDIENTE DE PREPARAR
create procedure pedido_preparacion_pendiente()
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha from pedido
inner join preparacion on preparacion.idpedido=pedido.idnota where preparacion.estado='ABIERTO' and preparacion.idpedido>0;

drop procedure pedido_preparacion_pendiente;

-- PROCEDIMIENTO PARA MOSTRAR UN LISTADO DEL PERSONAL EN ALMACEN CENTRAL
create procedure lista_personal_almacen()
select * from personalalmacen;

-- PROCEDIMIENTO PARA MOSTRAR LOS TIPOS DE FALLOS EN LA PREPARACION
create procedure lista_fallo()
select * from fallo;

-- PROCEDIMIENTO PARA REGISTRAR LA PREPARACION POR PEDIDO
DELIMITER $$
create procedure registro_preparacion(
in fecha date,
in hora time,
in picking int,
in revision int,
in embalaje int,
in fallo int,
in id int
)
BEGIN
	 DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
    SELECT errno AS MYSQL_ERROR;
    ROLLBACK;
    END;

    START TRANSACTION;
update preparacion set 
fecha = fecha,
hora = hora,
picking = picking,
revision = revision,
embalaje = embalaje,
fallo = fallo,
estado = 'CERRADO'
where idpedido = id;
COMMIT WORK;

END$$
DELIMITER ;

drop procedure registro_preparacion;
-------------------------------------------------------------------------------------------------------------

-- PROCEDIEMIENTO PARA MOSTRAR LOS PEDIDOS PENDIENTE DE DESPACHO
create procedure pedido_despacho_pendiente()
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha from pedido
inner join despacho on despacho.idpedido=pedido.idnota where despacho.estado='ABIERTO' and despacho.idpedido>0;

-- PROCEDIMIENTO PARA MOSTRAR UN LISTADO DEL PERSONAL EN ALMACEN CENTRAL
create procedure lista_personal_despacho()
select * from despachador;

-- PROCEDIMIENTO PARA REGISTRAR EL DESPACHO POR PEDIDO
DELIMITER $$
create procedure registro_despacho(
in fecha date,
in hora time,
in despachador int,
in id int
)
BEGIN
	 DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
    SELECT errno AS MYSQL_ERROR;
    ROLLBACK;
    END;

    START TRANSACTION;
update despacho set 
fecha = fecha,
hora = hora,
iddespachador = despachador,
estado = 'CERRADO'
where idpedido = id;
COMMIT WORK;

END$$
DELIMITER ;

drop procedure registro_despacho;

