<!--#include file="../includes/Cnn.inc"-->
<%
Response.LCID = 1046 

cad = "select * from rhin..factura_cab order by id desc"



set rs = cnn.execute(cad)
Response.ContentType = "application/json"
Response.Write "{"&JSONData(rs, """data""")&"}"




%>