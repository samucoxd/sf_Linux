delimiter $
CREATE PROCEDURE insertarDespacho (IN idNot int(11),IN cobrador varchar(30),IN fecha date,IN hora time)
begin
    insert into despachoalmacen (idNota,cobrador,fechaSalida,horaSalida) values (idNot,cobrador,fecha,hora);
    UPDATE controlpedido set despacho='S' where idNota=idNot; 
end $

DROP PROCEDURE listarPickingActivo

  CREATE PROCEDURE listarPickingActivo()
    select idNota from controlPedido WHERE preparacion='S' and despacho='N'

DROP PROCEDURE controlPendientes

create PROCEDURE controlPendientes()
    SELECT fecha,idNota,noFac,noClie,preparacion,despacho from controlPedido where preparacion='N' or despacho='N'

SELECT controlpedido.idNota,fecha,noFac,noClie,cliente,noVende,Vendedor,piking,revision,embalaje,falla,fechaPreparacion,cobrador,fechaSalida,horaSalida FROM controlpedido
      LEFT JOIN pickingalmacen ON pickingalmacen.idNota=controlpedido.idNota
      LEFT JOIN despachoalmacen ON despachoalmacen.idNota=controlpedido.idNota
UNION
SELECT controlpedido.idNota,fecha,noFac,noClie,cliente,noVende,Vendedor,piking,revision,embalaje,falla,fechaPreparacion,cobrador,fechaSalida,horaSalida FROM controlpedido
      RIGHT JOIN pickingalmacen ON pickingalmacen.idNota=controlpedido.idNota
      RIGHT JOIN despachoalmacen ON despachoalmacen.idNota=controlpedido.idNota


CREATE PROCEDURE reporteFecha (IN fechaInicial date,IN fechaFinal date)
SELECT controlpedido.idNota,fecha,noFac,noClie,cliente,noVende,Vendedor,piking,revision,embalaje,falla,fechaPreparacion,cobrador,fechaSalida,horaSalida FROM controlpedido
      LEFT JOIN pickingalmacen ON pickingalmacen.idNota=controlpedido.idNota
      LEFT JOIN despachoalmacen ON despachoalmacen.idNota=controlpedido.idNota
      where controlpedido.fecha>='2019/07/12' and controlpedido.fecha<='2019/07/12'
UNION
SELECT controlpedido.idNota,fecha,noFac,noClie,cliente,noVende,Vendedor,piking,revision,embalaje,falla,fechaPreparacion,cobrador,fechaSalida,horaSalida FROM controlpedido
      RIGHT JOIN pickingalmacen ON pickingalmacen.idNota=controlpedido.idNota
      RIGHT JOIN despachoalmacen ON despachoalmacen.idNota=controlpedido.idNota
      where controlpedido.fecha>='2019/07/12' and controlpedido.fecha<='2019/07/12'

  DROP PROCEDURE reporteCod
call reporteFecha('2019/07/12','2019/07/12')

  CREATE PROCEDURE reporteCod (IN cod int)
SELECT controlpedido.idNota,fecha,noFac,noClie,cliente,noVende,Vendedor,piking,revision,embalaje,falla,fechaPreparacion,cobrador,fechaSalida,horaSalida FROM controlpedido
      LEFT JOIN pickingalmacen ON pickingalmacen.idNota=controlpedido.idNota
      LEFT JOIN despachoalmacen ON despachoalmacen.idNota=controlpedido.idNota
      where controlpedido.idNota=cod
UNION
SELECT controlpedido.idNota,fecha,noFac,noClie,cliente,noVende,Vendedor,piking,revision,embalaje,falla,fechaPreparacion,cobrador,fechaSalida,horaSalida FROM controlpedido
      RIGHT JOIN pickingalmacen ON pickingalmacen.idNota=controlpedido.idNota
      RIGHT JOIN despachoalmacen ON despachoalmacen.idNota=controlpedido.idNota
      where controlpedido.idNota=cod
  CALL reporteCod('84785')