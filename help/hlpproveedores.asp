<!--#include file="../includes/Cnn.inc"-->
<%
set rs = cnn.execute("select AC_CCODIGO,AC_CNOMBRE,AC_CDIRECC from rsconcar..cp0001maes where ac_cvanexo='p' and ac_ccodigo like '%"&request.queryString("filtro")&"%'")
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	
	<link rel="stylesheet" href="../css/styles.css">
	<style>
		td{
			transition:all .15s ease-in;
			padding:.6rem .8rem
		}
		tr:hover{
			background:#a5a5a5;
		}
		button{
			transition: all .25s ease-in;
			cursor: pointer;
			padding: .6rem .8rem;
			margin-left: 1rem;
			border:1px solid #333;
			background:#fff;
		}
		button:hover{
			
			background: tomato;
			box-shadow: 0px 2px 2px #111;
			transform: translateY(1px);
		}
	</style>
</head>
<body>
	<%	
	columnas = rs.Fields.Count
	LIMITE =  COLUMNAS-1
	total=0
	
	%>
	<div style="display: flex;margin-left:  3rem;margin-top: 1rem;margin-bottom: 1rem">
		<span style="margin-right:  1rem;">Buscar </span>
		<input type="text" id="txtbuscar" class="input" style="width:200px;" value="<%=request.queryString("filtro")%>">
		<button class="input" onclick="buscar(document.getElementById('txtbuscar').value)">Buscar</button>
	</div>
    <table class="table">
    	<tr  style="background: #333;color:#fff">
	        <td align="center">Codigo</td>
	        <td align="center">Nombre</td>
	        <td  align="center">Direccion</td>
	    </tr>
	   <%DO WHILE NOT RS.EOF%>
	   	<% ruc=RS.FIELDS.ITEM(0)
		   razon=RS.FIELDS.ITEM(1)
		   %>
		 <tr class="hover" ondblclick="get('<%=RS.FIELDS.ITEM(0)%>','<%=RS.FIELDS.ITEM(1)%>')">
		 <%total=total+1%>
			<%FOR i=0 TO LIMITE%>
				<td class="estilo5">
					<%=RS.FIELDS.ITEM(I)%>
				</td>
			<%NEXT%>
		</tr>
		<%RS.MOVENEXT%>
		<%LOOP%>
    </table>
	<%=response.write(total)%>
    <script type="text/javascript">
    	function get(ruc,razon){
			//alert(ruc+" "+razon);
    		window.opener.document.getElementById("txtproveedor").value=ruc.trim();
			window.opener.document.getElementById("lblproveedor").innerText="Proveedor: "+razon;
			window.opener.document.getElementById("txtproveedor").readOnly =true;
    		window.close();
    	}
    	function buscar(filtro){
    		window.location="./hlpproveedores.asp?filtro="+filtro;
    	}

		<%
		
	if total = 1 then
		%>
		get('<%=Ruc%>'.trim(),'<%=razon%>'.trim())
		<%
	end if
	
	%>
    </script>
</body>
</html>