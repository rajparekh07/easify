<% 
call redirectIFAuthenticated
sub redirectIFAuthenticated()
   	IF Session("LoggedIn")=True then 
   		response.redirect("/")
   	end If
end sub
%>