<% @Language= "VBscript" %> 
<%  'Class Database, used to create a new database connection and easily manipulate using SQL queries'
	class Database
		private mDbName
		private conn,res,connString
			private property get databaseName()
				databaseName = mDbName
			end property
			public property get recordSet()
				set recordSet = res
			end property
			public property get connection()
				set connection = conn
			end property
			'Function used to execute a query on database'
			public function execute(query)
				set execute = conn.execute(query) 
			end function
			'Constructor'
			 Public Default function Init()
			 	 mDbName = "database/mainDatabase.accdb"
				set conn = server.createObject("ADODB.Connection")
				connString = "Provider=Microsoft.ACE.OLEDB.12.0; " & "Data Source=" & Server.MapPath(databaseName())
				conn.open connString
				set res = server.createObject("ADODB.RecordSet")
				set Init = me
			end function
	end class
%>