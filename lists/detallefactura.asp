<!--#include file="../includes/Cnn.inc"-->

<%

cad = "select id,id_fact,descripcion,cantidad,preciounit,subtotal,igv from rhin..factura_det where id_fact='"&request.querystring("id")&"' and  estado='A'"



set rs = cnn.execute(cad)
Response.ContentType = "application/json"
Response.Write "{"&JSONData(rs, """data""")&"}"




%>