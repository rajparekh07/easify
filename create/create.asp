<!--#include virtual="/includes/JSON_2.0.4.asp"-->
<!--#include virtual="/includes/JSON_UTIL_0.1.1.asp"-->
<!--#include virtual="/database.asp"-->
<!--#include virtual="/includes/verifyAuthentication.asp"-->
<% 
dim title: title=request.Form("title")
dim post: post=request.Form("post")
dim tags: tags=LCase(Trim(request("tags")))
dim authorID: authorID=Session("UserID")
dim updateAT: updateAT=NOW()
dim createAT: createAT=NOW()
dim responseJson: set responseJson = jsObject()
dim test: test=true
if len(title)<4 then
	test = false
	responseJson("Title") = "Title is too short"
else if len(post)<12 then
	test = false
	responseJson("post") = "post is too short"
end if
if test=true then
	dim conn: set conn = newConnection()
	dim rs: set rs = server.createObject("ADODB.recordset")
	rs.open "posts",conn,0,3,2
	rs.addNew
	rs("Title") = title
	rs("Content") = post
	rs("AuthorID") = authorID
	rs("UpdatedAT") = updateAT
	rs("CreatedAT") = createAT
	rs.update
	dim postID : postID = rs("ID")
	rs.movenext
	rs.close
	dim tagID
	if not instr(tags,",") = 0 then
		for each tag in split(tags,", ")
			set rs = conn.execute("select count(*) as `count` from tags where `TagName`='"&tag&"'")
			if rs("count") = "0" then
				rs.close
				rs.open "tags",conn,0,3,2
				rs.addNew
				rs("TagName") = tag
				rs("Description") = tag
				rs.update
				tagID = rs("ID")
				rs.movenext
				rs.close
			else 
				rs.close
				set rs = conn.execute("select `ID` from tags where `TagName`='"&tag&"'")
				rs.movefirst
				tagID = rs("ID")
				rs.close
			end if
				set rs = conn.execute("insert into `post_tag`(`PostID`,`TagID`) values('"&postID&"','"&tagID&"')")
		next
		
	else
		set rs = conn.execute("select count(*) as `count` from tags where `TagName`='"&tags&"'")
			if rs("count") = "0" then
				rs.close
				rs.open "tags",conn,0,3,2
				rs.addNew
				rs("TagName") = tags
				rs("Description") = tags
				rs.update
				tagID = rs("ID")
				rs.movenext
				rs.close
			else 
				rs.close
				set rs = conn.execute("select `ID` from tags where `TagName`='"&tags&"'")
				rs.movefirst
				tagID = rs("ID")
				rs.close
			end if
				set rs = conn.execute("insert into `post_tag`(`PostID`,`TagID`) values('"&postID&"','"&tagID&"')")
	end if
	responseJson("Success") = "Success"
	responseJson("Message") = "A new post added at "& createAT
	else
	responseJson("Success") = "Failed"
end if
	responseJson.flush
end if
%>