
<!--#include file="../includes/Cnn.inc"-->
<% session.LCID = 2057 %>
<%
cad ="select * from multi..usuarios where usuario='"&request.querystring("usuario")&"' and clave ='"&request.querystring("clave")&"'"

set rs = cnn.execute(cad)

Response.ContentType = "application/json"
Response.Write "{"&JSONData(rs, """data""")&"}"




%>