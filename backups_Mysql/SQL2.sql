CREATE TABLE controlPedido(
    idPEdido int PRIMARY KEY AUTO_INCREMENT,
    idNota int,
    fecha date,
    noFac int,
    noClie int,
    noVende int,
    preparacion char(1) DEFAULT 'N',
    despacho char(1) DEFAULT 'N',
    nulo char(1) DEFAULT 'N'
)
  ALTER TABLE controlPedido
ADD CONSTRAINT Unique_controlPedido
UNIQUE (idNota, noFac, noClie, noVende) 
ALTER TABLE controlPedido ADD FOREIGN KEY (noClie) REFERENCES cliente(codCliente)

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
    idNota int PRIMARY KEY,
    cobrador varchar(30),
    fechaSalida date,
    horaSalida time,
    CONSTRAINT fk_idDespacho FOREIGN KEY(idNota) references controlPedido(idNota)
)

CREATE TABLE nulos(
idNulos int PRIMARY KEY AUTO_INCREMENT,
idNota int,
fechaNulo TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
motivo varchar(50),
obs varchar(100),
CONSTRAINT fk_idNulo FOREIGN KEY(idNota) references controlPedido(idNota)
)

create table cliente(
codCliente int primary key,
nombreCliente varchar(100),
CONSTRAINT fk_idCliente FOREIGN KEY(codCliente) references controlPedido(noClie)
)
ALTER TABLE cliente ADD CONSTRAINT Unique_cliente UNIQUE (codCliente,nombreCliente) 

create PROCEDURE controlPendientes(IN fechaConsulta date)
select controlpedido.idNota,fecha,noFac,noClie,cliente.nombreCliente as cliente,preparacion,concat(despachoalmacen.fechaSalida,' ',despachoalmacen.horaSalida) as despacho from controlpedido 
    inner join cliente on controlpedido.noClie = cliente.codCliente 
    left join despachoalmacen on controlpedido.idNota = despachoalmacen.idNota
    where controlpedido.fecha >= fechaConsulta


create procedure listaPedidoPicking()
   select idNota,fecha,noFac from controlpedido WHERE preparacion='N'

delimiter $
CREATE PROCEDURE insertarPicking (IN idNot int(11),IN piking varchar(30),IN revicion varchar(30),IN embalaje varchar(30),IN falla varchar(30))
begin
    insert into pickingAlmacen (idNota,piking,revision,embalaje,falla,fechaPreparacion) values (idNot,piking,revicion,embalaje,falla,null);
    UPDATE controlpedido set preparacion='S' where idNota=idNot; 
end $

CREATE PROCEDURE listarPickingActivo()
   select idNota,noFac from controlPedido WHERE preparacion='S' and despacho='N'
    
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


DROP PROCEDURE verificarNotaRepetida
CREATE PROCEDURE verificarNotaRepetida (IN nota int,IN fac int)
    SELECT idNota,noFac from controlpedido where idNota=nota AND noFac=fac   


CREATE PROCEDURE insertarNulo(IN idNot int,IN motivo varchar(50),IN obs varchar(100))
insert into nulos (idNota,fechaNulo,motivo,obs) values (idNot,null,motivo,obs);


delimiter $
CREATE PROCEDURE insertarNulo (IN idNot int,IN motivo varchar(50),IN obs varchar(100))
begin
    insert into nulos (idNota,fechaNulo,motivo,obs) values (idNot,null,motivo,obs);
    UPDATE controlpedido set nulo='S' where idNota=idNot; 
end $

drop PROCEDURE insertarCliente
CREATE PROCEDURE insertarCliente(IN codCliente int,IN nombreCliente varchar(100))
insert into cliente (codCliente,nombreCliente) values (codCliente,nombreCliente);

select * from cliente

drop PROCEDURE controlPendientes2

DELIMITER $$
create PROCEDURE controlPendientes2(IN fechaBusqueda date)
BEGIN
    CREATE TEMPORARY TABLE tempTable1(
        idPEdido int PRIMARY KEY AUTO_INCREMENT,
        idNota int,
        fecha date,
        noFac int,
        noClie int,
        cliente varchar(50),
        preparacion varchar(50),
        despacho varchar(50),
        nulo varchar(50)
        )ENGINE=MEMORY;
    INSERT into tempTable1(idNota,fecha,noFac,noClie,cliente,preparacion,despacho,nulo) select idNota,fecha,noFac,noClie,cliente,preparacion,despacho,nulo from controlpedido where fecha >= fechaBusqueda;

    select * from tempTable1;
END$$
DELIMITER ;    

call controlPendientes2 ('01/08/2019')

    --->Temporary table creation from select query
    CREATE TEMPORARY TABLE tempTable1
    SELECT ColumnName1,ColumnName2,... FROM table1;
    declare aux int;
    set aux=0;
    declare n int;
    set n=count(idNota) from controlpedido where fecha>=fechaBusqueda;
    WHILE   aux <= n
    
    end while;
   SELECT fecha,idNota,noFac,noClie,cliente,preparacion,despacho from controlPedido where fecha>=fechaBusqueda

create PROCEDURE insertarDespacho(in idNota int,in cobrador varchar(30),in fechaSalida date,in horaSalida time)
insert into despachoalmacen(idNota.cobrador,fechaSalida,horaSalida)
values(idNota,cobrador,fechaSalida,horaSalida)



delimiter $
create PROCEDURE insertarDespacho(IN idNot int,in cobrador varchar(30),IN fechaSalida date,IN horaSalida time)
BEGIN
insert into despachoalmacen(idNota,cobrador,fechaSalida,horaSalida) values(idNot,cobrador,fechaSalida,horaSalida);
update controlpedido set despacho='S' where idNota=idNot;
END $