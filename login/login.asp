<!--#include virtual="/includes/JSON_2.0.4.asp"-->
<!--#include virtual="/includes/JSON_UTIL_0.1.1.asp"-->
<!--#include virtual="/database.asp"-->
<% 
dim email: email=LCase(Trim(request.Form("email")))
dim password: password=request.Form("password")
dim responseJson
dim rs,conn
dim rulesArray: rulesArray = Array(Array("Authenticate","Incorrect Email or Password"))
dim validationResult : set validationResult = validate(rulesArray)
if validationResult("Success")="failed" then
	set responseJson = validationResult
else
	set responseJson = jsObject()
	responseJson("Success")= "Success"
	responseJson("Message")= "User logged in at " & NOW()
	Session("LoggedIn") = true
	Session("Time") = NOW()
	set conn = newConnection()
	set rs = conn.execute("select ID,FullName from users where `email` = '"&email&"'")
	Session("UserID") =  rs("ID")
	Session("UserName") = rs("FullName")
	rs.close
end if
	responseJson.Flush
function validate(arr)
	set return = jsObject()
	test = true	
	set conn = newConnection()
	set rs = conn.execute("select count(*) as `count` from users where `Email` ='"&email&"' and `Password` = '"&password&"'")
	if rs.fields("count") = 0 then
		test = false
		return(arr(0)(0)) = arr(0)(1)
	 	return("Success") = "failed"
	else 
		return("Success") = "success"
	end if
	rs.close
	conn.close
	set rs=nothing
	set conn=nothing

	set validate = return
end function 
%>