<!--#include file="../includes/Cnn.inc"-->
<% session.LCID = 2057 %>
<%

cad = "select presupuesto,cliente,po,estilo,serie,numdoc,proveedor,fecha_emision,fecha_traslado,nro_orden,corte,num_prendas,tip_servicio,estado from [rhin]..guia where estado='A'"

if request.querystring("cliente") <> undefined then
    cad = cad + "and cliente LIKE '%"&request.querystring("cliente")&"%'"
end if
if request.querystring("po") <> undefined then
        cad = cad + " and  po LIKE  '%"&request.querystring("po")&"%'"
end if
if request.querystring("estilo") <> undefined then
    cad = cad + " and estilo LIKE '%"&request.querystring("estilo")&"%'"

end if


set rs = cnn.execute(cad)

Response.ContentType = "application/json"
Response.Write "{"&JSONData(rs, """data""")&"}"




%>