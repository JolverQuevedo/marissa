<!--#include file="../includes/Cnn.inc"-->
<%
Response.LCID = 1046 

oc_id=request.querystring("oc_id")
po=request.querystring("po")
estilo=request.querystring("estilo")
nro_orden=request.querystring("nro_orden")
proveedor=request.querystring("proveedor")
cantidad=request.querystring("cantidad")
unidad=request.querystring("unidad")
corte=request.querystring("corte")
combo=request.querystring("combo")
descripcion=request.querystring("descripcion")
preciounit=request.querystring("preciounit")
subtotal=request.querystring("subtotal")
igv=request.querystring("igv")

cad = "INSERT INTO [dbo].[ordcom_det]"&_
           "([oc_id]"&_
           ",[po]"&_
           ",[estilo]"&_
           ",[nro_orden]"&_
           ",[proveedor]"&_
           ",[cantidad]"&_
           ",[unidad]"&_
           ",[corte]"&_
           ",[combo]"&_
           ",[descripcion]"&_
           ",[preciounit]"&_
           ",[subtotal]"&_
           ",[igv])"&_
     "VALUES"&_
           "('"&oc_id&"'"&_
           ",'"&po&"'"&_
           ",'"&estilo&"'"&_
           ",'"&nro_orden&"'"&_
           ",'"&proveedor&"'"&_
           ",'"&cantidad&"'"&_
           ",'"&unidad&"'"&_
           ",'"&corte&"'"&_
           ",'"&combo&"'"&_
           ",'"&descripcion&"'"&_
           ",'"&preciounit&"'"&_
           ",'"&subtotal&"'"&_
           ",'"&igv&"');"
           
response.write(cad)
cnn.execute(cad)




%>