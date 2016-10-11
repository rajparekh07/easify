<%

call verifyAuthentication
sub verifyAuthentication()
   	IF not Session("LoggedIn")=True then 
   		response.redirect("/login")
end If
end sub
%>