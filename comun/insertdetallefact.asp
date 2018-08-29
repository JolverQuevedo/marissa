<!--#include file="../includes/Cnn.inc"-->
<%
Response.LCID = 1046 

id_fact=request.querystring("id_fact")
descripcion=request.querystring("descripcion")
cantidad=request.querystring("cantidad")
preciounit=request.querystring("preciounit")
subtotat=request.querystring("subtotat")
igv=request.querystring("igv")



cad = "INSERT INTO [dbo].[factura_det]"&_
           "([id_fact]"&_
           ",[descripcion]"&_
           ",[cantidad]"&_
           ",[preciounit]"&_
           ",[subtotal]"&_
           ",[igv])"&_
     "VALUES"&_
           "('"&id_fact&"'"&_
           ",'"&descripcion&"'"&_
           ",'"&cantidad&"'"&_
           ",'"&preciounit&"'"&_
           ",'"&subtotat&"'"&_
           ",'"&igv&"')"
           
response.write(cad)
cnn.execute(cad)




%>