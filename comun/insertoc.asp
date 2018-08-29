<!--#include file="../includes/Cnn.inc"-->
<%
Response.LCID = 1046 

cliente=request.querystring("cliente")
po=request.querystring("po")
estilo=request.querystring("estilo")
nro_orden=request.querystring("nro_orden")
proveedor=request.querystring("proveedor")
presupuesto=request.querystring("presupuesto")
total=request.querystring("total")


cad = "INSERT INTO [dbo].[ordcom_cab]"&_
           "([cliente]"&_
           ",[po]"&_
           ",[estilo]"&_
           ",[nro_orden]"&_
           ",[proveedor]"&_
           ",[presupuesto]"&_
           ",[total])"&_
     "VALUES"&_
           "('"+cliente+"'"&_
           ",'"+po+"'"&_
           ",'"+estilo+"'"&_
           ",'"+nro_orden+"'"&_
           ",'"+proveedor+"'"&_
           ",'"+presupuesto+"'"&_
           ",'"+total+"');"
response.write(cad)
cnn.execute(cad)




%>