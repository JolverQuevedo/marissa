<!--#include file="../includes/Cnn.inc"-->
<%
Response.LCID = 1046 

ft=request.querystring("id")



cad = "update [dbo].[ordcom_cab] set estado='E' where id='"&ft&"'"
           
response.write(cad)
cnn.execute(cad)






%>