<!--#include file="../includes/Cnn.inc"-->
<%
Response.LCID = 1046 

ft=request.querystring("ft")
detalle=request.querystring("id")



cad = "update [dbo].[factura_det] set estado='E' where id_fact='"&ft&"' and id='"&detalle&"'"
           
response.write(cad)
cnn.execute(cad)






%>