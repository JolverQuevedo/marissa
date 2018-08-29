<!--#include file="../includes/Cnn.inc"-->
<%
Response.LCID = 1046 
set rs = cnn.execute("select AC_CCODIGO,AC_CNOMBRE,AC_CDIRECC from rsconcar..cp0001maes where ac_cvanexo='p' and ac_ccodigo like '%"&request.queryString("filtro")&"%'")
Response.ContentType = "application/json"
Response.Write "{"&JSONData(rs, """data""")&"}"
%>