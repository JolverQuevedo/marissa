<!--#include file="../includes/Cnn.inc"-->
<% session.LCID = 2057 %>
<%


cad = "select [id],[cliente],[po],[estilo],[nro_orden],[proveedor],[presupuesto],[total],[igv] from rhin..ordcom_cab where estado='A'"
if request.querystring("cliente") <> undefined and request.querystring("cliente") <> undefined or request.querystring("po") <> undefined and request.querystring("estilo") <> undefined  then
cad = "select * from rhin..ordcom_cab where ltrim(rtrim(cliente))='"&request.querystring("cliente")&"' and ltrim(rtrim(po))='"&request.querystring("po")&"' and ltrim(rtrim(estilo))='"&request.querystring("estilo")&"' and estado='A' order by id desc"
end if


set rs = cnn.execute(cad)
Response.ContentType = "application/json"

Response.Write "{"&JSONData(rs, """data""")&"}"




%>