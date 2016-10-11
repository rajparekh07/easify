<!--#include virtual="/includes/JSON_2.0.4.asp"-->
<!--#include virtual="/includes/JSON_UTIL_0.1.1.asp"-->
<!--#include virtual="/database.asp"-->
<%dim a: a=request("test")
for each b in split(a,", ")
	response.write(b+"<br>")
next
%>