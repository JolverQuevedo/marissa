<!--#include file = "../includes/Cnn.inc"-->  <% 
cad = "select * from guia where cliente like '%" & request.queryString("cliente") & "%' and po like '%" & request.queryString("po") & "%' and estilo like '%" & request.queryString("estilo") & "%'"
'response.write(cad)
set rs = cnn.execute(cad)
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
	%>
	<div style="display: flex;margin-left:  3rem;margin-top: 1rem;margin-bottom: 1rem">
		<span style="margin-right:  1rem;">Cliente </span>
		<input type="text" id="txtbuscar1" class="input" style="width:200px;" value="<%=request.queryString("cliente")%>">
        <span style="margin-right:  1rem;">PO </span>
        <input type="text" id="txtbuscar2" class="input" style="width:200px;" value="<%=request.queryString("po")%>">
        <span style="margin-right:  1rem;">Estilo </span>
        <input type="text" id="txtbuscar3" class="input" style="width:200px;" value="<%=request.queryString("estilo")%>">

		<button class="input" onclick="buscar(document.getElementById('txtbuscar1').value,document.getElementById('txtbuscar2').value,document.getElementById('txtbuscar3').value)">Buscar</button>
	</div>
    <table class="table">
    	<tr  style="background: #333;color:#fff">
	        <th>presupuesto </th>
            <th>cliente </th>
            <th>po </th>
            <th>estilo </th>
            <th>serie </th>
            <th>numdoc </th>
            <th>proveedor </th>
            <th>fecha_emision </th>
            <th>fecha_traslado </th>
            <th>nro_orden</th>
            <th>corte</th>
            <th>num_prendas </th>
            <th>tip_servicio</th>
	    </tr>
	   <%DO WHILE NOT RS.EOF%>
		 <tr class="hover" ondblclick="get(' <%= RS.FIELDS.ITEM(1) %> ',' <%= RS.FIELDS.ITEM(2) %> ',' <%= RS.FIELDS.ITEM(3) %> ',' <%= RS.FIELDS.ITEM(6) %> ',' <%= RS.FIELDS.ITEM(9) %>' ,' <%= RS.FIELDS.ITEM(0) %> ')">
			<%FOR i=0 TO LIMITE%>
				<td class="estilo5">
					<%=RS.FIELDS.ITEM(I)%>
				</td>
			<%NEXT%>
		</tr>
		<%RS.MOVENEXT%>
		<%LOOP%>
    </table>
    <script type="text/javascript">
    	function get(cliente,po,estilo,proveedor,nroorden,presupuesto){
    		window.opener.document.getElementById("txtcliente").value=cliente;
			window.opener.document.getElementById("txtpo").value=po;
			window.opener.document.getElementById("txtestilo").value =estilo;
			if(window.opener.document.getElementById("txtproveedor") && window.opener.document.getElementById("txtnro_orden")){
				window.opener.document.getElementById("txtproveedor").value =proveedor;
				window.opener.document.getElementById("txtnro_orden").value =nroorden;
				window.opener.document.getElementById("txtpresupuesto").value =parseFloat(presupuesto);
				
			}
			
    		window.close();
    	}
    	function buscar(cliente,po,estilo){
    		window.location="./hlpguia.asp?cliente="+cliente+"&po="+po+"&estilo="+estilo;
    	}
    </script>
</body>
</html>