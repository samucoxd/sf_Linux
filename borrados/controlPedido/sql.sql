CREATE TABLE controlPedido(
    idPEdido int PRIMARY KEY AUTO_INCREMENT,
    idNota int UNIQUE,
    fecha date,
    noFac int,
    noClie int,
    cliente varchar(50),
    noVende int,
    vendedor varchar(50),
    preparacion char(1) DEFAULT 'N',
    despacho char(1) DEFAULT 'N'
)

CREATE TABLE pickingAlmacen(
    idPicking int PRIMARY KEY AUTO_INCREMENT,
    idNota int,
    piking varchar(30),
    revision varchar(30),
    embalaje varchar(30),
    falla varchar(30),
    fechaPreparacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_Datos_pedido FOREIGN KEY (idNota) REFERENCES controlPedido(idNota)
)

CREATE table despachoAlmacen(
    idDespacho int PRIMARY KEY AUTO_INCREMENT,
    idNota int,
    cobrador varchar(30),
    fechaSalida date,
    horaSalida time,
    CONSTRAINT fk_idDespacho FOREIGN KEY(idNota) references controlPedido(idNota)
)

CREATE TABLE cliente(
    codCliente int primary key AUTO_INCREMENT,
    nombreCliente varchar(50),
    zona varchar(50)
)

CREATE TABLE 


create PROCEDURE controlPendientes()
    SELECT fecha,idNota,noFac,noClie,preparacion,despacho from controlPedido where preparacion='N' or despacho='N'

CREATE PROCEDURE zonaPorCliente (IN cod int)
    select zona from cliente where codCliente=@clienteS




create procedure listaPedidoPicking()
    select idNota,fecha from controlpedido WHERE preparacion='N'


delimiter $
CREATE PROCEDURE insertarPicking (IN idNot int(11),IN piking varchar(30),IN revicion varchar(30),IN embalaje varchar(30),IN falla varchar(30))
begin
    insert into pickingAlmacen (idNota,piking,revision,embalaje,falla,fechaPreparacion) values (idNot,piking,revicion,embalaje,falla,null);
    UPDATE controlpedido set preparacion='S' where idNota=idNot; 
end $

CREATE PROCEDURE listarPickingActivo()
    select idNota from controlPedido WHERE preparacion='S' and despacho='N'


CREATE PROCEDURE reporteFecha (IN fechaInicial date,IN fechaFinal date)
SELECT controlpedido.idNota,fecha,noFac,noClie,cliente,noVende,Vendedor,piking,revision,embalaje,falla,fechaPreparacion,cobrador,fechaSalida,horaSalida FROM controlpedido
      LEFT JOIN pickingalmacen ON pickingalmacen.idNota=controlpedido.idNota
      LEFT JOIN despachoalmacen ON despachoalmacen.idNota=controlpedido.idNota
      where fecha>=fechaInicial and fecha<=fechaFinal
UNION
SELECT controlpedido.idNota,fecha,noFac,noClie,cliente,noVende,Vendedor,piking,revision,embalaje,falla,fechaPreparacion,cobrador,fechaSalida,horaSalida FROM controlpedido
      RIGHT JOIN pickingalmacen ON pickingalmacen.idNota=controlpedido.idNota
      RIGHT JOIN despachoalmacen ON despachoalmacen.idNota=controlpedido.idNota
      where fecha>=fechaInicial and fecha<=fechaFinal

CREATE PROCEDURE reporteCod (IN cod int)
SELECT controlpedido.idNota,fecha,noFac,noClie,cliente,noVende,Vendedor,piking,revision,embalaje,falla,fechaPreparacion,cobrador,fechaSalida,horaSalida FROM controlpedido
      LEFT JOIN pickingalmacen ON pickingalmacen.idNota=controlpedido.idNota
      LEFT JOIN despachoalmacen ON despachoalmacen.idNota=controlpedido.idNota
      where idNota=cod
UNION
SELECT controlpedido.idNota,fecha,noFac,noClie,cliente,noVende,Vendedor,piking,revision,embalaje,falla,fechaPreparacion,cobrador,fechaSalida,horaSalida FROM controlpedido
      RIGHT JOIN pickingalmacen ON pickingalmacen.idNota=controlpedido.idNota
      RIGHT JOIN despachoalmacen ON despachoalmacen.idNota=controlpedido.idNota
      where idNota=cod

CREATE PROCEDURE verificarNotaRepetida (IN nota int)
SELECT idNota from controlpedido where idNota=nota