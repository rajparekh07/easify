<!--#include virtual="/includes/JSON_2.0.4.asp"-->
<!--#include virtual="/includes/JSON_UTIL_0.1.1.asp"-->
<!--#include virtual="/database.asp"-->
<!--#include virtual="/includes/verifyAuthentication.asp"-->
<%
dim postID: postID = request.Form("postID")
dim comment: comment = request.Form("comment")
dim AuthorID: AuthorID = Session("UserID")
dim rows: set rows = queryToJson(newConnection(),"select ID from posts where ID = "&postID&"")
dim responseJson: set responseJson = jsObject()
if len(rows.jsstring)<3 then
	responseJson("Success") = "Failed"
	responseJson("Message") = "Invalid Post ID."
else if len(comment)=0 then
	responseJson("Success") = "Failed"
	responseJson("Message") = "Comment is empty."
else 
	set rs = server.createObject("ADODB.Recordset")
	rs.open "comments",newConnection(),0,3,2
	rs.addnew
	rs("Content") = comment
	rs("AuthorID") = AuthorID
	rs("PostID") = postID
	rs("CreatedAt") = NOW()
	rs.update
	rs.movenext
	rs.close
	responseJson("Success") = "Success"
	responseJson("Message") = "New comment added!"
 end if
 end if
 	responseJson.flush
%>