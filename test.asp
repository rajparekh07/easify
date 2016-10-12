<!--#include virtual="/includes/JSON_2.0.4.asp"-->
<!--#include virtual="/includes/JSON_UTIL_0.1.1.asp"-->
<!--#include virtual="/database.asp"-->
<!-- [<%
'queryToJson(newConnection(),"select * from users").flush
'response.write(",")
'queryToJson(newConnection(),"select * from posts").flush
'response.write(",")
'queryToJson(newConnection(),"select * from tags").flush

%>] -->
<%
ba = "78"
set a = queryToJson(newConnection(),"select distinct `posts`.*,`users`.`FullName`,`users`.`Email` from (((`posts`) inner join `post_tag` on `posts`.`ID` = `post_tag`.`PostID`) inner join `tags` on `tags`.`ID` = `post_tag`.`TagID`) inner join `users` on `users`.`ID` = `posts`.`AuthorID` where `posts`.`ID` in ("&ba&")")
a("Success") = "Success"
a.flush
%>