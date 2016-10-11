<% 
	IF Session("LoggedIn")=True then
		Session.Abandon
	End If
		response.redirect("/")
%>
