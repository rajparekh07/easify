<!--#include virtual="/includes/JSON_2.0.4.asp"-->
<!--#include virtual="/includes/JSON_UTIL_0.1.1.asp"-->
<!--#include virtual="/database.asp"-->
<!--#include virtual="/includes/verifyAuthentication.asp"-->
<%
	dim postID: postID = request("PostID")
	dim all: all = request("all")
	if all="true" or all=true then
		set responseJson = queryToJson(newConnection(),"SELECT post_tag.*, tags.*, posts.*, users.ID, users.FullName, users.Email FROM users INNER JOIN (tags INNER JOIN (posts INNER JOIN post_tag ON posts.ID = post_tag.PostID) ON tags.ID = post_tag.TagID) ON users.ID = posts.AuthorID ")
	else 
		set responseJson = queryToJson(newConnection(),"SELECT post_tag.*, tags.*, posts.*, users.ID, users.FullName, users.Email FROM users INNER JOIN (tags INNER JOIN (posts INNER JOIN post_tag ON posts.ID = post_tag.PostID) ON tags.ID = post_tag.TagID) ON users.ID = posts.AuthorID WHERE (((posts.ID) in ("&postID&")))")
		
	end if
	if len(responseJson.jsstring)>2 then
		responseJson("Success") = "Success"
		responseJson.flush
	else 
		responseJson("Success") = "Failed"
		responseJson.flush
	end if
%>