<% 
Response.CodePage = 65001
Response.CharSet = "utf-8"
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.CommandTimeout = 900

'***********************************************************************************************
'   ESTE ES EL QUE ESTOY USANDO EN LA CASA y en EL MODELADOR
'***********************************************************************************************
dim txtConexion 
txtConexion = "Provider=SQLOLEDB; Data Source=SERVSQL\MSSQLSERVER1 ; Initial Catalog=rhin; User id=SA; Password=F3QY17" 
 Cnn.Open txtConexion

Set RS = Server.CreateObject("ADODB.Recordset")
	RS.ActiveConnection = Cnn
	RS.CursorType       = 3 'CONST adOpenStatic = 3
	RS.LockType         = 1 'CONST adReadOnly = 1
	RS.CursorLocation   = 3 'CONST adUseClient = 3
set txtConexion = nothing

Function JSONData(ByVal rs, ByVal labelName)
		Dim data, columnCount, colIndex, rowIndex, rowCount, rsArray
		If Not rs.EOF Then
			data = labelName & ":["
			rsArray = rs.GetRows() 
			rowIndex = 0
		
			rowCount = ubound(rsArray,2)
			columnCount = ubound(rsArray,1)
			For rowIndex = 0 to rowCount
				data = data & "{"
			  
			   For colIndex = 0 to columnCount
					data = data &  """" & rs.Fields(colIndex).Name & """" & ":""" & rsArray(colIndex,rowIndex) & """"
					If colIndex < columnCount Then
						data = data & ","
					End If
			   Next 
			   data = data & "}"
			   If rowIndex < rowCount Then
					data = data & ","
			   End If
			Next 
			data = data & "]"
			rs.Close
		End If
			
		JSONData = data
	End Function


%>
<% session.LCID = 2057 %>