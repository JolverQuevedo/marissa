<!--#include file="../includes/Cnn.inc"-->
<%
Response.LCID = 1046 

presupuesto=request.querystring("presupuesto")
cliente=request.querystring("cliente")
po=request.querystring("po")
estilo=request.querystring("estilo")
serie =request.querystring("serie ")
numdoc=request.querystring("numdoc")
proveedor=request.querystring("proveedor")
fecha_emision=request.querystring("fecha_emision")
fecha_traslado=request.querystring("fecha_traslado")
nro_orde=request.querystring("nro_orde")
corte=request.querystring("corte")
num_prendas=request.querystring("num_prendas")
tip_servicio=request.querystring("tip_servicio")



cad = "INSERT INTO [dbo].[guia]  "&_
           "([presupuesto] "&_
           ",[cliente] "&_
           ",[po] "&_
           ",[estilo] "&_
           ",[serie] "&_
           ",[numdoc] "&_
           ",[proveedor] "&_
           ",[fecha_emision] "&_
           ",[fecha_traslado] "&_
           ",[nro_orden] "&_
           ",[corte] "&_
           ",[num_prendas] "&_
           ",[tip_servicio]) "&_
     "VALUES "&_
           "('"&presupuesto&"',"&_
           "'"&cliente&"',"&_
           "'"&po&"',"&_
           "'"&estilo&"',"&_
           "'"&serie &"',"&_
           "'"&numdoc&"',"&_
           "'"&proveedor&"',"&_
           "'"&fecha_emision&"',"&_
           "'"&fecha_traslado&"',"&_
           "'"&nro_orde&"',"&_
           "'"&corte&"',"&_
           "'"&num_prendas&"',"&_
           "'"&tip_servicio&"')"&_
";"
response.write(cad)
cnn.execute(cad)




%>