<!--#include virtual="/includes/JSON_2.0.4.asp"-->
<!--#include virtual="/includes/JSON_UTIL_0.1.1.asp"-->
<!--#include virtual="/database.asp"-->
<% 
dim email: email=request.Form("email")
dim password: password=request.Form("password")
dim name: name=request.Form("name")'
dim responseJson
dim rulesArray: rulesArray = Array(Array("email","Not a valid email or Email already exists"),Array("name","Not a valid password"),Array("password","Not a valid password"))
dim validationResult : set validationResult = validate(rulesArray)
if validationResult("Success")="failed" then
	set responseJson = validationResult
	responseJson("data") = email&password&name
else
	dim conn : set conn = newConnection()
	dim rs : set rs = conn.execute("insert into users(`FullName`,`Email`,`Password`,`CreatedAt`) values ('"&name&"','"&email&"','"&password&"','"&NOW()&"')")
	set responseJson = jsObject()
	responseJson("Success")= "success"
	responseJson("Message")= "User logged in at " & NOW()
	Session("LoggedIn") = true
	Session("Time") = NOW()
	conn.close
	set rs = nothing
	set conn = nothing
	set conn = newConnection()
	set rs = conn.execute("select ID,FullName from users where email='"&email&"'")
	Session("UserID") =  rs("ID")
	Session("UserName") = rs("FullName")
end if
	responseJson.Flush
function validate(arr)
	set return = jsObject()
	Alltest = true
	for each row in arr
		test = true
		
		select case row(0)
			case "email"
				set conn = newConnection()
				if not len(email)=0 then
					set rs = conn.execute("select count(*) as `count` from users where Email in ('"&email&"')")
					if not rs.fields("count") = "0" then
						test = false
						Alltest = false
					end if
				else
					test = false
					Alltest = false
				end if
			case "password"
				if len(password)=0 then
					test = false
					Alltest = false
				end if
			case "name"
				if len(name)=0 then
					test = false
					Alltest = false
				end if
		End select
		if test=false then
			return(row(0)) = row(1)
		end if
	 Next
	if Alltest = false then
	 	return("Success") = "failed"
	else 
		return("Success") = "success"
	end if
	set validate = return
end function 
%>