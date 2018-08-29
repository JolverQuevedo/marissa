<!--#include file="../includes/Cnn.inc"-->
<%
Response.LCID = 1046 

cliente=request.querystring("cliente")
po=request.querystring("po")
estilo=request.querystring("estilo")
serie=request.querystring("serie")
numdoc=request.querystring("numdoc")
fecha=request.querystring("fecha")
numcheque=request.querystring("numcheque")
numletra=request.querystring("numletra")
tipo=request.querystring("tipo")
estado=request.querystring("estado")



cad = "INSERT INTO [dbo].[factura_cab]"&_
           "([cliente]"&_
           ",[po]"&_
           ",[estilo]"&_
           ",[serie]"&_
           ",[numdoc]"&_
           ",[fecha]"&_
           ",[numcheque]"&_
           ",[numletra]"&_
           ",[tipo]"&_
           ",[estado])"&_
     "VALUES"&_
           "('"&cliente&"',"&_
           "'"&po&"',"&_
           "'"&estilo&"',"&_
           "'"&serie&"',"&_
           "'"&numdoc&"',"&_
           "'"&fecha&"',"&_
           "'"&numcheque&"',"&_
           "'"&numletra&"',"&_
           "'"&tipo&"',"&_
           "'"&estado&"');"
response.write(cad)
cnn.execute(cad)




%>