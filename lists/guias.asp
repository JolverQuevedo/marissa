<!--#include file="../includes/Cnn.inc"-->
<% session.LCID = 2057 %>
<%

cad = "select * from [rhin]..guia "
if request.querystring("cliente") <> undefined or request.querystring("po") <> undefined or request.querystring("estilo") <> undefined then
    cad =cad+"where"
end if
if request.querystring("cliente") <> undefined then
    cad = cad + " cliente LIKE '%"&request.querystring("cliente")&"%'"

    
end if
if request.querystring("po") <> undefined then
        cad = cad + " and  po LIKE  '%"&request.querystring("po")&"%'"

        
    end if
if request.querystring("estilo") <> undefined then
    cad = cad + " and estilo LIKE '%"&request.querystring("estilo")&"%'"

end if


set rs = cnn.execute(cad)

Response.ContentType = "application/json"
Response.Write "{"&JSONData(rs, """data""")&"}"




%>