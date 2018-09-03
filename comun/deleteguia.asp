<!--#include file="../includes/Cnn.inc"-->
<%
Response.LCID = 1046 

prov=request.querystring("prov")
serie=request.querystring("serie")
numdoc=request.querystring("numdoc")



cad = "update rhin.dbo.guia set estado ='E' where proveedor='"&prov&"' and serie ='"&serie&"' and numdoc='"&numdoc&"'"
           
response.write(cad)
cnn.execute(cad)






%>