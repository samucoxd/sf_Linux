CREATE TABLE destinoEnvios (
    idDestino INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30),
    lugar VARCHAR(30)
)

insert into destinoEnvios(nombre,lugar) values('Pharmaceutical Business','CBBA');
insert into destinoEnvios(nombre,lugar) values('SanaMedic','LPZ');
insert into destinoEnvios(nombre,lugar) values('AZ MARKETING','TJA');
insert into destinoEnvios(nombre,lugar) values('FARMACEUTICO GYM','PTS');
insert into destinoEnvios(nombre,lugar) values('DISTRIBUIDORA TDD','BN');
insert into destinoEnvios(nombre,lugar) values('FORTEFAR','SCR');

drop table enviosAlmacen
CREATE TABLE enviosAlmacen (
    idNota INT,
    fecha DATE,
    hora TIME,
    idDestino INT,
    idFlota int,
    guia VARCHAR(30)
)
ALTER TABLE enviosAlmacen ADD FOREIGN KEY (idNota) REFERENCES controlpedido(idNota);
ALTER TABLE enviosAlmacen ADD FOREIGN KEY (idDestino) REFERENCES destinoEnvios(idDestino);
ALTER TABLE enviosAlmacen ADD FOREIGN KEY (idFlota) REFERENCES flota(idFlota);

create table flota(
idFlota int primary key auto_increment,
nombre varchar(30)
)
insert into flota(nombre) values('Flota Copacabana S.A.');
insert into flota(nombre) values('Flota San Lorenzo');
insert into flota(nombre) values('Flota Cosmos');
insert into flota(nombre) values('Flota Boqueron');


use sanfernandodb
drop procedure reporteFecha
CREATE PROCEDURE reporteFecha (IN fechaInicial date,IN fechaFinal date)
 SELECT controlpedido.idNota,fecha,noFac,noClie,cliente.nombreCliente as Cliente,noVende,piking,revision,embalaje,falla,fechaPreparacion,cobrador,fechaSalida,horaSalida FROM controlpedido
      LEFT JOIN pickingalmacen ON pickingalmacen.idNota=controlpedido.idNota
      LEFT JOIN despachoalmacen ON despachoalmacen.idNota=controlpedido.idNota
      LEFT JOIN cliente ON controlpedido.noClie = cliente.codCliente
      where fecha>=fechaInicial and fecha<=fechaFinal
UNION
SELECT controlpedido.idNota,fecha,noFac,noClie,cliente.nombreCliente as Cliente,noVende,piking,revision,embalaje,falla,fechaPreparacion,cobrador,fechaSalida,horaSalida FROM controlpedido
      RIGHT JOIN pickingalmacen ON pickingalmacen.idNota=controlpedido.idNota
      RIGHT JOIN despachoalmacen ON despachoalmacen.idNota=controlpedido.idNota
      LEFT JOIN cliente ON controlpedido.noClie = cliente.codCliente
      where fecha>=fechaInicial and fecha<=fechaFinal
      
      
drop procedure controlPendientes
create PROCEDURE controlPendientes(IN fechaConsulta date)
select controlpedido.idNota,fecha,noFac,noClie,cliente.nombreCliente as cliente,pickingalmacen.fechaPreparacion as preparacion,concat(despachoalmacen.fechaSalida,' ',despachoalmacen.horaSalida) as despacho,despachoalmacen.cobrador as cobrador from controlpedido 
    inner join cliente on controlpedido.noClie = cliente.codCliente 
    left join despachoalmacen on controlpedido.idNota = despachoalmacen.idNota
    left join pickingalmacen on controlpedido.idNota = pickingalmacen.idNota
    where controlpedido.fecha >= fechaConsulta
    use sanfernandodb
    
drop procedure reporteCod
create PROCEDURE reporteCod(IN cod int)
 SELECT controlpedido.idNota,fecha,noFac,noClie,cliente.nombreCliente as Cliente,noVende,piking,revision,embalaje,falla,fechaPreparacion,cobrador,fechaSalida,horaSalida FROM controlpedido
      LEFT JOIN pickingalmacen ON pickingalmacen.idNota=controlpedido.idNota
      LEFT JOIN despachoalmacen ON despachoalmacen.idNota=controlpedido.idNota
      LEFT JOIN cliente ON controlpedido.noClie = cliente.codCliente
      where controlpedido.idNota<=cod
UNION
SELECT controlpedido.idNota,fecha,noFac,noClie,cliente.nombreCliente as Cliente,noVende,piking,revision,embalaje,falla,fechaPreparacion,cobrador,fechaSalida,horaSalida FROM controlpedido
      RIGHT JOIN pickingalmacen ON pickingalmacen.idNota=controlpedido.idNota
      RIGHT JOIN despachoalmacen ON despachoalmacen.idNota=controlpedido.idNota
      LEFT JOIN cliente ON controlpedido.noClie = cliente.codCliente
    where controlpedido.idNota = cod    
call reporteCod(85951)
    
create table usuario(
idUsuario varchar(30) primary key auto_increment,
nombre varchar(30),
apellidos varchar(30),
cargo varchar(30),
nombreUsuario varchar(30),
pass varchar(40)
)