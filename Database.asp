<% 
	function newConnection()
	 	 mDbName = "database/mainDatabase.accdb"
		set conn = server.createObject("ADODB.Connection")
		connString = "Provider=Microsoft.ACE.OLEDB.12.0; " & "Data Source=" & Server.MapPath("data")
		conn.open connString
		set newConnection = conn
	end function

%>