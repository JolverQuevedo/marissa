<!--#include file="../includes/Cnn.inc"-->
<% session.LCID = 2057 %>
<%

cad = "select * from rhin..ordcom_det where oc_id='"&request.querystring("id")&"'"



set rs = cnn.execute(cad)
Response.ContentType = "application/json"
Response.Write "{"&JSONData(rs, """data""")&"}"




%>