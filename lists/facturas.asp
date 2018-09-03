<!--#include file="../includes/Cnn.inc"-->
<% session.LCID = 2057 %>
<% Response.CacheControl = "no-cache" %>
<%
cad = "select * from rhin..factura_cab where estado <> 'e' order by id desc"
if request.querystring("cliente") <> undefined and request.querystring("cliente") <> undefined or request.querystring("po") <> undefined and request.querystring("estilo") <> undefined  then
cad = "select * from rhin..factura_cab where ltrim(rtrim(cliente))='"&request.querystring("cliente")&"' and ltrim(rtrim(po))='"&request.querystring("po")&"' and ltrim(rtrim(estilo))='"&request.querystring("estilo")&"' order by id desc"
end if


'response.write(cad)

set rs = cnn.execute(cad)
Response.ContentType = "application/json"
Response.Write "{"&JSONData(rs, """data""")&"}"




%>