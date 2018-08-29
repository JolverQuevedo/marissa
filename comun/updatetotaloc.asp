<!--#include file="../includes/Cnn.inc"-->
<%
    id = request.querystring("id")
    total = request.querystring("total")
    igv = request.querystring("igv")

    cad = "update ordcom_cab set total ="&total&", igv="&igv&" where id="&id&""
'response.write(cad)
cnn.execute(cad)
%>