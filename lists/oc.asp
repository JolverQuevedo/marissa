<!--#include file="../includes/Cnn.inc"-->
<% session.LCID = 2057 %>
<%

cad = "select * from rhin..ordcom_cab"



set rs = cnn.execute(cad)
Response.ContentType = "application/json"

Response.Write "{"&JSONData(rs, """data""")&"}"




%>