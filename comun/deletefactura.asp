<!--#include file="../includes/Cnn.inc"-->
<%
Response.LCID = 1046 

ft=request.querystring("ft")



cad = "update [dbo].[factura_cab] set estado='E' where id='"&ft&"'"
           
response.write(cad)
cnn.execute(cad)






%>